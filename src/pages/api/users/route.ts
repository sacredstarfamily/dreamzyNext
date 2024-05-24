import { NextApiRequest, NextApiResponse } from 'next';

async function Get(req:NextApiRequest, res:NextApiResponse) {
    res.status(200).json({ message: 'Hello' });
}
