![WhatsApp Image 2024-10-20 at 22 06 04_379ae1ea](https://github.com/user-attachments/assets/5388d2a4-3740-4bd1-b0d4-498bf202df6a)


# Introduction


Our healthcare patient management application allows patients to register and book their appointments with doctors. The application is built using Next.js for the frontend and Ballerina for the backend. Here’s a detailed breakdown:

User and Patient Registration

Next.js Frontend: Both users and patients can register through a responsive form that collects necessary personal information (name, contact details, etc.). The form is designed for easy navigation and a smooth user experience.
Ballerina Backend: The registration data is sent to the backend via API, where Ballerina processes and securely stores patient information in a database. Sensitive data like passwords are encrypted for privacy.

Booking Appointments

Next.js Frontend: Patients can view doctors’ availability in a calendar-like interface, select a suitable time, and book appointments directly. The interface updates dynamically to show available slots and avoid scheduling conflicts.
Ballerina Backend: The backend handles the scheduling logic, ensuring no double bookings. Once an appointment is booked, the backend updates the doctor’s schedule and stores appointment details in the database.


# Features

👉 Register as a User: Users can sign up and create a personal profile as a user.

👉 Register as a Patient: Users can sign up and create a personal profile as a patient.

👉 Book a New Appointment with Doctor: Patients can schedule appointments with doctors at their convenience and can book multiple appointments.


# Follow these steps to set up the project locally on your machine.

# Prerequisites

Make sure you have the following installed on your machine:

  Git
  
  Node.js
  
  npm (Node Package Manager)

  
# Cloning the Repository

git clone https://github.com/ishann211/iwb355-the-transcendent-gang/edit/main/Front-end


# Installation


Install the project dependencies using npm:

npm install


# Set Up Environment Variables

API and Database Configuration

NEXT_PUBLIC_ENDPOINT=https://your-api-endpoint
PROJECT_ID=your_project_id
API_KEY=your_api_key
DATABASE_ID=your_database_id
PATIENT_COLLECTION_ID=your_patient_collection_id
APPOINTMENT_COLLECTION_ID=your_appointment_collection_id
NEXT_PUBLIC_BUCKET_ID=your_bucket_id

Admin Passkey
NEXT_PUBLIC_ADMIN_PASSKEY=111111


Running the Project

npm run dev

Open http://localhost:3000 in your browser to view the project.


