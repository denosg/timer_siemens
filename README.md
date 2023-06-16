# Stopwatch and Countdown App Documentation

## Overview
The Stopwatch and Countdown app is designed to provide users with a reliable stopwatch and countdown timer functionality. The app utilizes the Flutter framework and Riverpod state management to ensure efficient and flexible management of app state. This documentation provides an in-depth guide on how to use and navigate the app, outlining its key features and functionalities.

## Key Features
The Stopwatch and Countdown app offers the following key features:

1. Stopwatch: Allows users to start, pause, reset, and record laps during stopwatch operation.
2. Countdown Timer: Provides users with the ability to set countdown timers, pause, reset, and manage preset timers.
3. Preset Timers: Enables users to create, save, delete, and download preset timers for repeated use.
4. Data Persistence: Utilizes SQLite database and local storage to ensure preset timers are retained even when the app is closed and reopened.

## Installation and Setup
To install and set up the Stopwatch and Countdown app, follow these steps:

1. Clone the project repository from [GitHub](https://github.com/your-repo).
2. Ensure you have the Flutter SDK and necessary dependencies installed on your machine.
3. Open the project in your preferred IDE or text editor.
4. Run `flutter pub get` in the terminal to fetch the project dependencies.
5. Connect your mobile device or emulator.
6. Run `flutter run` in the terminal to launch the app on the connected device.

## Stopwatch
The Stopwatch feature allows users to measure elapsed time, record laps, and reset the stopwatch. Follow the instructions below to use the stopwatch:

1. On the app's home screen, locate and tap the "Stopwatch" button.
2. The Stopwatch screen will appear with three buttons: "Start/Pause," "Lap," and "Reset."
3. Tap the "Start/Pause" button to start the stopwatch. The button will change to a "Pause" button during active stopwatch operation, allowing you to pause and resume as needed.
4. To record a lap, tap the "Lap" button. Each lap will be added to a list of laps displayed on the screen.
5. To reset the stopwatch, tap the "Reset" button. This will stop the stopwatch and clear the lap list.

## Countdown Timer
The Countdown Timer feature allows users to set timers, manage preset timers, and customize countdown settings. Follow the instructions below to use the countdown timer:

1. On the app's home screen, locate and tap the "Countdown Timer" button.
2. The Countdown Timer screen will appear, displaying a vertical list wheel to choose the desired countdown time.
3. Select the desired time by scrolling through the list wheel.
4. Tap the "Start" button to begin the countdown. The button will change to display two options: "Reset Countdown" and "Pause Countdown."
5. To reset the countdown, tap the "Reset Countdown" button.
6. To pause and resume the countdown, tap the "Pause Countdown" button.
7. To manage preset timers, tap the action button located at the top-right corner of the screen.
8. In the preset timer management screen, you can add, delete, and download preset timers.
   - To add a preset timer, tap the "Add Preset" button and follow the on-screen instructions.
   - To delete a preset timer, long-press on the desired timer and confirm the deletion in the prompted alert dialog.
   - To download preset timers, go to the "Actions" tab and tap the "Download Presets" button. The presets will be saved in the local storage of the app's folder as preffered_timers.txt file.

# Theme Selection

The Stopwatch and Countdown app offers a theme selection feature to cater to users' preferences for either light or dark mode. The app automatically adapts its color scheme based on the system-wide preference set on the user's mobile device. This section of the documentation explains how the theme selection works and how users can customize the app's appearance.

## System Theme Adaptation
The Stopwatch and Countdown app dynamically adjusts its color scheme based on the system-wide theme preference set on the user's device. If the user has their device set to the light mode, the app will display a light-themed interface. Similarly, if the user has their device set to the dark mode, the app will present a dark-themed interface. This seamless adaptation ensures a consistent and visually appealing user experience.


## Data Persistence
The Stopwatch and Countdown app ensures data persistence by utilizing an SQLite database and local storage. This ensures that preset timers are retained even when the app is closed and reopened. The preset timers will be available for use, and any modifications made to them will be saved automatically.

## Conclusion
The Stopwatch and Countdown app provides users with a convenient and user-friendly stopwatch and countdown timer experience. With Riverpod state management, efficient app state handling is achieved, and preset timers are seamlessly stored and accessible across app sessions. Furthermore, the Stopwatch and Countdown app offers system theme adaptation, allowing users to enjoy the app in their preferred light or dark mode. Whether users prefer a lighter or darker interface, the app seamlessly adjusts its color scheme to provide optimal readability and aesthetics. This flexibility enhances the overall user experience and ensures that users can comfortably use the app based on their visual preferences. By following this documentation, users will be able to fully utilize the app's key features and enjoy accurate time tracking and countdown functionality.

# Photos
## Light Mode

<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246398953-8d354ca0-a0b1-4394-a90e-c98ceaf53aba.png" width="197"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246399123-277da8f7-3685-4df3-bb43-1d6288ef3da6.png" width="197"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246399306-81f48962-3179-4a8c-8e64-a4a1e391e217.png" width="197"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246399766-29b4bcb0-4f80-4dee-b582-91bf15ce2b81.png" width="197"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246399550-7558d8d7-af68-456c-aa26-472a6ffd2673.png" width="197"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246400047-e44ccb46-eadd-4a59-a33f-8170dd3c692a.png" width="197"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246400109-3fe39156-0389-4744-ad23-e128296ce840.png" width="197"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246400202-c33abe76-7686-4736-8d7e-c77cbf63dbed.png" width="197"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246400273-5a65ebb6-a62d-4a38-8395-3b5dda4822de.png" width="197"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246400336-a152485b-d6ff-40cc-ad2c-405b32f3d04c.png" width="197"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246400415-16e2fd4f-be9d-493d-884c-bed7a74c9ebc.png" width="197">

## Dark Mode

<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246400489-771870da-53f6-45e5-a1d2-0a631bfce011.png" width="197"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246400581-dc34ade0-7117-4239-aee6-319221b7f3f2.png" width="197"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246400654-77b1732c-3b64-4037-b0b4-145fb3f562c3.png" width="197"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246400726-f0777953-6f66-4e00-bf6f-488bce21cae2.png" width="197"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246400815-7389ba5c-f345-4395-8f53-82c2aa90714d.png" width="197"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/81863134/246400883-19fd39c9-84b8-4f87-a9d5-6706568e9448.png" width="197"> 

## Video
https://youtu.be/IuXaDMU0jI8















