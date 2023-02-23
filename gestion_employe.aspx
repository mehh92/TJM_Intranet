<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>


<h2>Gestion des employes</h2>



<%
    Employe leEmploye = null;

    if (Request["page"] != null && Request["action"] != null && Request["idemploye"] != null)
    {
    string action = Request["action"];
    int idemploye = int.Parse(Request["idemploye"]);

    switch(action)
        {
            case "sup" : Intranet.Controleur.DeleteEmploye(idemploye); break;
            case "edit" : leEmploye = Intranet.Controleur.SelectWhereEmploye(idemploye); break;
        }
    }
%>


<h4>Insertion d'un employé</h4> <img src="images/ajouter.png">

<!-- #include file="vue/vue_insert_employe.aspx"-->

<% 

    if (Request.Form["validerEmp"] != null){
    String nom = Request.Form["nom"];
    String prenom = Request.Form["prenom"];
    String email = Request.Form["email"];
    String tel = Request.Form["tel"];
    String adresse = Request.Form["adresse"];
    String mdp = Request.Form["mdp"];
    String role = Request.Form["role"];



    Intranet.Employe unEmploye = new Employe(nom, prenom, email, tel, adresse, mdp, role);

    Intranet.Controleur.InsertEmploye(unEmploye);
    message = "<br/> Insertion reussie de l'employé";
    }


    if (Request.Form["modifierEmp"] != null){
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
    Response.Redirect("Default.aspx?page=4");
        
    }



%>


<% 
    List<Intranet.Employe> lesEmployes = Intranet.Controleur.SelectAllEmployes();
%>

 <!-- #include file="vue/vue_les_employes.aspx"-->


<h2>Gestion des paies</h2>

<%
    Paie laPaie = null;

    if (Request["page"] != null && Request["action"] != null && Request["id_paie"] != null)
    {
    string action = Request["action"];
    int id_paie = int.Parse(Request["id_paie"]);


    switch(action)
        {
            case "sup" : Intranet.Controleur.DeletePaie(id_paie); break;
            case "edit" : laPaie = Intranet.Controleur.SelectWherePaie2(id_paie); break;

        }
    }
%>


<h4>Insertion d'une paie</h4> <img src="images/ajouter.png">



<!-- #include file="vue/vue_insert_paie_gestion.aspx"-->

<% 

    if (Request.Form["validerPaie"] != null){
    
    float montant = float.Parse(Request["montant"]);
    String date_versement = Request.Form["date_versement"];
    String description = Request.Form["description"];
    String objet = Request.Form["objet"];
    int id_userPaie = int.Parse(Request["id_user"]);

    Intranet.Paie unePaie = new Paie(id_userPaie, montant, date_versement, description, objet);

    Intranet.Controleur.InsertPaie(unePaie);
    message = "<br/> Insertion reussie de la paie";
    }


    if (Request.Form["modifierPaie"] != null){
    
    float montant = float.Parse(Request["montant"]);
    String date_versement = Request.Form["date_versement"];
    String description = Request.Form["description"];
    String objet = Request.Form["objet"];
    int id_userPaie = int.Parse(Request["id_user"]);
    int id_paie = int.Parse(Request["id_paie"]);

    Intranet.Paie unePaie = new Paie(id_paie, id_userPaie, montant, date_versement, description, objet);

    Intranet.Controleur.UpdatePaie(unePaie);
    message = "<br> Modification reussie";
    Response.Redirect("Default.aspx?page=4");
        
    }

%>


<% 
    List<Intranet.Paie> lesPaies = Intranet.Controleur.SelectAllPaies();
%>

 <!-- #include file="vue/vue_les_paies_gestion.aspx"-->

<h2>Gestion des taches</h2>

<%
    Vtaches uneVtache = null;

    if (Request["page"] != null && Request["action"] != null && Request["id_tache"] != null)
    {
    string action = Request["action"];
    int id_tache = int.Parse(Request["id_tache"]);


    switch(action)
        {
            case "sup" : Intranet.Controleur.DeleteTache(id_tache); break;
            case "edit" : uneVtache = Intranet.Controleur.SelectWhereTache2(id_tache); break;

        }
    }
%>


<h4>Insertion d'une tache</h4> <img src="images/ajouter.png">



<!-- #include file="vue/vue_insert_tache_gestion.aspx"-->

<% 

    if (Request.Form["validerTache"] != null){
    
    String date_tache = Request.Form["date_tache"];
    String heure_tache = Request.Form["heure_tache"];
    String lieu = Request.Form["lieu"];
    String motif = Request.Form["motif"];
    int id_userTache = int.Parse(Request["id_user"]);

    Intranet.Tache uneTache = new Tache(id_userTache, date_tache, heure_tache, lieu, motif);

    Intranet.Controleur.InsertTache(uneTache);
    message = "<br/> Insertion reussie de la tache";
    }


    if (Request.Form["modifierTache"] != null){
    
    String date_tache = Request.Form["date_tache"];
    String heure_tache = Request.Form["heure_tache"];
    String lieu = Request.Form["lieu"];
    String motif = Request.Form["motif"];
    int id_tache = int.Parse(Request["id_tache"]);
    int id_userTache = int.Parse(Request["id_user"]);
    

    Intranet.Tache uneTache = new Tache(id_tache, id_userTache, date_tache, heure_tache, lieu, motif);

    Intranet.Controleur.UpdateTache(uneTache);
    message = "<br> Modification reussie";
    Response.Redirect("Default.aspx?page=4");
        
    }

%>


<% 
    


    String nomTacheGestion = "";

    List<Intranet.Vtaches> lesVTachesGestion = Intranet.Controleur.SelectAllVtaches();

    if (Request.Form["rechercherTacheGestion"] != null)
    {
      nomTacheGestion = Request.Form["nomTacheGestion"];
        

        if (nomTacheGestion == "")
        {
           lesVTachesGestion = Intranet.Controleur.SelectAllVtaches();
        }
        else
        {
            lesVTachesGestion = Intranet.Controleur.SelectWhereVtaches(nomTacheGestion);
        }
    }
%>

 <!-- #include file="vue/vue_les_taches_gestion.aspx"-->

