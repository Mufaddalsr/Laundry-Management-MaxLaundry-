import { useState } from "react";
import { KTCardBody, KTSVG } from "../../../../_metronic/helpers"
import { PatchTblRole, PatchTblUser } from "../../../services/services";
// import { AddUserModal } from "./ADD/AddModal";
// import { EditUserModal } from "./EDIT/EditModal";
// import { DeleteUserModal } from "./DELETE/DeleteModal";
// import { ViewRoleModal } from "./VIEW/ViewModal";
import { ItblUser } from "../../../models/tblUser";
import { Dropdown } from "react-bootstrap";


type Props = {
    UsersData: ItblUser[]
    className: string,
    NotEditable: boolean
    fetchdata: Function
}


export const UsersDataTable = ({ className, NotEditable, UsersData, fetchdata }: Props) => {

    const [SelectedId, SetSelectedId] = useState<number>();
    const [SelectedItem, SetSelectedItem] = useState<ItblUser>();
    const [OnAddModalIsOpen, SetAddModalIsOpen] = useState(false);
    const CloseAddModal = () => { SetAddModalIsOpen(false); }
    const [OnEditModalIsOpen, SetEditModalIsOpen] = useState(false);
    const CloseEditModal = () => { SetEditModalIsOpen(false); }
    const [OnViewModalIsOpen, SetViewModalIsOpen] = useState(false);
    const CloseViewModal = () => { SetViewModalIsOpen(false); }
    const [OnDeleteModalIsOpen, SetDeleteModalIsOpen] = useState(false);
    const CloseDeleteModal = () => { SetDeleteModalIsOpen(false); }

    const HandleisActiveChnage = async (id: number, e: boolean) => {
        await PatchTblUser(id, [
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
                            <span className='text-muted mt-1 fw-semibold fs-7'>{UsersData.length} records fetched</span>
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
                                        <th className='min-w-150px'>User Id</th>
                                        <th className='min-w-125px'>User Name</th>
                                        <th className='min-w-150px'>Role</th>
                                        <th className='min-w-150px'>isActive</th>
                                        <th className='pe-4 text-end min-w-115px rounded-end'> Actions</th>
                                    </tr>
                                </thead>
                                {/* end::Table head */}
                                {/* begin::Table body */}
                                <tbody>
                                    {UsersData.map((item, idx) => {
                                        return (
                                            <tr key={item.roleId}>
                                                <td className='ps-4 fw-bold text-hover-primary rounded-start'>{idx + 1}</td>
                                                <td className="text-hover-primary">{item.userId}</td>
                                                <td className="text-hover-primary">{item.displayName}</td>
                                                <td className="">{item.role?.roleDesc}</td>
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
                                                    <Dropdown>
                                                        <Dropdown.Toggle
                                                            className={`btn btn-sm ${NotEditable ? 'btn-light' : 'btn-secondary'}  `}
                                                            as='div'
                                                            id='dropdown-user-action'>
                                                            Actions
                                                        </Dropdown.Toggle>
                                                        <Dropdown.Menu>
                                                            <Dropdown.Item
                                                                disabled={NotEditable}
                                                                onClick={() => {

                                                                }}>
                                                                Update Password
                                                            </Dropdown.Item>
                                                            <Dropdown.Item
                                                                onClick={() => {
                                                                    SetSelectedItem(item)
                                                                    SetViewModalIsOpen(true)
                                                                }}>
                                                                View Locations
                                                            </Dropdown.Item>
                                                            <Dropdown.Item
                                                                onClick={() => {
                                                                    SetSelectedId(item.roleId)
                                                                    SetSelectedItem(item)
                                                                    SetEditModalIsOpen(true)
                                                                }}>
                                                                Edit
                                                            </Dropdown.Item>
                                                            <Dropdown.Item
                                                                onClick={() => {
                                                                    SetSelectedId(item.roleId)
                                                                    SetDeleteModalIsOpen(true)
                                                                }}>
                                                                Delete
                                                            </Dropdown.Item>
                                                        </Dropdown.Menu>
                                                    </Dropdown>
                                                    {/* <button
                                                        // className='btn btn-sm btn-warning px-4 me-2'
                                                        className={`btn btn-sm ${NotEditable ? 'btn-light' : 'btn-secondary'}  px-4 me-2`}
                                                        disabled={NotEditable}
                                                        onClick={() => {
                                                            // console.log(value)
                                                            SetViewModalIsOpen(true)
                                                            SetSelectedItem(item)
                                                        }}
                                                    >
                                                        <span className='indicator-label'>Update Password</span>
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
                                                        <span className='indicator-label'>Edit</span>
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
                                                    </button> */}
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
                {/* {OnAddModalIsOpen && <AddRoleModal isModalClosed={CloseAddModal} fetchRoledata={fetchdata} />}
                {OnEditModalIsOpen && <EditRoleModal roleId={SelectedId!} role={SelectedItem} isModalClosed={CloseEditModal} fetchRoledata={fetchdata} />}
                {OnViewModalIsOpen && <ViewRoleModal ModalHidden={OnViewModalIsOpen} isModalClosed={CloseViewModal} data={SelectedItem} />}
                {OnDeleteModalIsOpen && <DeleteRoleModal roleId={SelectedId!} ModalHidden={OnDeleteModalIsOpen} isModalClosed={CloseDeleteModal} fetchRoledata={fetchdata} />} */}
            </KTCardBody>
        </>
    )
}