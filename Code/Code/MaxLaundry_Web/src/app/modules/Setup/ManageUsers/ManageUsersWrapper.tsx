import React, { useContext, useEffect, useState } from 'react'
import { Content } from '../../../../_metronic/layout/components/content'
import { UsersDataTable } from './DataTable'
import { ItblUser } from '../../../models/tblUser'
import { GetTblUser } from '../../../services/services'


const ManageUsersWrapper: React.FC = () => {
    const [isloading, setLoading] = useState(false)
    const [data, setData] = useState<ItblUser[]>([])

    const FetchData = async () => {
        try {
            setLoading(true)
            await GetTblUser()
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
                        Manage Users
                    </div>
                </div>
                {!isloading ?
                    <UsersDataTable
                        className='mb-5 mb-xl-8'
                        NotEditable={false}
                        UsersData={data}
                        fetchdata={FetchData} />
                    : <></>
                }

            </Content>
        </>
    )
}

export default ManageUsersWrapper