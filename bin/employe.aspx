<%@ Import Namespace="Intranet" %>

<h2>Gestion des mécaniciens</h2>

<h4>Insertion d'un mécanicien</h4>


<%
    if (Request["page"] != null && Request["action"] != null && Request["idmecanicien"] != null)
    {
        string action = Request["action"];
        int idmecanicien = int.Parse(Request["idmecanicien"]);
        switch(action)
        {
            case "sup" : Intranet.Controleur.DeleteMecanicien(idmecanicien);
            break;
        }

    }

%>

<!-- #include file="vue/vue_insert_mecanicien.aspx"-->

<%
    String message = "";

    if (Request.Form["valider"] != null)
    {
        string nom = Request.Form["nom"];
        string prenom = Request.Form["prenom"];
        string email = Request.Form["email"];

        String mdp = Request.Form["mdp"];

        String adresse = Request.Form["adresse"];

        Intranet.Mecanicien unMecanicien = New Mecanicien(nom, prenom, email, mdp, adresse);
        Intranet.Controleur.InsertMecanicien(unMecanicien);
        message = "<br> Insertion réussie du mécanicien";
    }
%>

<%= message %>


<%
    List<Intranet.Mecanicien> lesMecaniciens = Intranet.Controleur.SelectAllMecaniciens();

%>

<!-- #include file="vue/vue_les_mecaniciens.aspx" -->