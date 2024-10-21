import RegisterForm from '@/components/forms/RegisterForm';
import { getUser } from '@/lib/actions/patient.actions';
import { get } from 'http';
import Image from 'next/image';
import Link from 'next/link';
import React from 'react';

const Register = async ({params:{userId}}:SearchParamProps) => {
    const user= await getUser(userId);

    return (
    <div className="flex h-screen max-h-screen">
      <section className="remove-scrollbar container">

        <div className="sub-container max-w-[860px] flex-1 flex-col py-10">

          <Image
            src="/assets/images/logo-full.png"
            alt="patient"
            width={1000}
            height={1000}
            sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
            className="mb-2 h-21 w-fit align-middle"
          />

          <RegisterForm user={user} />
          
            <p className="copyright py-12">
            © 2024 BookMyDoctor
            </p>

        </div>
      </section>

      <Image
        src="/assets/images/register-img.jpg"
        alt="patient"
        width={1000}
        height={1000}
        className="side-img max-w-[390px]"
      />
      
    </div>
    )
}

export default Register;