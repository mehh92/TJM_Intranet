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

    <title>TJM Intranet</title>
</head>
<body>
    <header>
        <div class="wrap-nav">
            <div class="voiture-nav">
                <img class="voiture" src="images/logo.png" alt="logo de TJM Automobile">
            </div>
            <%
                if (Session["id"] != null)
                {
            %>
                <div class="text-nav">
                    <ul>
                        <li><a href="Default.aspx?page=4"><img class="nav-img" src="images/deconnexion.png" width="50px" height="50px"></a></li>
                    </ul>
                </div>
            <%  } %>
        </div>
    </header>

        
        <%
            if (Session["id"] == null)
            { 
        %>
        <!-- #include file="vue/vue_connexion.aspx" -->
        <% } %>
        
    <%
        if (Request.Form["seConnecter"] != null)
        {
            string email = Request.Form["email"];
            string mdp = Request.Form["mdp"];
            Intranet.Employe unEmploye = Intranet.Controleur.SelectWhereEmploye(email, mdp);

            string chaineConnect = "";
            if(unEmploye == null)
            {
                chaineConnect += "veuillez v�rifier vos identifiants";
            }
            else
            {
                Session["id"] = unEmploye.Id_user;
                Session["nom"] = unEmploye.Nom;
                Session["prenom"] = unEmploye.Prenom;
                Session["email"] = unEmploye.Email;

                chaineConnect += "Bienvenu " + Session["Prenom"];
            }
            Response.Write(chaineConnect);
            Response.Redirect("Default.aspx?page=0");
        }
    %>



    
    <%
        /*string chaineHeader =" <a href='Default.aspx?page=1'>Gestion des clients</a> <a href='Default.aspx?page=2'>Gestion des techniciens</a> <a href='Default.aspx?page=3'>Gestion des interventions</a><a href='Default.aspx?page=4'>D�connexion</a> ";*/
      
        if (Session["id"] != null)
        { %>
        <div class="container-bandeau text-nav">
            <ul class="bandeau">
                <li><a class="effect" href="Default.aspx?page=0">Accueil</a></li>
                <li><a class="effect" href="Default.aspx?page=1">Mon profil</a></li>
                <li><a class="effect" href="Default.aspx?page=2">Mon plannings</a></li>
                <li><a class="effect" href="Default.aspx?page=3">Mes fiches de paie</a></li>
            </ul>
        </div>

             <% /*Response.Write(chaineHeader);*/
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
            case 0: break;


            case 1: %> <!-- #include file="employe.aspx" --><% break;

            case 2: break;

            case 3: break;

            case 4:
                Session.Remove("id");
                Session.Abandon();
                Response.Redirect("Default.aspx?page=0", false);
                break;

        }

        %>

    
</body>
</html>