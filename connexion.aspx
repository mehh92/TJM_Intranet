
 <!-- #include file="vue/vue_connexion.aspx" -->

<%
    if (Request.Form["seConnecter"] != null)
    {
        string email = Request.Form["email"];
        string mdp = Request.Form["mdp"];
        Intranet.Employe unEmploye = Intranet.Controleur.SelectWhereEmploye(email, mdp);

        string chaineConnect = "";
        if (unEmploye == null)
        {
            chaineConnect += "veuillez vérifier vos identifiants";
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
        Response.Redirect("Default.aspx?page=1");
    }
%>