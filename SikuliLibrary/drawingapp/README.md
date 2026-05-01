# SikuliLibrary Examples

## Intro

This project consists in Robot Framework and SikuliLibrary test suites. The Desktop directory contains a test suite that uses a simple app which source code is at [AppiumLibrary Examples](https://github.com/HelioGuilherme66/robot_framework_examples/tree/master/AppiumLibrary).

The package for Windows is [here](https://transformidea.com/mydrawingapp/My%20Drawing%20App-0.0.1.msi).

The app for Android is [app-debug.apk](https://transformidea.com/mydrawingapp/app-debug.apk) and runs in Android 12 or higher.

The RPM package for Linux (tested in Fedora 42) is [mydrawingapp-0.0.1-1.fc42.x86_64.rpm](https://transformidea.com/mydrawingapp/mydrawingapp-0.0.1-1.fc42.x86_64.rpm).

### App My Drawing App

We have a recording of the `Android` test suite [here](./_images/draw_app_android.mp4).

We have a recording of the `Desktop` test suite [here](./_images/draw_app_linux.mp4).

## File structure
```
SikuliLibrary/
             └── drawingapp
                ├── Android
                │   ├── drawingapp_scrcpy.resource
                │   └── drawingapp_scrcpy.robot
                ├── Desktop
                │   ├── drawingapp.resource
                │   └── drawingapp.robot
                ├── _images
                │   ├── app_icon.png
                │   ├── app_icon_windows.png
                │   ├── draw_app_android.mp4
                │   ├── draw_app_linux.mp4
                │   ├── scrcpy_my_drawing_app.png
                │   ├── scrcpy_my_drawing_app_selector.png
                │   ├── scrcpy_my_drawing_app_title.png
                │   └── scrcpy_window_icon.png
                └── README.md
```


*TODO* The package for MacOS...

*TODO* The package for iOS...
