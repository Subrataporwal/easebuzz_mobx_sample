package com.example.farm_ops_mobx

import android.content.Intent
import android.os.Bundle
import com.easebuzz.flutter_kt_androidx_accesskey.JsonConverter
import com.easebuzz.payment.kit.PWECouponsActivity
import com.google.gson.Gson
import datamodels.PWEStaticDataModel
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject

class MainActivity : FlutterActivity() {
    private val CHANNEL = "easebuzz"
    private var channelResult: MethodChannel.Result? = null
    private var startPayment = true

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        setupMethodChannel(flutterEngine)
    }

    private fun setupMethodChannel(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            channelResult = result
            if (call.method == "payWithEasebuzz" && startPayment) {
                startPayment = false
                try {
                    startPayment(call.arguments)
                } catch (e: Exception) {
                    result.error("Error", e.message, null)
                }
            }
        }
    }

    private fun startPayment(arguments: Any) {
        try {
            val parameters = JSONObject(Gson().toJson(arguments))
            val intentProceed = Intent(this, PWECouponsActivity::class.java).apply {
                flags = Intent.FLAG_ACTIVITY_REORDER_TO_FRONT
            }
            parameters.keys().forEach { key ->
                val value = parameters.optString(key)
                if (key == "amount") {
                    val amount = parameters.optDouble("amount")
                    intentProceed.putExtra(key, amount)
                } else {
                    intentProceed.putExtra(key, value)
                }
            }
            startActivityForResult(intentProceed, PWEStaticDataModel.PWE_REQUEST_CODE)
        } catch (e: Exception) {
            handleError(e)
        }
    }

    private fun handleError(e: Exception) {
        startPayment = true
        val errorDescMap = mutableMapOf("error" to "Exception", "error_msg" to "Exception occurred: ${e.message}")
        val errorMap = mutableMapOf("result" to PWEStaticDataModel.TXN_FAILED_CODE, "payment_response" to errorDescMap)
        channelResult?.success(errorMap)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == PWEStaticDataModel.PWE_REQUEST_CODE) {
            startPayment = true
            data?.let {
                handlePaymentResponse(it)
            } ?: run {
                handleEmptyResponse()
            }
        } else {
            super.onActivityResult(requestCode, resultCode, data)
        }
    }

    private fun handlePaymentResponse(data: Intent) {
        val response = JSONObject()
        val result = data.getStringExtra("result")
        val paymentResponse = data.getStringExtra("payment_response")
        try {
            val obj = JSONObject(paymentResponse)
            response.put("result", result)
            response.put("payment_response", obj)
            channelResult?.success(JsonConverter.convertToMap(response))
        } catch (e: Exception) {
            handleResponseError(result, paymentResponse)
        }
    }

    private fun handleResponseError(result: String?, paymentResponse: String?) {
        val errorDescMap = mutableMapOf("error" to result.toString(), "error_msg" to paymentResponse.toString())
        val errorMap = mutableMapOf("result" to result.toString(), "payment_response" to errorDescMap)
        channelResult?.success(errorMap)
    }

    private fun handleEmptyResponse() {
        val errorDescMap = mutableMapOf("error" to "Empty error", "error_msg" to "Empty payment response")
        val errorMap = mutableMapOf("result" to "payment_failed", "payment_response" to errorDescMap)
        channelResult?.success(errorMap)
    }
}
