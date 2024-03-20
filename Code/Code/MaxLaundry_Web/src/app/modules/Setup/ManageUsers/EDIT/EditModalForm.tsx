import { FC, useEffect, useState } from 'react'
import * as Yup from 'yup'
import { Field, useFormik, yupToFormErrors } from 'formik'
import { isNotEmpty } from '../../../../../_metronic/helpers'
import clsx from 'clsx'
import { ItblAccess } from '../../../../models/tblAccess'
import { GetTblAccesses, PostTblRole, PostTblRoleDetail, PutTblRole, PutTblRoleDetail } from '../../../../services/services'
import { ItblRole, tblRole } from '../../../../models/tblRole'
import { SuccessToast } from '../../../../components/ToastMessages'

type Props = {
    fetchRoledata: Function
    closeModal: Function
    roleId: number
    role?: ItblRole
}

const AddModalForm = (props: Props) => {
    const [isloading, setLoading] = useState(true)
    const [AccessData, setAccessData] = useState<ItblAccess[]>([])

    const FetchData = async () => {
        try {
            setLoading(true)
            await GetTblAccesses()
                .then((response) => setAccessData(response.data))
                .catch((reason) => { throw (reason) })
            setLoading(false)
        } catch (error) {
            console.log(error)
        }
    }

    useEffect(() => {
        FetchData()
    }, [])

    const [initForEdit] = useState({
        roleDesc: props.role?.roleDesc,
        accessArray: [1,2,3,4]

    })
    const validationSchema = Yup.object().shape({
        roleDesc: Yup.string()
            .required('Please enter Name'),
        accessArray: Yup.array()
            .required('Selection Required')
    })

    const formik = useFormik({
        initialValues: initForEdit,
        validationSchema: validationSchema,
        onSubmit: async (values, { setSubmitting }) => {
            setSubmitting(true)
            try {
                if (isNotEmpty(values.roleDesc)) {
                    // console.log(values)
                    const newrole: tblRole = {
                        roleDesc: values.roleDesc,
                        isActive: true
                    }
                    await PutTblRole(newrole)
                        .then(async (response) => {
                            if (response.status == 200 || 201) {
                                await values.accessArray.forEach(async (accessId) => {
                                    await PutTblRoleDetail({ roleId: response.data.roleId, accessId: accessId, })
                                        .then((response) => { })
                                        .catch((reason) => { throw (reason) })
                                })
                                SuccessToast({ message: 'Access Updated to Role' })
                                props.closeModal()
                            }
                        })
                        .catch((reason) => { throw (reason) })
                }
            } catch (ex) {
                console.error(ex)
            } finally {
                setSubmitting(false)
            }
        },
    })

    return (
        <>
            <form id='kt_modal_edit_role_form' className='form' onSubmit={formik.handleSubmit} noValidate>
                {/* begin::Scroll */}
                <div
                    className='d-flex flex-column scroll-y me-n7 pe-7'
                    id='kt_modal_edit_role_scroll'
                    data-kt-scroll='true'
                    data-kt-scroll-activate='{default: false, lg: true}'
                    data-kt-scroll-max-height='auto'
                    data-kt-scroll-dependencies='#kt_modal_edit_role_header'
                    data-kt-scroll-wrappers='#kt_modal_edit_role_scroll'
                    data-kt-scroll-offset='300px'
                >
                    <div className='fv-row mb-7'>
                        <div className='col'>
                            <label className='required fw-bold fs-6 mb-2'>Role Name</label>
                            <input
                                placeholder=''
                                {...formik.getFieldProps('roleDesc')}
                                className={clsx(
                                    'form-control form-control-solid mb-3 mb-lg-0',
                                    { 'is-invalid': formik.touched.roleDesc && formik.errors.roleDesc },
                                    // {'is-valid': formik.touched.roleDesc && !formik.errors.roleDesc }
                                )}
                                type='text'
                                id="roleDesc"
                                name='roleDesc'
                                autoComplete='off'
                            />
                            {formik.errors.roleDesc && (
                                <div className='fv-plugins-message-container'>
                                    <div className='fv-help-block'>
                                        <span role='alert'>{formik.errors.roleDesc}</span>
                                    </div>
                                </div>
                            )}
                        </div>
                    </div>

                    <div className="fv-row mb-7">
                        <label className='required fw-bold fs-6 mb-2'>Access Permissions</label>
                        {!isloading &&
                            <div role="group" aria-labelledby="checkbox-group">
                                {AccessData.map((access) =>
                                    <label className='form-check form-check-sm form-check-custom form-check-solid d-flex px-5 py-3'>
                                        <input
                                            {...formik.getFieldProps('accessArray')}
                                            className={'form-check-input'}
                                            type='checkbox'
                                            key={access.accessId}
                                            value={access.accessId}
                                            name='accessArray'
                                            disabled={formik.isSubmitting}
                                        />
                                        <span className='form-check-label'>{access.accessDesc}</span>
                                    </label>
                                )}
                            </div>
                        }
                    </div>

                </div>
                {/* end::Scroll */}

                {/* begin::Actions */}
                <div className='text-center pt-15'>
                    <button
                        type='reset'
                        onClick={() => props.closeModal()}
                        className='btn btn-light me-3'
                        data-kt-users-modal-action='cancel'
                        disabled={formik.isSubmitting}
                    >
                        Discard
                    </button>

                    <button
                        type='submit'
                        className='btn btn-primary'
                        data-kt-users-modal-action='submit'
                        disabled={formik.isSubmitting || !formik.isValid || !formik.touched}
                    >
                        <span className='indicator-label'>Submit</span>
                        {(formik.isSubmitting) && (
                            <span className='indicator-progress'>
                                Please wait...{' '}
                                <span className='spinner-border spinner-border-sm align-middle ms-2'></span>
                            </span>
                        )}
                    </button>
                </div>
                {/* end::Actions */}
            </form>
            {/* {(formik.isSubmitting) && <Loading />} */}
        </>
    )
}

export { AddModalForm }
