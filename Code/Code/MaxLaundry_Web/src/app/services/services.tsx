import axios from 'axios'
import { ItblRole, tblRole } from '../models/tblRole'
import { ItblAccess, tblAccess } from '../models/tblAccess'
import { ItblRoleDetail, tblRoleDetail } from '../models/tblRoleDetail'
import { ItblUser, tblUser } from '../models/tblUser'

export const API_URL = import.meta.env.VITE_APP_BASE_API

const ROLE_URL = `${API_URL}/TblRole`
const ACCESS_URL = `${API_URL}/TblAccess`
const ROLEDETAILS_URL = `${API_URL}/TblRoleDetail`
const USERS_URL = `${API_URL}/TblUser`



// ROLE_URL
export const GetTblRoles = async () => {
    return await axios.get<ItblRole[]>(`${ROLE_URL}/GetTblRoles`)
}

export const GetTblRole = async (Id: string) => {
    return await axios.get<ItblRole>(`${ROLE_URL}/GetTblRole/${Id}`)
}

export const PutTblRole = async (roledetails: tblRole) => {
    return await axios.put(`${ROLE_URL}/PutTblRole/${roledetails.roleId}`, roledetails)
}

export const PatchTblRole = async (id: number, data: any) => {
    return await axios.patch(`${ROLE_URL}/PatchTblRole/${id}`, data)
}

export const PostTblRole = async (roledetails: tblRole) => {
    return await axios.post<ItblRole>(`${ROLE_URL}/PostTblRole`, roledetails)
}

export const DeleteTblRole = async (Id: string) => {
    return await axios.delete(`${ROLE_URL}/DeleteTblRole/${Id}`)
}

////ACCESS_URL
export const GetTblAccesses = async () => {
    return await axios.get<ItblAccess[]>(`${ACCESS_URL}/GetTblAccesses`)
}

export const GetTblAccess = async (Id: string) => {
    return await axios.get<ItblAccess>(`${ACCESS_URL}/GetTblAccess/${Id}`)
}

export const PutTblAccess = async (accessdetails: tblAccess) => {
    return await axios.put(`${ACCESS_URL}/PutTblAccess/${accessdetails.accessId}`, accessdetails)
}

export const PostTblAccess = async (accessdetails: tblAccess) => {
    return await axios.post<ItblAccess>(`${ACCESS_URL}/PostTblAccess`, accessdetails)
}

export const DeleteTblAccess = async (Id: string) => {
    return await axios.delete(`${ACCESS_URL}/DeleteTblRole/${Id}`)
}


///ROLEDETAILS_URL
export const GetTblRoleDetails = async () => {
    return await axios.get<ItblRoleDetail[]>(`${ROLEDETAILS_URL}/GetTblRoleDetails`)
}

export const GetTblRoleDetail = async (Id: string) => {
    return await axios.get<ItblRoleDetail>(`${ROLEDETAILS_URL}/GetTblRoleDetail/${Id}`)
}

export const PutTblRoleDetail = async (roledetails: tblRoleDetail) => {
    return await axios.put(`${ROLEDETAILS_URL}/PutTblRoleDetail/${roledetails.tid}`, roledetails)
}

export const PostTblRoleDetail = async (roledetails: tblRoleDetail) => {
    return await axios.post<ItblRoleDetail>(`${ROLEDETAILS_URL}/PostTblRoleDetail`, roledetails)
}

export const DeleteTblRoleDetail = async (Id: string) => {
    return await axios.delete(`${ROLEDETAILS_URL}/DeleteTblRole/${Id}`)
}


////USERS_URL
export const GetTblUser = async () => {
    return await axios.get<ItblUser[]>(`${USERS_URL}/GetTblUsers`)
}

export const GetTblUserbyId = async (Id: string) => {
    return await axios.get<ItblUser>(`${USERS_URL}/GetTblUser/${Id}`)
}

export const PutTblUser = async (user: tblUser) => {
    return await axios.put(`${USERS_URL}/PutTblUser/${user.uid}`, user)
}

export const PatchTblUser = async (id: number, data: any) => {
    return await axios.patch(`${USERS_URL}/PatchTblUser/${id}`, data)
}

export const PostTblUser = async (user: tblUser) => {
    return await axios.post<ItblUser>(`${USERS_URL}/PostTblUser`, user)
}

export const DeleteTblUser = async (Id: string) => {
    return await axios.delete(`${USERS_URL}/DeleteTblUser/${Id}`)
}

