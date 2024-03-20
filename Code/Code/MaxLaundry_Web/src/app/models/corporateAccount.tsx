import { Icustomer, customer } from "./customer"
import { IgarmentService, garmentService } from "./garmentService"

export type corporateAccount = {
    id?: number
    corporateCode?: string
    corpName?: string
    paymentTerms?: number
    accountStart?: Date | string
    createdOn?: Date | string
    createdBy?: number
    isActive?: boolean
    customers?: customer[]
    garmentServices?: garmentService[]
}

export interface IcorporateAccount {
    id: number
    corporateCode: string
    corpName: string
    paymentTerms: number
    accountStart: Date | string
    createdOn: Date | string
    createdBy: number
    isActive: boolean
    customers: Icustomer[]
    garmentServices: IgarmentService[]
}