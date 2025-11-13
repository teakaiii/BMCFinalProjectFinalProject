# Project Blueprint

## Overview

This document outlines the structure, features, and design of the Flutter eCommerce application. It serves as a single source of truth for the project's current state and future development plans.

## Implemented Features

### Firebase Integration

- **Firebase Core:** The application is connected to a Firebase project.
- **Firebase Authentication:** User authentication is handled via Firebase.
- **Cloud Firestore:** The app uses Firestore as its primary database.
- **Firebase Options:** The `firebase_options.dart` file is configured for both web and Android platforms.

### VAT Calculation

- **Inclusive VAT:** The VAT is now inclusive in the item prices. The `cart_provider.dart` file has been updated to reflect this change. The `subtotal` now represents the total price including VAT, and the `vat` is extracted from the `subtotal`.

### Project Structure

- The project follows a standard Flutter structure.
- A `providers` directory contains state management classes.
- A `screens` directory holds the application's different pages.
- A `theme` directory defines the app's visual styling.
- A `widgets` directory contains reusable UI components.

### Design and Theming

- The app uses a custom color palette and typography.
- It leverages the `google_fonts` package for a modern look and feel.
- The UI is built with Material Design 3 components.
- The app is responsive and adapts to different screen sizes.

## Current Plan

- **Inclusive VAT:** The current task is to make the VAT inclusive in the order summary.
- **Logic Update:** I have updated the `cart_provider.dart` to calculate the VAT from the total price, making it inclusive.
- **Next Steps:** I will now verify the changes in the UI and ensure the order summary displays the correct values.