import { IcorporateAccount, corporateAccount } from "./corporateAccount"
import { IgarmentType, garmentType } from "./garmentType"
import { Iservice, service } from "./service"

export type garmentService = {
    tid?: number
    garmentId?: number
    serviceId?: number
    price?: Float32Array
    isOffered?: boolean
    corpId?: number
    corp?: corporateAccount
    garment?: garmentType
    service?: service
}

export interface IgarmentService {
    tid: number
    garmentId: number
    serviceId: number
    price: Float32Array
    isOffered: boolean
    corpId: number
    corp: IcorporateAccount
    garment: IgarmentType
    service: Iservice
}