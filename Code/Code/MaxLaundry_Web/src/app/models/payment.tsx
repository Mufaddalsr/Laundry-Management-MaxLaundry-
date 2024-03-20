import { Iorder, order } from "./order"

export type payment = {
    payId?: string
    orderId?: string
    payDate?: Date | string
    amount?: Float32Array
    recievedBy?: number
    paymentType?: string
    isCancelled?: boolean
    cancelledBy?: number
    cancelledOn?: Date | string
    isSync?: boolean
    exportedOn?: Date | string
    exportBatch?: string
    order?: order
}

export interface Ipayment {
    payId: string
    orderId: string
    payDate: Date | string
    amount: Float32Array
    recievedBy: number
    paymentType: string
    isCancelled: boolean
    cancelledBy: number
    cancelledOn: Date | string
    isSync: boolean
    exportedOn: Date | string
    exportBatch: string
    order: Iorder
}