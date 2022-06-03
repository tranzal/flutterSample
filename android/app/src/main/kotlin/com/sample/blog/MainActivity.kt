package com.sample.blog

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlin.math.log

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.sample.test"

   private fun threadHandler() {
       Handler(Looper.getMainLooper()).postDelayed({
           Log.d("지연 호출 : {}", "호출했으")
       }, 1000)
   }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
                requestPermissions(arrayOf(Manifest.permission.ACCESS_FINE_LOCATION), 0)
            }
        }

        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler{
                    methodCall, result ->
                when(methodCall.method){
                    "sample" -> {
                        threadHandler()
                        Log.d("코틀린 : ", methodCall.argument<String>("data").toString())
                        result.success("성공")
                    }

                    else -> result.notImplemented()
                }
            }
    }
}
