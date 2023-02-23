<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>



<%
    Employe lEmploye = null;
    if (Request["page"] != null && Request["action"] != null && Request["idemploye"] != null)
    {
        String action = Request["action"];
        int idemploye = int.Parse(Request["idemploye"]);
        switch(action)
        {
            case "edit" : lEmploye = Intranet.Controleur.SelectWhereEmploye(idemploye);
            break;
        }
    }
%>

<!-- #include file="vue/vue_modifier_profil.aspx"-->

<%
    String message = "";

      if (Request.Form["valider"] != null ){

        int id_user = int.Parse(Request["idemploye"]);
        String nom = Request.Form["nom"];
        String prenom = Request.Form["prenom"];
        String email = Request.Form["email"];
        String tel = Request.Form["tel"];
        String adresse = Request.Form["adresse"];
        String mdp = Request.Form["mdp"];
        String role = (String) Session["role"];

        Intranet.Employe unEmploye = new Employe(id_user, nom, prenom, email, tel, adresse, mdp, role);

        Intranet.Controleur.UpdateEmploye(unEmploye);
        Response.Redirect("Default.aspx?page=2&action=edit&idemploye=" + id_user);
        message = "<br> Modification reussie";
        
    }
%>

<%= message %>

