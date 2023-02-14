<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>

<h2>Gestion des employés</h2>

<h4>Insertion d'un employé</h4>


<%
    Employe lEmploye = null;
    if (Request["page"] != null && Request["action"] != null && Request["idemploye"] != null)
    {
        string action = Request["action"];
        int idemploye = int.Parse(Request["idemploye"]);
        switch(action)
        {
            case "sup" : Intranet.Controleur.DeleteEmploye(idemploye);
            break;

            case "edit" : lEmploye = Intranet.Controleur.SelectWhereEmploye(idemploye);
            break;
        }

    }



%>

<!-- #include file="vue/vue_insert_employe.aspx"-->

<%
    String message = "";

    if (Request.Form["valider"] != null)
    {
        string nom = Request.Form["nom"];
        string prenom = Request.Form["prenom"];
        string email = Request.Form["email"];
        string tel = Request.Form["tel"];
        string adresse = Request.Form["adresse"];
        string mdp = Request.Form["mdp"];
        string role = Request.Form["role"];

        Intranet.Employe unEmploye = new Employe(nom, prenom, email, tel, adresse, mdp, role);
        Intranet.Controleur.InsertEmploye(unEmploye);
        message = "<br> Insertion réussie de l'employé";
    }

      if (Request.Form["modifier"] != null ){
        String nom = Request.Form["nom"];
        String prenom = Request.Form["prenom"];
        String email = Request.Form["email"];
        String tel = Request.Form["tel"];
        String adresse = Request.Form["adresse"];
        String mdp = Request.Form["mdp"];
        String role = Request.Form["role"];
        int id_user = int.Parse(Request["idemploye"]);

        Intranet.Employe unEmploye = new Employe(id_user, nom, prenom, email, tel, adresse, mdp, role);

        Intranet.Controleur.UpdateEmploye(unEmploye);
        message = "<br> Modification reussie";
        Response.Redirect("Default.aspx?page=2");
        
    }
%>



<%= message %>


<%
    List<Intranet.Employe> lesEmployes = Intranet.Controleur.SelectAllEmployes();

%>

<!-- #include file="vue/vue_les_employes.aspx" -->