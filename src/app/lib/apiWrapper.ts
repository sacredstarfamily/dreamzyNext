import axios, { AxiosResponse } from 'axios';
import { UserType, UserFormDataType } from '../types/index';

// Define the base URL for the API
const baseURL:string = 'https://dreamzyapi.onrender.com';
const userEndpoint: string = '/users';
const tokenEndpoint: string = '/token';
const userDreamsEndpoint: string = '/mydreamz';
const publicDreamsEndpoint: string = '/getdreamz';
const interpretDreamEndpoint: string = '/interpretation';
// Define the API client for endpoints that don't require authentication
const apiClientNoAuth = () => axios.create({
    baseURL: baseURL
});

// Define the API client for endpoints that require basic authentication
const apiClientBasicAuth = (username:string, password:string)=>axios.create({
    baseURL:baseURL,
    headers: {
       Authorization: 'Basic ' + btoa(username + ':' + password)
    },
});

// Define the API client for endpoints that require token authentication
const apiClientTokenAuth = (token:string)=> axios.create({
    baseURL,
    headers: {
        Authorization: 'Bearer ' + token
    },
});
type APIResponse<T> = {
    data?: T,
    error?: string
}

// Define the API methods
const apiMethods = {
    registerUser: async (newUserData:UserFormDataType): Promise<APIResponse<UserType>> => {
        let data;
        let error;
        try {
            const response = await apiClientNoAuth().post('/register', { username, password });
            return { data: response.data };
        } catch (error) {
            return { error: error.response.data };
        }
    },
    // Example method for apiClientNoAuth
    getNoAuthData: async (): Promise<AxiosResponse> => {
        return apiClientNoAuth.get('/endpoint');
    },

    // Example method for apiClientBasicAuth
    getBasicAuthData: (): Promise<AxiosResponse> => {
        return apiClientBasicAuth.get('/endpoint');
    },

    // Example method for apiClientTokenAuth
    getTokenAuthData: (): Promise<AxiosResponse> => {
        return apiClientTokenAuth.get('/endpoint');
    },
};

export default apiMethods;