import { Icategory, category } from "./category"
import { IgarmentService, garmentService } from "./garmentService"
import { IorderDetail, orderDetail } from "./orderDetail"

export type garmentType = {
    id?: number
    garmetType?: string
    isActive?: boolean
    createdOn?: Date | string
    createdBy?: number
    gimage?: Int8Array[]
    companyId?: number
    categoryId?: number
    tagCount?: number
    weight?: Float32Array
    arabicName?: string
    category?: category
    garmentServices?: garmentService[]
    orderDetails?: orderDetail[]
}

export interface IgarmentType {
    id: number
    garmetType: string
    isActive: boolean
    createdOn: Date | string
    createdBy: number
    gimage: Int8Array[]
    companyId: number
    categoryId: number
    tagCount: number
    weight: Float32Array
    arabicName: string
    category: Icategory
    garmentServices: IgarmentService[]
    orderDetails: IorderDetail[]
}