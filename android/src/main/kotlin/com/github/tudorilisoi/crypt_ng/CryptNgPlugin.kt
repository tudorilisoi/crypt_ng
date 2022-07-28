package com.github.tudorilisoi.crypt_ng

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.tozny.crypto.android.AesCbcWithIntegrity.*
import java.security.GeneralSecurityException

/** CryptNgPlugin */
class CryptNgPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "crypt_ng")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "decrypt" -> {
        val data = call.argument<String>("data")
        val keyString = call.argument<String>("key")

        val civ = CipherTextIvMac(data)
        try {
          val decrypted = decryptString(civ, keys(keyString))
          result.success(decrypted)
        } catch (e: GeneralSecurityException) {
          print(e)
          result.error("mac_mismatch", "Mac don't match", null)
        }
      }
      "encrypt" -> {
        val data = call.argument<String>("data")
        val keyString = call.argument<String>("key")

        val encrypted = encrypt(data, keys(keyString))

        result.success(encrypted.toString())
      }
      "generate_random_key" -> {
        val key = generateKey()
        val keyString = keyString(key)

        result.success(keyString)
      }
      "generate_salt" -> {
        val salt = generateSalt()
        val base64Salt = saltString(salt)

        result.success(base64Salt)
      }
      "generate_key_from_password" -> {
        val password = call.argument<String>("password")
        val salt = call.argument<String>("salt")

        val key = generateKeyFromPassword(password, salt)
        val keyString = keyString(key)

        result.success(keyString)
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
