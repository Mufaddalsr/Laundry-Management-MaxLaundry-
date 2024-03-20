import { Icategory, category } from "./category"
import { Icustomer, customer } from "./customer"
import { Iorder, order } from "./order"
import { Irfidreader, rfidreader } from "./rfidreader"
import { Iservice, service } from "./service"
import { IuserCompany, userCompany } from "./userCompany"

export type company = {
    id?: number
    companyName?: string
    companyCode?: string
    address?: string
    phoneNo?: string
    faxNo?: string
    isActive?: boolean
    logo?: Int8Array[]
    categories?: category[]
    customers?: customer[]
    orders?: order[]
    rfidreaders?: rfidreader[]
    services?: service[]
    userCompanies?: userCompany[]
}

export interface Icompany {
    id: number
    companyName: string
    companyCode: string
    address: string
    phoneNo: string
    faxNo: string
    isActive: boolean
    logo: Int8Array[]
    categories: Icategory[]
    customers: Icustomer[]
    orders: Iorder[]
    rfidreaders: Irfidreader[]
    services: Iservice[]
    userCompanies: IuserCompany[]
}