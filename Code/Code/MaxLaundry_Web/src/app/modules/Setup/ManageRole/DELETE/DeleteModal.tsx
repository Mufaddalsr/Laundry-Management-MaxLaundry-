import { FC, useEffect, useState } from 'react'
import { ErrorToast, SuccessToast } from '../../../../components/ToastMessages'
import { Button, Modal } from 'react-bootstrap'
import { DeleteTblRole } from '../../../../services/services'

type DeleteModalProps = {
  roleId: number
  fetchRoledata: Function
  ModalHidden: boolean
  isModalClosed: Function
}

export const DeleteRoleModal = (props: DeleteModalProps) => {
  const [loading, setLoading] = useState(false)

  const HandleDelete = () => {
    try {
      const deleteData = async () => {
        setLoading(true)
        await DeleteTblRole(props.roleId.toString())
          .then(async (response) => {
            if (response.status == 201 || 200 || 204) {
              await props.fetchRoledata()
              props.isModalClosed()
              SuccessToast({ message: 'Successfully Deleted' })
            }
          })
          .catch((reason) => { throw (reason) })
      }
      deleteData()
    } catch (err) {
      console.log(err)
      setLoading(false)
      ErrorToast({ message: 'Something went wrong' })
      props.isModalClosed()
      // props.setDeletePopUp(false)
    }
  }
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
            Are you sure you want to permanently delete ?
          </Modal.Title>
        </Modal.Header>
        <Modal.Footer>
          <Button variant='secondary' onClick={() => props.isModalClosed()}>
            Close
          </Button>
          {loading ? (
            <Button variant='danger' disabled>
              Deleting...
            </Button>
          ) : (
            <Button variant='danger' onClick={HandleDelete}>
              Delete
            </Button>
          )}
        </Modal.Footer>
      </Modal>
    </>
  )
}