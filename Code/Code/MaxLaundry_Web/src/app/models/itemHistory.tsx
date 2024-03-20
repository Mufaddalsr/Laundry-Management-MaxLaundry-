import { Iitem, item } from "./item"

export type itemHistory = {
    id?: number
    itemId?: string
    locationId?: number
    tstamp?: Date | string
    batchId?: string
    description?: string
    isSync?: boolean
    item?: item
}

export interface IitemHistory {
    id: number
    itemId: string
    locationId: number
    tstamp: Date | string
    batchId: string
    description: string
    isSync: boolean
    item: Iitem
}