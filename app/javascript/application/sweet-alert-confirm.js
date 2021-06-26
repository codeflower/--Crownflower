import Swal from 'sweetalert2';
import Rails from '@rails/ujs';

// window.Swal = Swal;
const swalWithBootstrapButtons = Swal.mixin({
  customClass: {
    confirmButton: 'btn btn-success',
    cancelButton: 'btn btn-danger'
  },
  buttonsStyling: false
})

// Behavior after click to confirm button
const confirmed = (element, result) => {
    // If result `success`
    if (result.value) {
        // Removing attribute for unbinding JS event.
        element.removeAttribute('data-confirm-swal');
        // Following a destination link
        element.click();
        swalWithBootstrapButtons.fire(
          'Deleted!',
          'Your file has been deleted.',
          'success'
        )
        
    } else if (result.dismiss === Swal.DismissReason.cancel){
      swalWithBootstrapButtons.fire(
        'Cancelled',
        'Your imaginary file is safe :)',
        'error'
      )
      element.removeClass('ui-btn-active ui-focus');
        // Removing attribute for unbinding JS event.
        // element.removeAttribute('data-confirm-swal');
    }
  };

// Display the confirmation dialog
const showConfirmationDialog = (element) => {
  
    const message = element.getAttribute('data-confirm-swal');
    const text    = element.getAttribute('data-text');

    swalWithBootstrapButtons.fire({
        title:             message || 'Are you sure?',
        text:              text || '',
        icon:              'warning',
        showCancelButton:  true,
        confirmButtonText: 'Yes',
        cancelButtonText:  'Cancel',
    }).then(result => confirmed(element, result));

};

const allowAction = (element) => {
    if (element.getAttribute('data-confirm-swal') === null) {
        return true;
    }

    showConfirmationDialog(element);
    return false;
};

function handleConfirm(element) {
    if (!allowAction(this)) {
        Rails.stopEverything(element);
    }
}

Rails.delegate(document, 'a[data-confirm-swal]', 'click', handleConfirm);
