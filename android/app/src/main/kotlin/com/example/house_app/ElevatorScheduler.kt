package com.example.house_app

interface ElevatorScheduler {
    fun schedule(item: ElevatorItem)
    fun cancel(item: ElevatorItem)
}