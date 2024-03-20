import { Ilocation, location } from "./location"
import { Ipromotion, promotion } from "./promotion"

export type promotionLocation = {
    tid?: number
    promotionId?: number
    locationId?: number
    location?: location
    promotion?: promotion
}

export interface IpromotionLocation {
    tid: number
    promotionId: number
    locationId: number
    location: Ilocation
    promotion: Ipromotion
}