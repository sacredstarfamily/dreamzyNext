export type UserType = {
    id: number,
    first_name: string,
    last_name: string,
    username: string,
    email: string,
    dateCreated: string
}

export type UserFormDataType = {
    first_name:string,
    last_name:string,
    email:string,
    username:string,
    password:string,
    confirmPassword:string
}