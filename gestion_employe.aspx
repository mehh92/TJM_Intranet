<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Diagnostics" %>

<div class="container-paie">
    <h2 class="titre-gestion">Gestion des employés</h2>
    <div class="btn-gestion">
        <input class="input-bouton" id="btn-rh" type="button" name="btnrh" value="Gestion RH">
        <input class="input-bouton" id="btn-activite" type="button" name="btnactivite" value="Gestion de l'activité">
    </div>
</div>

<%
    Employe leEmploye = null;
    Tache laTache = null;
    Paie laPaie = null;

    if (Request["page"] != null && Request["action"] != null && Request["idtache"] != null)
    {
        string action = Request["action"];
        int idtache = int.Parse(Request["idtache"]);
        switch(action)
        {
            case "edit" : laTache = Intranet.Controleur.SelectWhereTacheGestion(idtache);
            break;

            case "sup" : Intranet.Controleur.DeleteTache(idtache);
            break;
        }
    }

    if (Request["page"] != null && Request["action"] != null && Request["idemployeg"] != null)
    {
        string action = Request["action"];
        int idemployeg = int.Parse(Request["idemployeg"]);
        switch(action)
        {
            case "edit" : leEmploye = Intranet.Controleur.SelectWhereEmploye(idemployeg);
            break;

            case "sup" : Intranet.Controleur.DeleteEmploye(idemployeg);
            break;
        }
    }

    if (Request["page"] != null && Request["action"] != null && Request["idpaie"] != null)
    {
        string action = Request["action"];
        int idpaie = int.Parse(Request["idpaie"]);
        switch(action)
        {
            case "edit" : laPaie = Intranet.Controleur.SelectWherePaieGestion(idpaie);
            break;

            case "sup" : Intranet.Controleur.DeletePaie(idpaie);
            break;
        }
    }

    if (Request["page"] != null && Request["action"] != null && Request["idabsenceg"] != null)
    {
        string action = Request["action"];
        int idabsenceg = int.Parse(Request["idabsenceg"]);
        switch(action)
        {
            case "sup" : Intranet.Controleur.DeleteAbsence(idabsenceg);
            break;
        }
    }
%>

<!-- #include file="vue/vue_insert_gestion.aspx"-->

<%

    if (Request.Form["ajouterLeEmploye"] != null )
    {
        string nomemploye = Request.Form["nomemploye"];
        string prenomemploye = Request.Form["prenomemploye"];
        string emailemploye = Request.Form["emailemploye"];
        string telemploye = Request.Form["telemploye"];
        string adresseemploye = Request.Form["adresseemploye"];
        string mdpemploye = Request.Form["mdpemploye"];
        string roleemploye = Request.Form["roleemploye"];

        Intranet.Employe unEmploye = new Employe(nomemploye, prenomemploye, emailemploye, telemploye, adresseemploye, mdpemploye, roleemploye);

        Intranet.Controleur.InsertEmploye(unEmploye);
        Response.Redirect("Default.aspx?page=4");
    }

    else if (Request.Form["modifierLeEmploye"] != null ){
        
        int idemployeg = int.Parse(Request["idemployeg"]);
        string nomemploye = Request.Form["nomemploye"];
        string prenomemploye = Request.Form["prenomemploye"];
        string emailemploye = Request.Form["emailemploye"];
        string telemploye = Request.Form["telemploye"];
        string adresseemploye = Request.Form["adresseemploye"];
        string mdpemploye = Request.Form["mdpemploye"];
        string roleemploye = Request.Form["roleemploye"];

        Intranet.Employe unEmploye = new Employe(idemployeg, nomemploye, prenomemploye, emailemploye, telemploye, adresseemploye, mdpemploye, roleemploye);

        Intranet.Controleur.UpdateEmploye(unEmploye);
        Response.Redirect("Default.aspx?page=4");   
    }


    if (Request.Form["ajouterLaTache"] != null ){

        int idusertache = int.Parse(Request.Form["idusertache"]);
        string datetache = Request.Form["datetache"];
        string heuretache = Request.Form["heuretache"];
        string lieutache = Request.Form["lieutache"];
        string motiftache = Request.Form["motiftache"];

        Intranet.Tache uneTache = new Tache(idusertache, datetache, heuretache, lieutache, motiftache);

        Intranet.Controleur.InsertTache(uneTache);
        Response.Redirect("Default.aspx?page=4");
    }

    else if (Request.Form["modifierLaTache"] != null ){
        
        int idtache = int.Parse(Request["idtache"]);
        int idusertache = int.Parse(Request.Form["idusertache"]);
        string datetache = Request.Form["datetache"];
        string heuretache = Request.Form["heuretache"];
        string lieutache = Request.Form["lieutache"];
        string motiftache = Request.Form["motiftache"];

        Intranet.Tache uneTache = new Tache(idtache, idusertache, datetache, heuretache, lieutache, motiftache);

        Intranet.Controleur.UpdateTache(uneTache);
        Response.Redirect("Default.aspx?page=4"); 
    }


    if (Request.Form["ajouterLaPaie"] != null ){

        int iduserpaie = int.Parse(Request.Form["iduserpaie"]);
        float montantpaie = float.Parse(Request.Form["montantpaie"]);
        string dateversementpaie = Request.Form["dateversementpaie"];
        string descriptionpaie = Request.Form["descriptionpaie"];
        string objetpaie = Request.Form["objetpaie"];

        Intranet.Paie unePaie = new Paie(iduserpaie, montantpaie, dateversementpaie, descriptionpaie, objetpaie);

        Intranet.Controleur.InsertPaie(unePaie);
        Response.Redirect("Default.aspx?page=4");
    }

    else if (Request.Form["modifierLaPaie"] != null ){
        
        int idpaie = int.Parse(Request["idpaie"]);
        int iduserpaie = int.Parse(Request.Form["iduserpaie"]);
        float montantpaie = float.Parse(Request.Form["montantpaie"]);
        string dateversementpaie = Request.Form["dateversementpaie"];
        string descriptionpaie = Request.Form["descriptionpaie"];
        string objetpaie = Request.Form["objetpaie"];

        Intranet.Paie unePaie = new Paie(idpaie, iduserpaie, montantpaie, dateversementpaie, descriptionpaie, objetpaie);

        Intranet.Controleur.UpdatePaie(unePaie);
        Response.Redirect("Default.aspx?page=4");
    }
%>


<%
    String nomEmploye = "";
    String nomEmployeTache = "";
    String nomEmployeAbsence = "";
    String nomEmployePaie = "";

    List<Intranet.Employe> lesEmployes = Intranet.Controleur.SelectAllEmployes();
    List<Intranet.Vtaches> lesVtaches = Intranet.Controleur.SelectAllVtaches();
    List<Intranet.Vabsences> lesVabsences = Intranet.Controleur.SelectAllVabsences();
    List<Intranet.Vpaies> lesVpaies = Intranet.Controleur.SelectAllVpaies();

    if (Request.Form["rechercherEmploye"] != null)
    {
      nomEmploye = Request.Form["nomEmploye"];
        

        if (nomEmploye == "")
        {
            lesEmployes = Intranet.Controleur.SelectAllEmployes();
        }
        else
        {
            lesEmployes = Intranet.Controleur.SelectWhereAllEmploye(nomEmploye);
        }
    }

    if (Request.Form["rechercherVtaches"] != null)
    {
      nomEmployeTache = Request.Form["nomEmployeTache"];

        if (nomEmployeTache == "")
        {
            lesVtaches = Intranet.Controleur.SelectAllVtaches();
        }
        else
        {
            lesVtaches = Intranet.Controleur.SelectWhereAllVtaches(nomEmployeTache);
        }
    }

    if (Request.Form["rechercherVabsences"] != null)
    {
      nomEmployeAbsence = Request.Form["nomEmployeAbsence"];

        if (nomEmployeAbsence == "")
        {
            lesVabsences = Intranet.Controleur.SelectAllVabsences();
        }
        else
        {
            lesVabsences = Intranet.Controleur.SelectWhereAllVabsences(nomEmployeAbsence);
        }
    }

    if (Request.Form["rechercherVpaies"] != null)
    {
      nomEmployePaie = Request.Form["nomEmployePaie"];

        if (nomEmployePaie == "")
        {
            lesVpaies = Intranet.Controleur.SelectAllVpaies();
        }
        else
        {
            lesVpaies = Intranet.Controleur.SelectWhereAllVpaies(nomEmployePaie);
        }
    }

%>

<!-- #include file="vue/vue_les_gestions.aspx"-->
