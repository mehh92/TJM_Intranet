<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Diagnostics" %>

<div class="container-paie">
    <h2 class="titre-paie">Gestion des employés</h2>
    <div class="btn-planning">
        <input class="input-bouton" id="btn-employe" type="button" name="btnemploye" value="Enregistrer un employé">
        <input class="input-bouton" id="btn-tache" type="button" name="btntache" value="Enregistrer une tache">
        <input class="input-bouton" id="btn-paie" type="button" name="btnpaie" value="Enregistrer une paie">
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
            case "edit" : laTache = Intranet.Controleur.SelectWhereTache2(idtache);
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
            Case "edit" : laPaie = Intranet.Controleur.SelectWherePaieGestion(idpaie);
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