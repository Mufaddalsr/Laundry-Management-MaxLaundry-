export type payterm = {
    id?: number
    paytermName?: string
    payAfter?: number
    isActive?: boolean
}

export interface Ipayterm {
    id: number
    paytermName: string
    payAfter: number
    isActive: boolean
}