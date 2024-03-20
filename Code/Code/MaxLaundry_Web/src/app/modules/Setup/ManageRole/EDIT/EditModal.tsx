import { useEffect, useState } from 'react'
import { KTSVG } from '../../../../../_metronic/helpers'
import { AddModalForm } from './EditModalForm'
import { ItblRole } from '../../../../models/tblRole'

type Props = {
  fetchRoledata: Function
  isModalClosed: Function
  role?: ItblRole
  roleId: number
}

const EditRoleModal = (props: Props) => {
  useEffect(() => {
    document.body.classList.add('modal-open')
    return () => {
      document.body.classList.remove('modal-open')
    }
  }, [])

  return (
    <>
      <div
        className='modal fade show d-block'
        id='kt_modal_edit_role'
        role='dialog'
        tabIndex={-1}
        aria-modal='true'
      >
        <div className='modal-dialog modal-dialog-centered mw-650px'>
          <div className='modal-content'>
            <div className='modal-header'>
              <h2 className='fw-bolder'>Add Role</h2>
              <div
                className='btn btn-icon btn-sm btn-active-icon-primary'
                data-kt-users-modal-action='close'
                onClick={() => props.isModalClosed()}
                style={{ cursor: 'pointer' }}
              >
                <KTSVG
                  path="media/icons/duotune/arrows/arr061.svg"
                  className="svg-icon svg-icon-2x"
                />
              </div>
            </div>
            <div className='modal-body scroll-y mx-5 mx-xl-15 my-7'>
              <AddModalForm
                closeModal={props.isModalClosed}
                fetchRoledata={props.fetchRoledata}
                roleId={props.roleId}
                role={props.role} />
            </div>
          </div>
        </div>
      </div>
      <div className='modal-backdrop fade show'></div>
    </>
  )
}

export { EditRoleModal }
