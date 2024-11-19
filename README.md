# PackMe! iOS app for travelers
> My simple iOS app that helps travelers to organize and manage their packing list for upcoming trips.

## Stack technologies
- Language: Swift 6.0.2 | SwiftUI 5
- IDE: xCode 16.0
- Database: FireStore (NoSQL) | Firebase
- Authentication: FirebaseAuth | Firebase
- Design: [Canva](https://canva.com)

## Project's Structure
- **'Other'** folder. Contains media files needed for app's splash screen, icon and backgrounds and following files:
    - ***GoogleService-Info.plist*** - Firebase config file. Not listed here for safety reasons but should be in the Project to connect app with Firebase to be able to use database and authentication services.
    - ***PackMe_app.swift*** - entry point for the app run.
    - ***Delegate.swift*** - file with custom function for the splash screen which will be showing up for 3 seconds before showing main screen.
    - ***Extensions.swift*** - contains function which converts dictionary to JSON file, to be able to store data in the collection of FireStore database.
- **'Models'** folder. Contains two .swift files: *Trip* and *User*. Each represents two different structs with own properties.
- **'ViewModels'** folder. Contains .swift files with implemented app's functionality. Each file paired with corresponding file in 'Views' folder which represents design of each application page.
    - ***MainViewViewModel.swift*** | <ins>corresponding file: 'Views' > MainView.swift.</ins> This file contains functionality which handles "main screen to show the user" at the moment. There is a listener from FirebaseAuth which listens if the user is logged in or not. If not - display login screen. If yes - display homepage of the logged in user in the state the user last left it. So even if, for example, the user logged in and closed the app (not minimized but closed) - after re-opening it, he will see his home page.
    - ***LoginViewViewModel.swift*** | <ins>corresponding file: 'Views' > LoginView.swift.</ins> This file contains the logic which checks user's input on the login screen. If there is any 'wrong' input - corresponding error message will show up. Implemented validations:
        - Disabled user (as an admin you can disable/delete specific user in the FireStore service). If disabled user tries to login - corresponding error will show up.
        - Non-existing user.
        - Invalid email.
        - Empty input.
     - ***RegisterViewViewModel.swift*** | <ins>corresponding file: 'Views' > RegisterView.swift.</ins> This file contains the logic responsible for new user creation and inserting the data about this new user into NoSql FireStore database, sending data in JSON format with the help of custom extension created in 'Other' > Extensions.swift. Implemented validations:
        - Empty input.
        - Valid email address (using regex for emails).
        - Length of password (should be at least 6 characters long).

       If each requirement is satisfied - user's data will be inserted into FireStore database in 'users' collection.

     - ***HomeScreenViewViewModel.swift*** | <ins>corresponding file: 'Views' > HomeScreenView.swift.</ins> This file contains the logic responsible for showing up already created trips by user. If non of them were created yet - the empty screen with title 'Your trips' with be shown ('Home' tab at the bottom os screen).
     - ***ProfileViewViewModel.swift*** | <ins>corresponding file: 'Views' > ProfileView.swift.</ins> This file contains the logic responsible logging out and showing up user's data:
        - Name.
        - Email.
        - Member since.
     - ***CreateNewTripViewViewModel.swift*** | <ins>corresponding file: 'Views' > CreateNewTripView.swift.</ins> This file contains the logic responsible for creation of new trip and insertion of this data into FireStore database. The data will be inserted into the collection 'users' > current_user_id > 'trips'. Following data will be inserted: name of the trip, notes (describes things to pack), date of trip, date of creation and completion status - means that user can check/uncheck the trip to mark it as completed and this information also will be reflected in the database. Implemented validations:
        - Empty input.
        - Date in the past (not allowed).
     - ***TripViewViewModel.swift*** | <ins>corresponding file: 'Views' > TripView.swift.</ins> This file contains the logic responsible for displaying already created trip. As was mentioned above, user can check/uncheck the trip to mark it as completed and this information also will be reflected in the database.

- **'Views'** folder. Contains .swift files with implemented UI design. Each file paired with corresponding file in 'ViewModels' folder which represents functionality of each application page, as was described above.
   - ***MainView.swift***. Represents design of the screen which will show up first after user launched the app - if user logged in, he will see his Home page. If not - he will see Login screen.
   - ***LoginView.swift***. Represents design of Login screen with 2 text fields: *'Email Address'* and *'Password'* and 'Log In' button. Underneath the form is a link which leads to *'Registration'* screen.
   - ***RegisterView.swift***. Represents design of Registration screen with 3 text fields: *Full name*, *'Email Address'*, *'Password'* and 'Create Account' button.
   - ***HomeScreenView.swift***. Represents design of user's Home screen. There are two tabs at the bottom: *'Home'* and *'Profile'*. On the homepage user can see already created trips, mark them as completed, delete them and create new one ('plus' icon on the top right).
   - ***ProfileView.swift***. Represents design of user's Profile screen. Following user's data present there: name, email, member since and logout button to be able to logout.
   - ***CreateNewTripView.swift***. Represents design of 'New Trip' form. There are 2 text fields *'Title'*, *'Notes'*, calendar to select date/time and 'Create Trip' button.
   - ***TripView.swift***. Represents design of the trip itself on the homepage - title, notes, date of the trip, checkbox and deletion (swipe left).
   - ***HeaderView.swift***. Represents design of header on the *'Login'* and *'Register'* screen so it is much more easier just to change the text of the header in this file instead of hardcoding desired text into two separate files related to login and registration.
   - ***PMButtonView.swift***. Represents design of all colored buttons in the app. PM - stands for the name of the app: PackMe. It is much more eaiser to call the method from this file which creates button, and just supply the desired color and label instead of creating desired button each time directly in each view.

