<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Diagnostics" %>

<div class="container-paie">
    <h2 class="titre-paie">Mon plannings</h2>
    <div class="btn-planning">
        <input class="input-bouton" id="btn-absence" type="button" name="btnabsences" value="Enregistrer une absences">
    </div>
</div>

<%
    Absence lAbsence = null;
    if (Request["page"] != null && Request["action"] != null && Request["idabsence"] != null)
    {
        string action = Request["action"];
        int idabsence = int.Parse(Request["idabsence"]);
        switch(action)
        {
            case "edit" : lAbsence = Intranet.Controleur.SelectWhereAbsence(idabsence);
            break;
        }
    }
%>


<!-- #include file="vue/vue_insert_absence.aspx"-->

<%
    string messageP = "";

      if (Request.Form["ajouterAbsence"] != null ){

        int id_user = (int) Session["id_user"];
        string dateabsence = Request.Form["dateabsence"];
        string motif = Request.Form["motif"];


        Intranet.Absence uneAbsence = new Absence(id_user, dateabsence, motif);

        Intranet.Controleur.InsertAbsence(uneAbsence);
        Response.Redirect("Default.aspx?page=3");
        messageP = "<br> Insertion réussi";    
    }
%>

<%= messageP %>


<%
    string messageM = "";

      if (Request.Form["modifierAbsence"] != null ){
        
        int idabsence = int.Parse(Request["idabsence"]);
        int id_user = (int) Session["id_user"];
        String dateabsence = Request.Form["dateabsence"];
        String motif = Request.Form["motif"];

        Intranet.Absence uneAbsence = new Absence(idabsence, id_user, dateabsence, motif);

        Intranet.Controleur.UpdateAbsence(uneAbsence);
        Response.Redirect("Default.aspx?page=3");
        messageM = "<br> Modification réussi";    
    }
%>

<%= messageM %>


<%

    int idemployeTA = (int) Session["id_user"];

    String elemTache = "";
    String elemAbsence = "";

    List<Intranet.Tache> lesTaches = Intranet.Controleur.SelectWhereTacheJour(idemployeTA);
    List<Intranet.Absence> lesAbsences = Intranet.Controleur.SelectWhereAllAbsence(idemployeTA);

    if (Request.Form["rechercherTache"] != null)
    {
      elemTache = Request.Form["elemTache"];
        

        if (elemTache == "")
        {
            lesTaches = Intranet.Controleur.SelectWhereTacheJour(idemployeTA);
        }
        else
        {
            lesTaches = Intranet.Controleur.SelectWhereTacheDate(idemployeTA, elemTache);
        }
    }


    if (Request.Form["rechercherAbsence"] != null)
    {
      elemAbsence = Request.Form["elemAbsence"];

        if (elemAbsence != "")
        {
            Debug.WriteLine(idemployeTA);
            Debug.WriteLine(elemAbsence);
             lesAbsences = Intranet.Controleur.SelectWhereAbsenceMois(idemployeTA, elemAbsence);
        }
        else
        {
            lesAbsences = Intranet.Controleur.SelectWhereAllAbsence(idemployeTA);
        }
    }
    

%>

<!-- #include file="vue/vue_les_tache_absences.aspx"-->