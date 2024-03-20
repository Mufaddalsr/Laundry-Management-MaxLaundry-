import { Toast, ToastContainer } from "react-bootstrap"
import toastr from 'toastr';
import 'toastr/build/toastr.css';

type Props = {
    title?: string,
    message: string
}

export const SuccessToast = ({ title = 'Success', message }: Props) => {
    toastr.options = {
        closeButton: true,
        positionClass: "toast-top-right",
        newestOnTop: true,
        preventDuplicates: false,
        progressBar: true,
        hideMethod: "fadeOut",
        showMethod: "fadeIn",
        showEasing: "swing",
        hideEasing: "linear",
        showDuration: 300,
        hideDuration: 1000,
        timeOut: 5000,
        extendedTimeOut: 1000,
    }
    toastr.success(message, title);
}

export const ErrorToast = ({ title = 'Error', message }: Props) => {
    toastr.options = {
        closeButton: true,
        positionClass: "toast-top-right",
        newestOnTop: true,
        preventDuplicates: true,
        progressBar: true,
        hideMethod: "fadeOut",
        showMethod: "fadeIn",
        showEasing: "swing",
        hideEasing: "linear",
        showDuration: 300,
        hideDuration: 1000,
        timeOut: 5000,
        extendedTimeOut: 1000,
    }
    toastr.error(message, title);
}

export const InfoToast = ({ title = 'Info', message }: Props) => {
    toastr.options = {
        closeButton: true,
        positionClass: "toast-top-right",
        newestOnTop: true,
        preventDuplicates: true,
        progressBar: true,
        hideMethod: "fadeOut",
        showMethod: "fadeIn",
        showEasing: "swing",
        hideEasing: "linear",
        showDuration: 300,
        hideDuration: 1000,
        timeOut: 5000,
        extendedTimeOut: 1000,
    }
    toastr.info(message, title);
}

export const WarningToast = ({ title = 'Warning', message }: Props) => {
    toastr.options = {
        closeButton: true,
        positionClass: "toast-top-right",
        newestOnTop: true,
        preventDuplicates: true,
        progressBar: true,
        hideMethod: "fadeOut",
        showMethod: "fadeIn",
        showEasing: "swing",
        hideEasing: "linear",
        showDuration: 300,
        hideDuration: 1000,
        timeOut: 5000,
        extendedTimeOut: 1000,
    }
    toastr.warning(message, title);
}