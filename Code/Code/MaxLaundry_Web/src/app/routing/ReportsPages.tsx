import { Navigate, Routes, Route, Outlet } from 'react-router-dom'
import { PageLink, PageTitle } from '../../_metronic/layout/core'

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

const ReportsPages = () => {
    return (
        <Routes>
            <Route element={<Outlet />}>
                <Route
                    path='charts'
                    element={
                        <>
                            {/* <PageTitle breadcrumbs={widgetsBreadCrumbs}>Charts</PageTitle> */}
                            {/* <Charts /> */}
                        </>
                    }
                />
            </Route >
        </Routes >
    )
}

export default ReportsPages