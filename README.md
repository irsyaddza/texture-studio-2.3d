# `Texture-Studio`

[New thread](https://forum.open.mp/showthread.php?tid=174), since the previous thread was deleted by your king. 

# Texture-Studio Enhanced

A fork of Texture-Studio 1.9, based on the last official release from two years ago. This project aims to modernize and improve the original by fixing numerous bugs, adding new features, and updating compatibility while preserving its core functionality. Development continues with a focus on stability, usability, and long-term maintenance.

## What's New

* Migrated the YSI Framework to the latest version.
* Fixed map importing so material text is now rendered correctly.
* Fixed texture assignment in **Texturing Mode** when using **Search** and **Theme**, which now applies textures as intended.
* Fixed adding textures to **Theme Textures**, which now works correctly.
* Added many shortcut commands, such as `/co` for `/cobject`, `/eo` for `/editobject`, and many more.
* Added the `/tsm` command to quickly open the **Texture Selection Mode** textdraw interface.
* Added the `/vw` and `/int` commands for quickly changing virtual world and interior.
* Added the `/gotoco` command for quick navigation.
* Fixed an issue where **3DTextLabels** could not be hidden after importing a map.
* Fixed an issue where texture indexes were assigned incorrectly.
* Added support for keyboards without a numeric keypad, allowing **Next Page** and **Previous Page** actions in **Texturing Mode**. This works as expected on Android clients. Space + H to **Next Page** and Space + Y to **Previous Page**.

## Contributors

* **[uL]Pottus** — Original (OG) Version
* **Crayder** — Original (OG) Version
* **Arofta** — Enhanced Version (maintenance, bug fixes, new features, and modernization)
* **irsyaddza** — Dockerization & Container Orchestration (containerized deployment, real-time log streaming pipeline, and environment architecture)

## Docker Deployment

The server can be deployed seamlessly within an isolated container environment using Docker Compose:

1. **Build and start the container:**
   ```bash
   docker compose up -d --build
   ```
2. **Monitor server logs in real time:**
   ```bash
   docker compose logs -f
   ```
   *Logs are also automatically persisted to `./logs/server_log.txt` on the host machine.*

## Linux Installation (LemeHost and Others)

* Locate the `linux-server.cfg` file in the root directory of the gamemode.
* Delete the existing `server.cfg` file, then rename `linux-server.cfg` to `server.cfg`.
* Done! You're ready to start the server.

## Report Issues

* If you encounter any issues, you can report them by DMing **@arofta_** on Discord, or visit the **Texture Studio Enhanced** forum in the **Sharing** channel directly: [Texture Studio Enhanced Forum](https://discord.com/channels/1249653782594191410/1532122021071421521)


