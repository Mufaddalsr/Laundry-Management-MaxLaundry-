import { location, Ilocation } from "./location";
import { ItblRole, tblRole } from "./tblRole";
import { IuserCompany, userCompany } from "./userCompany";

export type tblUser = {
    uid?: number,
    userId?: string,
    iPassword?: string,
    roleId?: number,
    displayName?: string,
    rfid?: string,
    bs?: string,
    isActive?: boolean,
    isDriver?: boolean,
    api_token?: string,
    role?: tblRole,
    userCompanies?: userCompany[],
    locations?: location[]
}

export interface ItblUser {
    uid: number,
    userId: string,
    iPassword: string,
    roleId: number,
    displayName: string,
    rfid: string,
    bs: string,
    isActive: boolean,
    isDriver: boolean,
    api_token?: string,
    role?: ItblRole,
    userCompanies?: IuserCompany[],
    locations?: Ilocation[]
}

