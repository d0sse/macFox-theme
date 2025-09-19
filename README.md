# 👋 Welcome to MacFox-Theme 🖥️🦊

### Now updated for Tahoe UI

## Safari like, minimalistic theme

Hi! I'm [d0sse](https://github.com/d0sse) and this is Minimalist Mac - Safari-like - Firefox theme.

> 🚀 **UPDATED FOR FIREFOX 143**

## Features

- Simple
- Light / Dark Version
- macOS Tint Background color
- Now with automatic system macOS accent color! 🎨
- 🎀 Compatible with [The Adaptive Tab Bar Color (ATBC)](https://github.com/easonwong-de/Adaptive-Tab-Bar-Colour)

| Light Version | Dark Version |
|---|---|
|![Light Screenshot](screen-light.jpg "Screen")|![Dark Screenshot](screen-dark.jpg "Screen")|

| Light Transparent Version | Dark Transparent Version |
|---|---|
|![Light Screenshot](screen-light-transparent.jpg "Screen")|![Dark Screenshot](screen-dark-transparent.jpg "Screen")|

| Tahoe Light Transparent Version | Tahoe Dark Transparent Version |
|---|---|
|![Light Screenshot](screen-light-tahoe.jpg "Screen")|![Dark Screenshot](screen-dark-tahoe.jpg "Screen")|

> **WARNING**
> Tested Only on macOS!
---
> This theme is now **compatible with [Adaptive Tab Bar Color (ATBC)](https://github.com/aqsalose/Adaptive-Tab-Bar-Color)**.  

### How to install

To start using MacFox, follow these steps:

1. Go to the following url address `about:config`.
2. Ensure the following properties are set to `true`:

    ```text
    toolkit.legacyUserProfileCustomizations.stylesheets
    svg.context-properties.content.enabled
    browser.tabs.allow_transparent_browser
    layout.css.color-mix.enabled
    browser.theme.native-theme
    ```

3. If you want to enable the new UI for the closest match to Apple's macOS Tahoe design language, set this pref to `true`:

     ```text
    userChrome.tahoeUI.enabled
    ```

4. If you want enable macOS traslucent windows set to `true`:

    ```text
    widget.macos.titlebar-blend-mode.behind-window
    ```

5. Go to the following url address `about:support`.
6. Find "Profile Folder" section in the "Application Basics" list and copy the path (defined below as `$path`).
7. Open `terminal.app` and type:

    ```bash
    cd $path
    ```

8. Type in the following command:

    ```bash
    git clone git@github.com:d0sse/macFox-theme.git chrome
    ```

9. Apply `about blank` for New windows and new tabs.

10. Restart Firefox to apply changes.

## Privacy & Telemetry

For complete instructions on disabling all Firefox telemetry, pings, and communications to Mozilla servers, see:

➡️ [TELEMETRY.md](TELEMETRY.md)

Recommended Extensions

➡️ [EXTENSIONS.md](EXTENSIONS.md)

### Enjoy 🎉
