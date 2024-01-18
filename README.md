# house_app

Project Overview
This Flutter test assignment involves creating a Flutter application with specific design implementation,SQLite database integration, MethodChannel communication, and background notification logic. The project aims to demonstrate proficiency in Flutter development, database management, native communication, and background task handling.

'HousePage' is a page displaying a list of houses and allowing the addition of new houses.
It uses its own widget, 'AddHouseButton', to add houses.
Displays the list of houses using the 'HouseList' widget.

'FloorsPage' is a page displaying the floors of the selected building and managing elevator movement logic.
Uses the 'FloorItem' widget for each floor.

'DatabaseService' is a service for working with the SQLite database.
Contains methods for database initialization, building insertion, and fetching a list of buildings.

Design Implementation
The UI design of the application is based on the provided Figma design. 
Screens are implemented according to the design, ensuring fidelity to the provided specifications.

SQLite Database
The application utilizes SQLite to store information about buildings and the number of floors. Created table:

Buildings Table:
    id,
    name,
    floorsAmount

MethodChannel Integration
A MethodChannel is integrated into the Flutter application to facilitate communication between the Flutter and native part, which is Android (Kotlin).
Background notification logic is implemented as follows:
The application sends a notification every minute indicating the current floor of the elevator in the last selected building.
