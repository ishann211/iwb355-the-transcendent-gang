# Introduction


Our healthcare patient management application allows patients to register and book their appointments with doctors. The application is built using Next.js for the frontend and Ballerina for the backend. Here’s a detailed breakdown:

User and Patient Registration

Next.js Frontend: Both users and patients can register through a responsive form that collects necessary personal information (name, contact details, etc.). The form is designed for easy navigation and a smooth user experience.
Ballerina Backend: The registration data is sent to the backend via API, where Ballerina processes and securely stores patient information in a database. Sensitive data like passwords are encrypted for privacy.

Booking Appointments

Next.js Frontend: Patients can view doctors’ availability in a calendar-like interface, select a suitable time, and book appointments directly. The interface updates dynamically to show available slots and avoid scheduling conflicts.
Ballerina Backend: The backend handles the scheduling logic, ensuring no double bookings. Once an appointment is booked, the backend updates the doctor’s schedule and stores appointment details in the database.


# Follow these steps to set up the project locally on your machine.

## Prerequisites

Make sure you have the following installed on your machine:

Git: For cloning the repository.

Ballerina: Download and install from the official site Ballerina.io.

Java Development Kit (JDK): Ballerina requires JDK 11 or higher.

  
## Cloning the Repository

git clone https://github.com/ishann211/iwb355-the-transcendent-gang


## Navigate to the Project Directory:

cd ProjectBallerina

## Configuration Settings

Update the configuration file or include any necessary .toml files with the following:

Config.toml (example):
databaseusername = "root"
password = "yourpassword"
databasename = "Your_Database_Name"
databaseport = 3306

## Building the Project

Run the following command to build the Ballerina project:
'bal build'

## Running the Ballerina Project

'bal run'

This will start the backend server and it will listen on the specified port. It will listen on port 9090.


