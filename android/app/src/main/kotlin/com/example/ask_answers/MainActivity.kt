package com.example.ask_answers

import io.flutter.embedding.android.FlutterActivity

import android.os.Bundle
import android.os.Build
import android.view.ViewTreeObserver
import android.view.WindowManager

import android.view.WindowManager.LayoutParams;
class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState);
        getWindow().addFlags(LayoutParams.FLAG_SECURE);
    }
}