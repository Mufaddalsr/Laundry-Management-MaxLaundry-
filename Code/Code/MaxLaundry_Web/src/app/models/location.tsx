import { Iorder, order } from "./order"
import { IpromotionLocation, promotionLocation } from "./promotionLocation"
import { Irfidreader, rfidreader } from "./rfidreader"
import { ItblUser, tblUser } from "./tblUser"

export type location = {
    id?: number
    locationCode?: string
    locationName?: string
    locationType?: string
    isActive?: boolean
    companyId?: number
    lastOrderId?: number
    phoneNumber?: string
    isOnline?: boolean
    email?: string
    latitude?: Float32Array
    longitude?: Float32Array
    address?: string
    orders?: order[]
    promotionLocations?: promotionLocation[]
    rfidreaders?: rfidreader[]
    users?: tblUser[]
}

export interface Ilocation {
    id: number
    locationCode: string
    locationName: string
    locationType: string
    isActive: boolean
    companyId: number
    lastOrderId: number
    phoneNumber: string
    isOnline: boolean
    email: string
    latitude: Float32Array
    longitude: Float32Array
    address: string
    orders: Iorder[]
    promotionLocations: IpromotionLocation[]
    rfidreaders: Irfidreader[]
    users: ItblUser[]
}