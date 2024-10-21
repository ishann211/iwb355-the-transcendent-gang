import Link from 'next/link';
import React from 'react';
import Image from 'next/image';
import { getAppointment } from '@/lib/actions/appointment.action';
import { Doctors } from '@/contants';
import { formatDateTime } from '@/lib/utils';
import { Button } from '@/components/ui/button';

const Success =async  ({params:{userId},searchParams}:SearchParamProps) => {
    const appointmentId = (searchParams?.appointmentId as string) || "";
    const appointment = await getAppointment(appointmentId);
  
    const doctor = Doctors.find(
      (doc) => doc.name === appointment.primaryPhysician
    );

    return (
        <div className="flex h-screen max-h-screen px-[5%]">
           <div className='success-img'>
                <Link href='/'>
                <Image
                    src="/assets/images/logo-full.png"
                    alt="patient"
                    width={1000}
                    height={1000}
                    sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
                    className="mb-2 h-21 w-fit "
                />
                </Link>

                <section className="flex flex-col items-center">

                    <Image
                        src="/assets/gifs/success.gif" 
                        alt="success"
                        height={300} 
                        width={280} // replace with your desired width
                    />

                    <h2 className="header mb-6 max-w-[600px] text-center">
                        Your <span className='text-green-500'>Apointment request</span> has been successfully submitted!
                    </h2>
                    <p>We will be in touch shortly to confirm.</p>

                </section>

                <section className="request-details">

                    <p>Requested appointment details:</p>
                    <div className="flex items-center gap-3">
                        <Image
                        src={doctor?.image!}
                        alt="doctor"
                        width={100}
                        height={100}
                        className="size-6"
                        />
                        <p className="whitespace-nowrap">Dr.{doctor?.name}</p>    
                    </div>
                    <div className="flex gap-2">
                        <Image
                        src="/assets/icons/calendar.svg"
                        alt="calendar"
                        height={24} 
                        width={24}
        
                        />
                        <p>{formatDateTime(appointment.schedule).dateTime}</p>

                    </div>

                </section>
                <Button variant="outline" className="shad-primary-btn" asChild>
                    <Link href={`/patients/${userId}/new-appointment`}>New appointment</Link>
                </Button>
                
                <p className='copyright'> © 2024 BookMyDoctor</p>

           </div>
        </div>
    );
};

export default Success;