# SikuliLibrary Examples

## Intro

This project consists in Robot Framework and SikuliLibrary test suites.

### Web App ToDon't

It has two test suites, one at `Local` directory, to launch a browser and interact with a Web App, from the local system running Robot Framework. The other, at `Remote` directory, does the same interaction, but using a remote connection via the Remote Desktop Protocol (RDP).

The test suites were tested in a Fedora Linux 42 with Robot Framework 7.4.1 and Python 3.13.11.

We have a recording of the `Remote` test suite [here](./todont/_images/todont_Remote.mp4).

### App My Drawing App

See the Desktop test suite  [README.md](./drawingapp/README.md).

## File structure
```
SikuliLibrary/
             ├── README.md
             ├── drawingapp
             │  ├── Android
             │  │   ├── drawingapp_scrcpy.resource
             │  │   └── drawingapp_scrcpy.robot
             │  ├── Desktop
             │  │   ├── drawingapp.resource
             │  │   └── drawingapp.robot
             │  ├── _images
             │  │   ├── app_icon.png
             │  │   ├── app_icon_windows.png
             │  │   ├── draw_app_android.mp4
             │  │   ├── draw_app_linux.mp4
             │  │   ├── scrcpy_my_drawing_app.png
             │  │   ├── scrcpy_my_drawing_app_selector.png
             │  │   ├── scrcpy_my_drawing_app_title.png
             │  │   └── scrcpy_window_icon.png
             │  └── README.md
             └── todont
                 ├── _images
                 │   ├── add.png
                 │   ├── login_passwd.png
                 │   ├── remmina_icon.png
                 │   ├── todont_Remote.mp4
                 │   ├── windows_menu.png
                 │   └── windows_search_white.png
                 ├── Local
                 │   └── todont_React.robot
                 └── Remote
                     ├── rdp.remmina
                     ├── rdp.sh
                     ├── remote.resource
                     └── todont_Remmina.robot

