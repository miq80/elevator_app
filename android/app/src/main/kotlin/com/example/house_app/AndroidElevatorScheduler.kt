package com.example.house_app

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build
import androidx.annotation.RequiresApi
import java.time.ZoneId

class AndroidElevatorScheduler(
    private val context: Context
) : ElevatorScheduler {
    private val id = 67478;
    private val elevatorManager = context.getSystemService(AlarmManager::class.java)

    override fun schedule(item: ElevatorItem) {

        var intent = Intent(context, ElevatorReceiver::class.java).apply {
            putExtra("EXTRA_MESSAGE", item.message)
        }
        val intervalMillis = (1 * 60 * 1000L)
        elevatorManager.setRepeating(
            AlarmManager.RTC_WAKEUP,
            item.time.atZone(ZoneId.systemDefault()).toEpochSecond() * 1000,
            intervalMillis,
            PendingIntent.getBroadcast(
                context,
                id,
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
            )
        );

    }

    override fun cancel(item: ElevatorItem) {
        elevatorManager.cancel(
            PendingIntent.getBroadcast(
                context,
                item.hashCode(),
                Intent(context, ElevatorReceiver::class.java),
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
        )
    }
}