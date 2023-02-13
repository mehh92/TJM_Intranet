<%@ Import Namespace="Intranet" %>

<h2>Gestion des mécaniciens</h2>

<h4>Insertion d'un mécanicien</h4>


<%
    if (Request["page"] != null && Request["action"] != null && Request["idemploye"] != null)
    {
        string action = Request["action"];
        int idemploye = int.Parse(Request["idemploye"]);
        switch(action)
        {
            case "sup" : Intranet.Controleur.DeleteEmploye(idemploye);
            break;

            //case "edit" : Intranet.Controleur.UpdateEmploye(idemploye);
            //break;
        }

    }

%>

<!-- #include file="vue/vue_insert_employe.aspx"-->

<%
    string message = "";

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
%>

<%= message %>


<%
    List<Intranet.Employe> lesEmployes = Intranet.Controleur.SelectAllEmployes();

%>

<!-- #include file="vue/vue_les_employes.aspx" -->