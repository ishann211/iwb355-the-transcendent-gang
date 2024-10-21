import Image from "next/image";
import PatientForm from "@/components/forms/PatientForm";
import Link from "next/link";
import AppointmentForm from "@/components/forms/AppointmentForm";
import { getPatient } from "@/lib/actions/patient.actions";

export default async function NewAppointment({params:{userId}}:SearchParamProps) {
  const patient=await getPatient(userId)
  return(
    <div className="flex h-screen max-h-screen">
      {/*TODO: OTP verification */}

      <section className="remove-scrollbar container my-auto">

        <div className="sub-container max-w-[860px] flex-1 justify-between">

          {/* <Image
            src="/assets/images/logo-full.png"
            alt="patient"
            width={1000}
            height={1000}
            sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
            className="mb-2 h-21 w-fit align-middle"
          /> */}

          < AppointmentForm 
            type="create"
            userId={userId}
            patientId={patient.$id}
          />

            <p className="copyright mt-10 py-12">
            © 2024 BookMyDoctor
            </p>

        </div>
      </section>

      <Image
        src="/assets/images/appointment-img.jpg"
        alt="appointment"
        width={1000}
        height={1000}
        className="side-img max-w-[390px] bg-bottom"
      />
      
    </div>
  )
}
