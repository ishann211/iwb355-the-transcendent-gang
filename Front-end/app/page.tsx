import Image from "next/image";
import PatientForm from "@/components/forms/PatientForm";
import Link from "next/link";

export default function Home() {
  return(
    <div className="flex h-screen max-h-screen">
      {/*TODO: OTP verification */}

      <section className="remove-scrollbar container my-auto">

        <div className="sub-container max-w-[496px]">

          {/* <Image
            src="/assets/images/logo-full.png"
            alt="patient"
            width={1000}
            height={1000}
            sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
            className="mb-2 h-21 w-fit align-middle"
          /> */}

          <PatientForm />
          <div className="text-14-regular mt-20 flex justify-between">

            <p className="justify-items-end text-dark-600 xl:text-left">
            © 2024 BookMyDoctor
            </p>

            {/* <Link href="/?admin=true" className="text-green-500">
              Admin
            </Link> */}


          </div>
        </div>
      </section>

      <Image
        src="/assets/images/onboarding-img.jpg"
        alt="patient"
        width={1000}
        height={1000}
        className="side-img max-w-[50%]"
      />
      
    </div>
  )
}
