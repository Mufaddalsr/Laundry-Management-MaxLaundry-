import { IitemHistory, itemHistory } from "./itemHistory"
import { Iorder, order } from "./order"
import { IorderDetail, orderDetail } from "./orderDetail"

export type item = {
    id?: string
    orderId?: string
    orderTid?: string
    tagId?: string
    status?: string
    taggedOn?: Date | string
    lastSeen?: number
    lastSeenTime?: Date | string
    lineId?: number
    comments?: string
    itemImage?: Int8Array[]
    isSync?: boolean
    itemHistories?: itemHistory[]
    order?: order
    orderT?: orderDetail
}

export interface Iitem {
    id: string
    orderId: string
    orderTid: string
    tagId: string
    status: string
    taggedOn: Date | string
    lastSeen: number
    lastSeenTime: Date | string
    lineId: number
    comments: string
    itemImage: Int8Array[]
    isSync: boolean
    itemHistories: IitemHistory[]
    order: Iorder
    orderT: IorderDetail
}