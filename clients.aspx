<%@ Import Namespace="Depannage" %>

<h2>Gestion des clients</h2>

<h4>Insertion d'un client</h4>

<!-- #include file="vue/vue_insert_client.aspx"-->

<%
    string message = "";

    if (Request.Form["valider"] != null)
    {
        string nom = Request.Form["nom"];
        string prenom = Request.Form["prenom"];
        string adresse = Request.Form["adresse"];
        string email = Request.Form["email"];
        string mdp = Request.Form["mdp"];

        //instancier la classe Client
        Depannage.Client unClient = new Client(nom, prenom, email, mdp, adresse);

        //insertion dans la base de données
        Depannage.Controleur.InsertClient(unClient);
        message = "<br> Insertion réussie du client";
    }
%>

<%= message %>