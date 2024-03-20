import React, { useContext, useEffect, useState } from 'react'
import { Content } from '../../../../_metronic/layout/components/content'
import { RolesDataTable } from './DataTable'
import { GetTblRoles } from '../../../services/services'
import { ItblRole } from '../../../models/tblRole'


const ManageRoleWrapper: React.FC = () => {
    const [isloading, setLoading] = useState(false)
    const [data, setData] = useState<ItblRole[]>([])

    const FetchData = async () => {
        try {
            setLoading(true)
            await GetTblRoles()
                .then((response) => setData(response.data))
                .catch((reason) => { throw (reason) })
            setLoading(false)
        } catch (error) {
            console.log(error)
        }
    }

    useEffect(() => {
        FetchData()
    }, [])

    return (
        <>
            <Content>
                <div className='card-header d-flex justify-content-between border-0 pb-6'>
                    <div style={{ fontSize: '25px', fontWeight: 'bold', marginTop: '6px', color: 'green' }}>
                        Manage Role
                    </div>
                </div>
                {!isloading ?
                    <RolesDataTable
                        className='mb-5 mb-xl-8'
                        NotEditable={false}
                        rolesData={data}
                        fetchdata={FetchData} />
                    : <></>
                }

            </Content>
        </>
    )
}

export default ManageRoleWrapper