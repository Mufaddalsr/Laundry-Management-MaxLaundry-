import { useState } from "react";
import { KTCardBody, KTSVG } from "../../../../_metronic/helpers"
import { ItblRole, tblRole } from "../../../models/tblRole";
import { PatchTblRole } from "../../../services/services";
import { AddRoleModal } from "./ADD/AddModal";
import { EditRoleModal } from "./EDIT/EditModal";
import { DeleteRoleModal } from "./DELETE/DeleteModal";
import { ViewRoleModal } from "./VIEW/ViewModal";


type Props = {
    rolesData: ItblRole[]
    className: string,
    NotEditable: boolean
    fetchdata: Function
}


export const RolesDataTable = ({ className, NotEditable, rolesData, fetchdata }: Props) => {

    const [SelectedId, SetSelectedId] = useState<number>();
    const [SelectedItem, SetSelectedItem] = useState<ItblRole>();
    const [OnAddModalIsOpen, SetAddModalIsOpen] = useState(false);
    const CloseAddModal = () => { SetAddModalIsOpen(false); }
    const [OnEditModalIsOpen, SetEditModalIsOpen] = useState(false);
    const CloseEditModal = () => { SetEditModalIsOpen(false); }
    const [OnViewModalIsOpen, SetViewModalIsOpen] = useState(false);
    const CloseViewModal = () => { SetViewModalIsOpen(false); }
    const [OnDeleteModalIsOpen, SetDeleteModalIsOpen] = useState(false);
    const CloseDeleteModal = () => { SetDeleteModalIsOpen(false); }

    const HandleisActiveChnage = async (id: number, e: boolean) => {
        await PatchTblRole(id, [
            {
                op: 'replace',
                path: '/isActive',
                value: e,
            }
        ]).then(() => { fetchdata() })
    }

    return (
        <>
            <KTCardBody className='py-4'>
                <div className={`card ${className}`}>
                    {/* begin::Header */}
                    <div className='card-header border-0 pt-5'>
                        <h3 className='card-title align-items-start flex-column'>
                            <span className='card-label fw-bold fs-3 mb-1'>List of Roles</span>
                            <span className='text-muted mt-1 fw-semibold fs-7'>{rolesData.length} records fetched</span>
                        </h3>
                        <div className='card-toolbar'>
                            {/* begin::Menu */}
                            <button type='button' className='btn btn-primary'
                                data-bs-toggle="modal"
                                data-bs-target="#kt_modal_addrole"
                                hidden={NotEditable}
                                onClick={() => SetAddModalIsOpen(true)}
                            >
                                <KTSVG path='media/icons/duotune/arrows/arr075.svg' className='svg-icon svg-icon-2' />
                                {` ADD`}
                            </button>
                            {/* end::Menu */}
                        </div>
                    </div>
                    {/* end::Header */}
                    {/* begin::Body */}
                    <div className='card-body py-3'>
                        {/* begin::Table container */}
                        <div className='table-responsive'>
                            {/* begin::Table */}
                            <table className='table table-row-bordered table-hover align-middle gs-0 gy-4'>
                                {/* begin::Table head */}
                                <thead>
                                    <tr className='fw-bold bg-light' style={{ fontSize: 14 }}>
                                        <th className='ps-4 min-w-100px rounded-start'>#</th>
                                        <th className='min-w-125px'>Role</th>
                                        <th className='min-w-150px'>isActive</th>
                                        <th className='pe-4 text-end min-w-115px rounded-end'> Actions</th>
                                    </tr>
                                </thead>
                                {/* end::Table head */}
                                {/* begin::Table body */}
                                <tbody>
                                    {rolesData.map((item, idx) => {
                                        return (
                                            <tr key={item.roleId}>
                                                <td className='ps-4 fw-bold text-hover-primary rounded-start'>{item.roleId}</td>
                                                <td className="text-hover-primary">{item.roleDesc}</td>
                                                <td>
                                                    <div className="form-check form-switch form-check-custom form-check-solid me-10">
                                                        <input className="form-check-input h-20px w-30px"
                                                            type="checkbox" value="" id={item.roleId?.toString()} checked={item.isActive}
                                                            onChange={(e) => {
                                                                HandleisActiveChnage(item.roleId!, e.target.checked)
                                                            }} />
                                                    </div>
                                                </td>
                                                <td className='text-end pe-4 rounded-end'>
                                                    <button
                                                        // className='btn btn-sm btn-warning px-4 me-2'
                                                        className={`btn btn-sm ${NotEditable ? 'btn-light' : 'btn-secondary'}  px-4 me-2`}
                                                        disabled={NotEditable}
                                                        onClick={() => {
                                                            // console.log(value)
                                                            SetViewModalIsOpen(true)
                                                            SetSelectedItem(item)
                                                        }}
                                                    >
                                                        <span className='indicator-label'>View Access</span>
                                                    </button>
                                                    <button
                                                        // className='btn btn-sm btn-warning px-4 me-2'
                                                        className={`btn btn-sm ${NotEditable ? 'btn-light' : 'btn-warning'}  px-4 me-2`}
                                                        disabled={NotEditable}
                                                        onClick={() => {
                                                            // console.log(value)
                                                            SetEditModalIsOpen(true)
                                                            SetSelectedItem(item)
                                                            SetSelectedId(item.roleId)
                                                        }}
                                                    >
                                                        <span className='indicator-label'>Edit Access</span>
                                                    </button>
                                                    <button
                                                        className={`btn btn-sm ${NotEditable ? 'btn-light' : 'btn-danger'}  px-4 me-2`}
                                                        disabled={NotEditable}
                                                        onClick={() => {
                                                            // console.log(value)
                                                            SetDeleteModalIsOpen(true)
                                                            SetSelectedId(item.roleId)
                                                        }}
                                                    >
                                                        <span className='indicator-label'>Delete</span>
                                                    </button>
                                                </td>
                                            </tr>
                                        )
                                    })}
                                </tbody>
                                {/* end::Table body */}
                            </table>
                            {/* end::Table */}
                        </div>
                        {/* end::Table container */}
                    </div>
                    {/* begin::Body */}
                </div >
                {OnAddModalIsOpen && <AddRoleModal isModalClosed={CloseAddModal} fetchRoledata={fetchdata} />}
                {OnEditModalIsOpen && <EditRoleModal roleId={SelectedId!} role={SelectedItem} isModalClosed={CloseEditModal} fetchRoledata={fetchdata} />}
                {OnViewModalIsOpen && <ViewRoleModal ModalHidden={OnViewModalIsOpen} isModalClosed={CloseViewModal} data={SelectedItem} />}
                {OnDeleteModalIsOpen && <DeleteRoleModal roleId={SelectedId!} ModalHidden={OnDeleteModalIsOpen} isModalClosed={CloseDeleteModal} fetchRoledata={fetchdata} />}
            </KTCardBody>
        </>
    )
}