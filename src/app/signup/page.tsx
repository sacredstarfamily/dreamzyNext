'use client';
import {useRouter} from 'next/navigation';

export default function Signup(){
    const router = useRouter();
    const [error, setError] = useState<string>('');
    const [loading, setLoading] = useState<boolean>(false);
    const [success, setSuccess] = useState<boolean>(false);
    const handleSubmit = async (e:React.FormEvent<HTMLFormElement>)=>{
        e.preventDefault();
        const form = e.currentTarget;
        const formData = new FormData(form);
        const formValues = Object.fromEntries(formData.entries());
        console.log(formValues);
       
        router.push('/login');
    }
    return (
        <>
        <h1>SignUp Page</h1>

        </>
    )
}