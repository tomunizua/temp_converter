# Temperature Converter App
This repository contains the code for a Flutter-based Temperature Converter app that converts temperatures between Fahrenheit and Celsius. It provides users the ability to enter a temperature, choose the conversion type, view the result, and track the history of conversions.

## Introduction
The Temperature Converter App is a simple tool built using Flutter. It allows users to convert temperatures between Fahrenheit and Celsius using a straightforward and intuitive interface. It also stores the history of conversions, providing an accessible record for the user.

## Features
1. Convert temperatures from Fahrenheit to Celsius and vice versa.
2. A simple and responsive user interface.
3. Conversion history to track past temperature conversions.

## Code Architecture
This app follows a typical Flutter architecture with a StatelessWidget to define the app structure and a StatefulWidget to manage user inputs and conversions.

## Key Components:
1. TempConverterApp: The root widget of the app that manages the overall structure and routes.
2. TempConverterHomePage: The home page where all conversion logic and input handling occurs.
3. _TempConverterHomePageState: The stateful logic that handles user interaction, temperature conversions, and state updates.

## Conversion Logic:
The app uses basic arithmetic to perform temperature conversions:
Fahrenheit to Celsius: C = (F - 32) * 5 / 9
Celsius to Fahrenheit: F = (C * 9 / 5) + 32
Each conversion is stored in a list for display in the history section.

# Installation
## Prerequisites:
1. Flutter SDK
2. Compatible IDE (VSCode, Android Studio)

## Steps:
1. Clone the repository:
```
git clone https://github.com/your-username/temp_converter.git
```
3. Navigate to the project directory:
```
cd temp_converter
```
5. Run the app:
```
flutter run
```

# Components
1. Text Field for Input:
Allows users to input a temperature value.
Controlled using TextEditingController to track user input.
2. Radio Buttons:
Allows users to select the conversion type (Fahrenheit to Celsius or Celsius to Fahrenheit).
3. Convert Button:
Triggers the conversion when pressed.
Conversion logic is handled in _convert().
4. Conversion History:
A list that tracks all conversions performed in the session.
Utilizes ListView.builder to dynamically generate history entries.
