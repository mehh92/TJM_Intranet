document.getElementById("btn-valider").style.display = "none";

function removeDisabled() {

    document.getElementById('nom').disabled = false;
    document.getElementById("prenom").disabled = false;
    document.getElementById("email").disabled = false;
    document.getElementById("tel").disabled = false;
    document.getElementById("adresse").disabled = false;
    document.getElementById("mdp").disabled = false;
}

function toggleHideShow() {

    let btn_modif = document.getElementById("btn-modif");


    if (btn_modif.style.display === "none") {
        btn_modif.style.display = "block";
    } else {
        btn_modif.style.display = "none";
        document.getElementById("btn-valider").style.display = "block";
    }
}

function insertionOK() { 
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    })

    Toast.fire({
        icon: 'success',
        title: 'Signed in successfully'
    })
}