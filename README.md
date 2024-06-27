# Flutter FakeAPI App

This is a Flutter application that retrieves persons from FakeAPI (https://fakerapi.it/en) and displays them in a list/table.

## Features

- Fetches initial data of 20 persons on the first load.
- Implements infinite scrolling to fetch the next set of data.
- Displays a message when no more data is available.
- Allows pull-to-refresh (mobile) and refresh button (web) to clear the list and fetch the first page.
- Shows person details on a new screen when an item is selected.

## Platforms Supported

- Android
- iOS
- Web

## Running the Application

1. Click the **Code** button on the GitHub repository page and download the ZIP file.
2. Extract the ZIP file to your desired location.
3. Open the extracted folder in Visual Studio Code.
4. Run the application using the following commands:

```sh
flutter pub get
flutter run
