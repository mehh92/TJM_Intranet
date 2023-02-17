<%@ Page Language="C#" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="ISO-8859-1">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">

    <title>TJM Intranet</title>
</head>
<body>
    <header>
        <div class="wrap-nav">
            <div class="voiture-nav">
                <img class="voiture" src="images/logo.png" alt="logo de TJM Automobile">
            </div>
            <%
                if (Session["id_user"] == null)
                {
            %>
            <div class="titre-nav">
                <h2>Intranet Entreprise</h2>
            </div>
            <%  } %>
            <%
                if (Session["id_user"] != null)
                {
                    string nom = (string) Session["nom"];
                    nom = nom.Substring(0, 1);
            %>
            <div class="header-info">
                <div class="header-infoconnexion"><%= Session["prenom"]+"."+nom%></div>
                <div><a href="Default.aspx?page=6"><img class="nav-img" src="images/deconnexion.png" width="50px" height="50px"></a></div>
            </div>

            <%  } %>
        </div>
    </header>

        
        <%
            if (Session["id_user"] == null)
            { 
        %>
            <!-- #include file="connexion.aspx" -->
         <% } %>
        
    
    <%
        if (Session["id_user"] != null)
        {
            %>
            <div class="flex-home">
                <div class="text-nav">
                    <ul class="bandeau">
                        <li><a class="effect" href="Default.aspx?page=1">Accueil</a></li>
                        <li><a class="effect" href="Default.aspx?page=2&action=edit&idemploye=<%=Session["id_user"]%>">Mon profil</a></li>
                        <li><a class="effect" href="Default.aspx?page=3">Mon plannings</a></li>
                        <%
                            if (Session["role"] != null && Session["role"].Equals("manager"))
                            {
                            %>
                        <li><a class="effect" href="Default.aspx?page=4">Gestion employés</a></li>
                        <%
                            }
                            %>
                        <li><a class="effect" href="Default.aspx?page=5">Mes fiches de paie</a></li>
                    </ul>
                </div>
                <div class="conteneur">
            
                    <% 

                    int page = 0;
                    if (Request["page"] != null)
                    {
                        page = int.Parse(Request["page"]);
                    } 
                    else
                    {
                        page = 0;
                    }
                    switch(page)
                    {
                        case 1: %> <!-- #include file="accueil.aspx" --><% break;
                        case 2: %> <!-- #include file="employe.aspx" --><% break;
                        case 3: %> <!-- #include file="planning.aspx" --><% break;
                        case 4: %> <!-- #include file="gestion_employe.aspx" --><% break;
                        case 5: %> <!-- #include file="paie.aspx" --><% break;
                        case 6:
                            Session.Remove("id_user");
                            Session.Abandon();
                            Response.Redirect("Default.aspx", false);
                            break;
                    }
        }
                    %>
               </div>
         </div> 

    <script type="text/javascript" src="script/functions.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>