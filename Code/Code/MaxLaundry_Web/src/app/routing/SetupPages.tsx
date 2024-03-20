import { Navigate, Routes, Route, Outlet } from 'react-router-dom'
import { PageLink, PageTitle } from '../../_metronic/layout/core'
import ManageRoleWrapper from '../modules/Setup/ManageRole/ManageRoleWrapper'
import ManageUsersWrapper from '../modules/Setup/ManageUsers/ManageUsersWrapper'

const profileBreadCrumbs: Array<PageLink> = [
    {
        title: 'Profile',
        path: '/crafted/pages/profile/overview',
        isSeparator: false,
        isActive: false,
    },
    {
        title: '',
        path: '',
        isSeparator: true,
        isActive: false,
    },
]

const SetupPages = () => {
    return (
        <Routes>
            <Route element={<Outlet />}>
                <Route path='manageRole' element={<ManageRoleWrapper />} />
                <Route path='manageUsers' element={<ManageUsersWrapper />} />
            </Route >
        </Routes >
    )
}

export default SetupPages