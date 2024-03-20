import { Iorder, order } from "./order"
import { IpromotionLocation, promotionLocation } from "./promotionLocation"

export type promotion = {
    id?: number
    promoCode?: string
    promoName?: string
    startDate?: Date | string
    endDate?: Date | string
    promoType?: string
    applicableAfter?: number
    discountPer?: Float32Array
    companyId?: number
    orders?: order[]
    promotionLocations?: promotionLocation[]
}

export interface Ipromotion {
    id: number
    promoCode: string
    promoName: string
    startDate: Date | string
    endDate: Date | string
    promoType: string
    applicableAfter: number
    discountPer: Float32Array
    companyId: number
    orders: Iorder[]
    promotionLocations: IpromotionLocation[]
}