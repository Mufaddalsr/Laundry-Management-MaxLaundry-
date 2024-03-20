import { Icompany, company } from "./company"
import { Ilocation, location } from "./location"

export type rfidreader = {
    id?: number
    readerCode?: string
    ipaddress?: string
    an1?: Float32Array
    an2?: Float32Array
    an3?: Float32Array
    an4?: Float32Array
    readerType?: string
    locationId?: number
    companyId?: number
    isActive?: boolean
    company?: company
    location?: location
}

export interface Irfidreader {
    id: number
    readerCode: string
    ipaddress: string
    an1: Float32Array
    an2: Float32Array
    an3: Float32Array
    an4: Float32Array
    readerType: string
    locationId: number
    companyId: number
    isActive: boolean
    company: Icompany
    location: Ilocation
}