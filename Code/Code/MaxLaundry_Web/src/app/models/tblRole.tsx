import { ItblRoleDetail, tblRoleDetail } from "./tblRoleDetail"
import { ItblUser, tblUser } from "./tblUser"

export type tblRole = {
    roleId?: number,
    roleDesc?: string,
    isActive?: boolean,
    tblRoleDetails?: tblRoleDetail[]
    tblUsers?: tblUser[]
}

export interface ItblRole {
    roleId: number
    roleDesc: string
    isActive: boolean,
    tblRoleDetails: ItblRoleDetail[]
    tblUsers: ItblUser[]
}