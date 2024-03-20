import { Icompany, company } from "./company"
import { IgarmentType, garmentType } from "./garmentType"

export type category = {
    id?: number
    category1?: string
    isActive?: boolean
    companyId?: number
    company?: company
    garmentTypes?: garmentType[]
}

export interface Icategory {
    id: number
    category1: string
    isActive: boolean
    companyId: number
    company: Icompany
    garmentTypes: IgarmentType[]
}