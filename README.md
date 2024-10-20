# iwb355-the-transcendent-gang

This healthcare patient management application allows patients to register, book, and manage their appointments with doctors. The application is built using Next.js for the frontend and Ballerina for the backend. Here’s a detailed breakdown:


User and Patient Registration

Next.js Frontend:
Responsive Form: The existing RegisterForm should collect personal information such as:
Name, Email, Phone, Birthdate, Gender, Address, Occupation, Emergency Contact Details, and Medical Information (Allergies, Current Medication, Family Medical History, etc.).
The form also collects an identification type and uploads documents using the FileUploader.

Ballerina Backend:
API to Store Patient Data:
Store personal data securely in the database, ensuring encryption for sensitive information like contact details, identification numbers, and medical records.


Booking Appointments

Next.js Frontend:
Doctor’s Availability:
Patients can select a doctor from the Doctors list and see available slots based on the doctor's schedule.
Use a calendar interface where available time slots are dynamically displayed.
Appointment Form: Once a patient selects a time, they can fill out the AppointmentForm for confirmation, which includes:
Doctor selection (already populated).
Date and time selection from available slots.
Reason for appointment and additional notes.
Form Submission: The appointment details are submitted to the backend API for scheduling.

Ballerina Backend: The backend handles the scheduling logic, ensuring no double bookings. Once an appointment is booked, the backend updates the doctor’s schedule and stores appointment details in the database. add the functionalities of above codes to this
