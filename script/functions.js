

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
    var gestionplanning = document.querySelector('.hide-absence');
    var lesplannings = document.querySelector('.hide-lesabsences');

    $(btnPlanning).click(function() { 

        gestionplanning.classList.toggle('active');
        lesplannings.classList.toggle('active');

    });


    var buttonrh = document.querySelector('#btn-rh');
    var gestion = document.querySelector('.hide-gestion');
    var lesgestions = document.querySelector('.hide-lesgestions');

    $(buttonrh).click(function() {

        gestion.classList.toggle('active');
        lesgestions.classList.toggle('active');

    });

    var buttontacheabs = document.querySelector('#btn-activite');
    var gestiontacheabs = document.querySelector('.hide-tache');
    var lesgestionstachesabs = document.querySelector('.hide-lestachesabsences');

    $(buttontacheabs).click(function() {

        gestiontacheabs.classList.toggle('active');
        lesgestionstachesabs.classList.toggle('active');

    });

    

});