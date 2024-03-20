import { ItblAccess, tblAccess } from "./tblAccess"
import { tblRole } from "./tblRole"

export type tblRoleDetail = {
    tid?: number
    roleId?: number
    accessId?: number
    access?: tblAccess | undefined
    role?: tblRole | undefined

}

export interface ItblRoleDetail {
    tid: number
    roleId: number
    accessId: number
    access: ItblAccess
    role: tblRole
}