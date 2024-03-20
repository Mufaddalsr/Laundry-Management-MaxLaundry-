import { company } from "./company"
import { Icustomer, customer } from "./customer"
import { Iitem, item } from "./item"
import { location, Ilocation } from "./location"
import { IorderDetail, orderDetail } from "./orderDetail"
import { Ipayment, payment } from "./payment"
import { Ipromotion, promotion } from "./promotion"

export type order = {
    id?: number
    orderDate?: Date | string
    customerId?: number
    deliverBy?: Date | string
    isCancelled?: boolean
    isPaid?: boolean
    companyId?: number
    status?: string
    isHang?: boolean
    comments?: string
    locationId?: number
    promoApplied?: number
    discount?: Float32Array
    doEmail?: Date | string
    subTotal?: Float32Array
    catamount?: Float32Array
    grandTotal?: Float32Array
    balance?: Float32Array
    isExpress?: boolean
    isSync?: boolean
    userId?: number
    cancelledBy?: number
    cancelledOn?: Date | string
    cancelReason?: string
    company?: company
    customer?: customer
    items?: item[]
    location?: location
    orderDetails?: orderDetail[]
    payments?: payment[]
    promoAppliedNavigation?: promotion
}

export interface Iorder {
    id: number
    orderDate: Date | string
    customerId: number
    deliverBy: Date | string
    isCancelled: boolean
    isPaid: boolean
    companyId: number
    status: string
    isHang: boolean
    comments: string
    locationId: number
    promoApplied: number
    discount: Float32Array
    doEmail: Date | string
    subTotal: Float32Array
    catamount: Float32Array
    grandTotal: Float32Array
    balance: Float32Array
    isExpress: boolean
    isSync: boolean
    userId: number
    cancelledBy: number
    cancelledOn: Date | string
    cancelReason: string
    company: company
    customer: Icustomer
    items: Iitem[]
    location: Ilocation
    orderDetails: IorderDetail[]
    payments: Ipayment[]
    promoAppliedNavigation: Ipromotion
}