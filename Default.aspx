<%@ Page Language="C#" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="ISO-8859-1">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <title>TJM Recrutement</title>
</head>
<body>
    <header>
        <div class="wrap-nav">
            <div class="voiture-nav">
                <img class="voiture" src="images/logo.png" alt="logo de TJM Automobile">
            </div>
            <div class="text-nav">
                <ul>
                    <li><a href="index.jsp?page=0"><img class="nav-img" src="images/deconnexion.png" width="50px" height="50px"></a></li>
                </ul>
            </div>
        </div>
    </header>
    <center>
        <h1>Intranet des employés</h1>
        <br>

        <!-- #include file="vue/vue_connexion.aspx" -->
    
    <%
        if (Request.Form["seConnecter"] != null)
        {
            string email = Request.Form["email"];
            string mdp = Request.Form["mdp"];
            Intranet.Employe unEmploye = Intranet.Controleur.SelectWhereEmploye(email, mdp);

            string chaineConnect = "";
            if(unEmploye == null)
            {
                chaineConnect += "veuillez vérifier vos identifiants";
            }
            else
            {
                Session["id"] = unEmploye.IdUser;
                Session["nom"] = unEmploye.Nom;
                Session["prenom"] = unEmploye.Prenom;
                Session["email"] = unEmploye.Email;

                chaineConnect += "Bienvenu " + Session["Prenom"];
            }
            Response.Write(chaineConnect);
            Response.Redirect("Default.aspx?page=1");
        }
    %>

    <a href="Default.aspx?page=0">Accueil</a>
    <a href="Default.aspx?page=1">Mon profil</a>
    <a href="Default.aspx?page=2">Mes congés et absences</a>
    <a href="Default.aspx?page=3">Ma fiche de paie</a>
    <a href="Default.aspx?page=4">Mon planning</a>



    <%
        /*string chaineHeader =" <a href='Default.aspx?page=1'>Gestion des clients</a> <a href='Default.aspx?page=2'>Gestion des techniciens</a> <a href='Default.aspx?page=3'>Gestion des interventions</a><a href='Default.aspx?page=4'>Déconnexion</a> ";*/
        if (Session["id"] != null)
        {
            Response.Write(chaineHeader);
        }
    %>


    <%
        int page = 0;
        if (Request["page"] != null)
        {
            page = int.Parse(Request["page"]);
        } else
        {
            page = 0;
        }
        switch(page)
        {
            case 0:  break;

            
            case 1:
                Session.Remove("id");
                Session.Abandon();
                Response.Redirect("Default.aspx?page=0", false);
                break;
         }

        %>

    </center>
</body>
</html>