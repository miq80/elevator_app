package com.example.house_app
import android.app.NotificationChannel
import android.app.NotificationManager
import android.os.Build
import android.os.Bundle
import android.os.PersistableBundle
import java.time.LocalDateTime
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.example.house_app.AndroidElevatorScheduler
import java.time.format.DateTimeFormatter

class MainActivity: FlutterActivity() {
    private val CHANNEL = "elevator_channel"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        createNotificationChannel()
    }
    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channelId = "elevator_id"
            val channelName = "Elevator"
            val importance = NotificationManager.IMPORTANCE_DEFAULT
            val channel = NotificationChannel(channelId, channelName, importance)

            val notificationManager = getSystemService(NotificationManager::class.java)
            notificationManager.createNotificationChannel(channel)
        }
    }
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Set up the MethodChannel with the same name as defined in Dart
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->

            println(call.method)
            if (call.method == "getDataFromNative") {
                // Perform platform-specific operations and obtain the result
                val time = call.argument<String>("time");
                println(time)
                val formatter = DateTimeFormatter.ISO_DATE_TIME
                val parsedTime = LocalDateTime.parse(time, formatter)

                val message = call.argument<String>("message")

                var item = message?.let { ElevatorItem(parsedTime, it) };
                println(item)
                if (item != null) {
                    AndroidElevatorScheduler(context).schedule(item)
                };

            } else {
                result.notImplemented()
            }
        }
    }

}
