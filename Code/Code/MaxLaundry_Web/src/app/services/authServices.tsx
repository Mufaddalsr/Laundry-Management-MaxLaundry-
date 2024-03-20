import axios from 'axios'
import { ItblUser, tblUser } from '../models/tblUser'

const API_URL = import.meta.env.VITE_APP_BASE_API

export const LOGIN_URL = `${API_URL}/UserLogin/GetUser`
export const REGISTER_URL = `${API_URL}/register`
export const REQUEST_PASSWORD_URL = `${API_URL}/forgot_password`

// Server should return AuthModel
export function login(userId: string, iPassword: string) {
  return axios.post<ItblUser>(LOGIN_URL, { userId, iPassword, })
}

export function getUserByToken(userId: string, iPassword: string) {
  return axios.post<ItblUser>(LOGIN_URL, { userId, iPassword, })
}

// Server should return AuthModel
export function register(
  email: string,
  firstname: string,
  lastname: string,
  password: string,
  password_confirmation: string
) {
  return axios.post(REGISTER_URL, {
    email,
    first_name: firstname,
    last_name: lastname,
    password,
    password_confirmation,
  })
}

// Server should return object => { result: boolean } (Is Email in DB)
export function requestPassword(email: string) {
  return axios.post<{ result: boolean }>(REQUEST_PASSWORD_URL, {
    email,
  })
}

