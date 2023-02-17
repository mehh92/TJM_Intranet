<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>



<%
    Employe lEmploye = null;
    if (Request["page"] != null && Request["action"] != null && Request["idemploye"] != null)
    {
        string action = Request["action"];
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
        string nom = Request.Form["nom"];
        string prenom = Request.Form["prenom"];
        string email = Request.Form["email"];
        string tel = Request.Form["tel"];
        string adresse = Request.Form["adresse"];
        string mdp = Request.Form["mdp"];
        String role = Request.Form["role"];

        Intranet.Employe unEmploye = new Employe(id_user, nom, prenom, email, tel, adresse, mdp, role);

        Intranet.Controleur.UpdateEmploye(unEmploye);
        Response.Redirect("Default.aspx?page=2&action=edit&idemploye="+id_user);
        message = "<br> Modification reussie";
        
    }
%>

<%= message %>

<%
    List<Intranet.Employe> lesEmployes = Intranet.Controleur.SelectAllEmployes();

%>

<!-- #include file="vue/vue_les_employes.aspx" -->