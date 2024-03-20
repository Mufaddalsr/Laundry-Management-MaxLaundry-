import { company } from "./company"
import { IgarmentService, garmentService } from "./garmentService"
import { IorderDetail, orderDetail } from "./orderDetail"

export type service = {
    id?: number
    serviceType?: string
    isActive?: boolean
    companyId?: number
    company?: company
    garmentServices?: garmentService[]
    orderDetails?: orderDetail[]
}

export interface Iservice {
    id: number
    serviceType: string
    isActive: boolean
    companyId: number
    company: company
    garmentServices: IgarmentService[]
    orderDetails: IorderDetail[]
}