export type auditLog = {
    tid?: number
    orderId?: number
    tstamp?: Date | string
    eventType?: string
    eventDesc?: string
    userId?: number
    isSync?: boolean
}

export interface IauditLog {
    tid?: number
    orderId?: number
    tstamp?: Date | string
    eventType?: string
    eventDesc?: string
    userId?: number
    isSync?: boolean
}