package com.teslake.mercadopago_services

import android.app.Activity
import android.content.Context
import android.util.Log
import androidx.annotation.NonNull
import com.mercadopago.android.px.model.CardToken
import com.mercadopago.android.px.model.SavedCardToken
import com.mercadopago.android.px.model.Token
import com.mercadopago.android.px.model.exceptions.ApiException
import com.mercadopago.android.px.services.Callback
import com.mercadopago.android.px.services.MercadoPagoServices
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding


/** MercadopagoServicesPlugin */
class MercadopagoServicesPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private lateinit var activity: Activity


    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "mercadopago_services")
        channel.setMethodCallHandler(this)
    }


    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "createToken" -> {
                val args = call.arguments as HashMap<String, Any>
                val cardNumber = args["cardNumber"] as String
                val cardholderName = args["cardholderName"] as String
                val cardExpirationMonth = args["cardExpirationMonth"] as Int
                val cardExpirationYear = args["cardExpirationYear"] as Int
                val securityCode = args["securityCode"] as String
                val publicKey = args["publicKey"] as String
                createToken(
                    publicKey,
                    cardNumber,
                    cardholderName,
                    cardExpirationMonth,
                    cardExpirationYear,
                    securityCode,
                    result,
                )
            }
            "createSavedCardToken" -> {
                val args = call.arguments as HashMap<String, Any>
                val cardId = args["id"] as String
                val securityCode = args["securityCode"] as String
                val publicKey = args["publicKey"] as String
                createSavedCardToken(publicKey, cardId, securityCode, result)
            }
            "getPlatformVersion" -> {
                result.success("Android ${android.os.Build.VERSION.RELEASE}")
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    private fun createToken(
        publicKey: String,
        cardNumber: String,
        cardholderName: String,
        cardExpirationMonth: Int,
        cardExpirationYear: Int,
        securityCode: String,
        result: MethodChannel.Result
    ) {
        val mpServices = MercadoPagoServices(context, publicKey, null)
        val cardToken = CardToken(
            cardNumber,
            cardExpirationMonth,
            cardExpirationYear,
            securityCode,
            cardholderName,
            "",
            ""
        )
        mpServices.createToken(cardToken, object : Callback<Token?>() {
            override fun success(token: Token?) {
                Log.d("MP TOKEN SUCCESS", "SUCCESS" + token!!.id)
                result.success(token!!.toJson())
            }

            override fun failure(apiException: ApiException) {
                Log.d("MP TOKEN ERROR", apiException.toString())
                result.error("CARD TOKEN ERR", apiException.message, null)
            }
        })
    }

    private fun createSavedCardToken(
        publicKey: String,
        cardId: String,
        securityCode: String,
        result: MethodChannel.Result
    ) {
        val mpServices = MercadoPagoServices(context, publicKey, null)
//        val cardToken = SavedCardToken("1657736829196", "123")
        val cardToken = SavedCardToken(cardId, securityCode)
        mpServices.createToken(cardToken, object : Callback<Token?>() {
            override fun success(token: Token?) {
                Log.d("MP TOKEN SUCCESS", "SUCCESS" + token!!.id)
                result.success(token!!.toJson())
            }

            override fun failure(apiException: ApiException) {
                Log.d("MP TOKEN ERROR", apiException.toString())
                result.error("CARD TOKEN ERR", apiException.message, null)
            }
        })
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity;
    }

    override fun onDetachedFromActivity() {
        TODO("Not yet implemented")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        TODO("Not yet implemented")
    }

    override fun onDetachedFromActivityForConfigChanges() {
        TODO("Not yet implemented")
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        TODO("Not yet implemented")
    }
}
