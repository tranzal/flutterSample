package com.sample.blog

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.sample.test"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler{
                    methodCall, result ->
                when(methodCall.method){
                    "sample" -> {
                        Log.d("코틀린 : ", methodCall.argument<String>("data").toString())
                        result.success("성공")
                    }

                    else -> result.notImplemented()
                }
            }
    }
}
