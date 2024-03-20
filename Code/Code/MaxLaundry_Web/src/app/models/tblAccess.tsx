import { ItblRoleDetail, tblRoleDetail } from "./tblRoleDetail"

export type tblAccess = {
    accessId?: number
    accessDesc?: string
    parentId?: number
    tblRoleDetails?: tblRoleDetail[]
}

export interface ItblAccess {
    accessId: number
    accessDesc: string
    parentId: number
    tblRoleDetails: ItblRoleDetail[]
}