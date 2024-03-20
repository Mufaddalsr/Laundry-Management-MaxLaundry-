import { FC, useEffect, useState } from 'react'
import { ErrorToast, SuccessToast } from '../../../../components/ToastMessages'
import { Button, Modal } from 'react-bootstrap'
import { DeleteTblRole } from '../../../../services/services'
import { ItblRole } from '../../../../models/tblRole'

type ViewModalProps = {
  data?: ItblRole
  ModalHidden: boolean
  isModalClosed: Function
}

export const ViewRoleModal = (props: ViewModalProps) => {
  return (
    <>
      <Modal
        aria-labelledby='contained-modal-title-vcenter'
        centered
        show={props.ModalHidden}
        onHide={() => props.isModalClosed()}
      >
        <Modal.Header closeButton>
          <Modal.Title id='contained-modal-title-vcenter'>
            View Access
          </Modal.Title>
        </Modal.Header>
        <Modal.Body>
          {props.data?.tblRoleDetails.map((details) => {
            return <span className="badge badge-light-primary me-2 mb-1">{details.access.accessDesc}</span>
          })}
        </Modal.Body>
        <Modal.Footer>
          <Button variant='secondary' onClick={() => props.isModalClosed()}>
            Close
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  )
}