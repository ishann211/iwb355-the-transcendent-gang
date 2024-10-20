Introduction


Features
👉 Register as a Patient: Users can sign up and create a personal profile as a patient.

👉 Book a New Appointment with Doctor: Patients can schedule appointments with doctors at their convenience and can book multiple appointments.

👉 Manage Appointments on Admin Side: Administrators can efficiently view and handle all scheduled appointments.

👉 Confirm/Schedule Appointment from Admin Side: Admins can confirm and set appointment times to ensure they are properly scheduled.

👉 Cancel Appointment from Admin Side: Administrators have the ability to cancel any appointment as needed.

👉 Send SMS on Appointment Confirmation: Patients receive SMS notifications to confirm their appointment details.


Follow these steps to set up the project locally on your machine.

Prerequisites
Make sure you have the following installed on your machine:
  Git
  Node.js
  npm (Node Package Manager)
  
Cloning the Repository
git clone https://github.com/ishann211/iwb355-the-transcendent-gang/edit/main/Front-end

Installation

Install the project dependencies using npm:
npm install

Set Up Environment Variables

# API and Database Configuration
NEXT_PUBLIC_ENDPOINT=https://your-api-endpoint
PROJECT_ID=your_project_id
API_KEY=your_api_key
DATABASE_ID=your_database_id
PATIENT_COLLECTION_ID=your_patient_collection_id
APPOINTMENT_COLLECTION_ID=your_appointment_collection_id
NEXT_PUBLIC_BUCKET_ID=your_bucket_id

# Admin Passkey
NEXT_PUBLIC_ADMIN_PASSKEY=111111

Running the Project
npm run dev

Open http://localhost:3000 in your browser to view the project.


