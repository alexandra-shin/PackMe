# PackMe! - iOS App for Travelers

> **PackMe!** is a simple iOS app designed to help travelers organize and manage their packing lists for upcoming trips.

## Tech Stack
- **Language**: Swift 6.0.2 | SwiftUI 5
- **IDE**: Xcode 16.0
- **Database**: Firestore (NoSQL) | Firebase
- **Authentication**: FirebaseAuth | Firebase
- **Design**: [Canva](https://canva.com)

## Project Structure

### 1. `Other` Folder
This folder contains media and utility files essential for the app's setup and customization:
- **GoogleService-Info.plist**: Firebase configuration file (not included for security reasons). This file connects the app with Firebase, enabling database and authentication services.
- **PackMe_app.swift**: The entry point of the app.
- **Delegate.swift**: Custom splash screen logic, showing a 3-second splash screen before navigating to the main screen.
- **Extensions.swift**: Includes utility functions, like a dictionary-to-JSON converter, used to format data for storage in Firestore.

### 2. `Models` Folder
Contains the data models representing core entities in the app:
- **Trip.swift**: Struct defining the properties of a trip.
- **User.swift**: Struct defining the properties of a user.

### 3. `ViewModels` Folder
Contains the business logic for the app, with each `ViewModel` paired with a corresponding SwiftUI view file from the `Views` folder.

- **MainViewViewModel.swift** | (Corresponding file: `Views/MainView.swift`)  
  Handles the app's main screen logic. It listens for the user's authentication state via FirebaseAuth and displays either the login screen or the user's homepage (even after closing and reopening the app).
  
- **LoginViewViewModel.swift** | (Corresponding file: `Views/LoginView.swift`)  
  Manages the login logic, including input validation:
    - Disabled user (admin control via Firestore)
    - Non-existent user
    - Invalid email format
    - Empty fields

- **RegisterViewViewModel.swift** | (Corresponding file: `Views/RegisterView.swift`)  
  Handles new user registration, including:
    - Empty field validation
    - Valid email (using regex)
    - Password length (minimum 6 characters)  
  Inserts new user data into Firestore if all conditions are met.

- **HomeScreenViewViewModel.swift** | (Corresponding file: `Views/HomeScreenView.swift`)  
  Displays trips created by the user. If no trips exist, it shows an empty "Your trips" screen (under the "Home" tab).

- **ProfileViewViewModel.swift** | (Corresponding file: `Views/ProfileView.swift`)  
  Manages profile data and logout functionality. Displays:
    - Name
    - Email
    - Member since (account creation date)

- **CreateNewTripViewViewModel.swift** | (Corresponding file: `Views/CreateNewTripView.swift`)  
  Handles creating a new trip, including data insertion into Firestore (under `users` > `current_user_id` > `trips`). Validations include:
    - Empty fields
    - Future date requirement (past dates not allowed)

- **TripViewViewModel.swift** | (Corresponding file: `Views/TripView.swift`)  
  Manages the display and interaction with individual trips, including marking trips as completed and updating the Firestore database.

### 4. `Views` Folder
Contains the user interface (UI) components, with each view paired to its corresponding `ViewModel` file.

- **MainView.swift**  
  Displays either the user's homepage (if logged in) or the login screen (if not logged in).

- **LoginView.swift**  
  Login screen with fields for email and password, along with a "Log In" button and a link to the registration screen.

- **RegisterView.swift**  
  Registration screen with fields for full name, email, and password, plus a "Create Account" button.

- **HomeScreenView.swift**  
  User's homepage, showing their trips with two tabs at the bottom: "Home" and "Profile". Users can create, edit, or delete trips.

- **ProfileView.swift**  
  Displays user's profile information and a logout button.

- **CreateNewTripView.swift**  
  Form for creating a new trip, including fields for trip title, notes, date/time, and a "Create Trip" button.

- **TripView.swift**  
  Displays individual trip details, including the title, notes, date, and a checkbox for marking the trip as completed.

- **HeaderView.swift**  
  Common header used across the login and registration screens. Makes it easier to update the header text in a single place.

- **PMButtonView.swift**  
  A reusable view for creating buttons. The PM stands for "PackMe!". This file allows easy customization of button appearance across the app.

---

## How to Run the Project
1. Clone the repository.
2. Install dependencies using the package manager in Xcode.
3. Ensure you have your Firebase `GoogleService-Info.plist` file correctly placed in the `Other` folder.
4. Open the project in Xcode and run it on a device or simulator.

---

## Features
- **User Authentication**: Powered by FirebaseAuth, allowing users to register, log in, and manage their profiles.
- **Trip Management**: Users can create trips, add notes, and track trip completion.
- **Firestore Integration**: All user data, including trips, is stored and retrieved from Firebase's Firestore NoSQL database.
- **Offline Support**: Data is cached locally, providing a seamless experience even without an internet connection.

---

## Future Enhancements
- **Push Notifications**: Notify users about upcoming trips.
- **Trip Sharing**: Allow users to share their packing lists with others.
- **Enhanced UI**: Improve the app's UI with animations and better design elements.
