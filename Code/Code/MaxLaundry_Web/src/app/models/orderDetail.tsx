import { IgarmentType, garmentType } from "./garmentType"
import { Iitem, item } from "./item"
import { Iorder, order } from "./order"
import { Iservice, service } from "./service"

export type orderDetail = {
    tid?: string
    orderId?: string
    garmentId?: number
    serviceId?: number
    qty?: number
    total?: Float32Array
    status?: string
    deliveredOn?: Date | string
    lineId?: number
    exportedOn?: Date | string
    exportBatch?: string
    garment?: garmentType
    items?: item[]
    order?: order
    service?: service
}

export interface IorderDetail {
    tid: string
    orderId: string
    garmentId: number
    serviceId: number
    qty: number
    total: Float32Array
    status: string
    deliveredOn: Date | string
    lineId: number
    exportedOn: Date | string
    exportBatch: string
    garment: IgarmentType
    items: Iitem[]
    order: Iorder
    service: Iservice
}