import { Icompany, company } from "./company"
import { IcorporateAccount, corporateAccount } from "./corporateAccount"
import { Iorder, order } from "./order"

export type customer = {
    id?: number
    customerId?: string
    fullName?: string
    address?: string
    landmark?: string
    phoneNumber?: string
    mobileNumber?: string
    attn?: string
    accountType?: number
    phone1?: string
    phone2?: string
    phone3?: string
    phone4?: string
    phone5?: string
    customerCode?: string
    createdOn?: Date | string
    createdBy?: number
    companyId?: number
    isActive?: boolean
    email?: string
    corpId?: number
    isSync?: boolean
    notes?: string
    company?: company
    corp?: corporateAccount
    orders?: order[]
}

export interface Icustomer {
    id: number
    customerId: string
    fullName: string
    address: string
    landmark: string
    phoneNumber: string
    mobileNumber: string
    attn: string
    accountType: number
    phone1: string
    phone2: string
    phone3: string
    phone4: string
    phone5: string
    customerCode: string
    createdOn: Date | string
    createdBy: number
    companyId: number
    isActive: boolean
    email: string
    corpId: number
    isSync: boolean
    notes: string
    company: Icompany
    corp: IcorporateAccount
    orders: Iorder[]
}