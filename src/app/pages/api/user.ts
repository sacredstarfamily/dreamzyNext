import {NextAPIResponse, NextAPIRequest} from 'next';
import prisma from '../../lib/prisma';


export default async function handler(req:NextAPIRequest, res:NextAPIResponse){
    if(req.method === 'POST'){
        const {username, email, password} = req.body;
        const user = await prisma.user.create({
            data: {
                username,
                email,
                password
            }
        });
        res.status(200).json(user);
    }else{
        res.status(405).json({message: 'Method not allowed'});
    }
}