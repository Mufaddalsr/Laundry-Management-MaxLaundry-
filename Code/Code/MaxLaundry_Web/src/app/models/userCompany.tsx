import { Icompany, company } from "./company"
import { ItblUser, tblUser } from "./tblUser"

export type userCompany = {
    tid?: number
    uid?: number
    cid?: number
    cidNavigation?: company[]
    uidNavigation?: tblUser[]
}

export interface IuserCompany {
    tid: number
    uid: number
    cid: number
    cidNavigation: Icompany[]
    uidNavigation: ItblUser[]
}