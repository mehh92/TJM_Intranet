

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


$(document).ready(function() {

    var btnPlanning = document.querySelector('#btn-absence');
    var gestionplanning = document.querySelector('.div-hide-absence');

    $(btnPlanning).click(function() { 

        gestionplanning.classList.toggle('active');

    });


    var buttonrh = document.querySelector('#btn-rh');
    var gestionEmploye = document.querySelector('.div-hide-employe');
    var gestionPaie = document.querySelector('.div-hide-paie');


    $(buttonrh).click(function() {

        gestionEmploye.classList.toggle('active');
        gestionPaie.classList.toggle('active');

    });

    var buttontacheabs = document.querySelector('#btn-activite');
    var gestiontaches = document.querySelector('.div-hide-tache');

    $(buttontacheabs).click(function() {

        gestiontaches.classList.toggle('active');

    });

    

});