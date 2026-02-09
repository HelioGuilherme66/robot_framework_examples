# SikuliLibrary Examples

## Intro

This project consists in Robot Framework and SikuliLibrary test suites. It has two test suites, one at `Local` directory, to launch a browser and interact with a Web App, from the local system running Robot Framework. The other, at `Remote` directory, does the same interaction, but using a remote connection via the Remote Desktop Protocol (RDP).

The test suites were tested in a Fedora Linux 42 with Robot Framework 7.4.1 and Python 3.13.11.

We have a recording of the `Remote` test suite [here](./todont/_images/todont_Remote.webm).

## File structure
```
SikuliLibrary/
             ├── README.md
             └── todont
                 ├── _images
                 │   ├── add.png
                 │   ├── login_passwd.png
                 │   ├── remmina_icon.png
                 │   ├── todont_Remote.webm
                 │   ├── windows_menu.png
                 │   └── windows_search_white.png
                 ├── Local
                 │   └── todont_React.robot
                 └── Remote
                     ├── rdp.remmina
                     ├── rdp.sh
                     ├── remote.resource
                     └── todont_Remmina.robot
```

