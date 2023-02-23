<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>


<%

    int idemployeP = (int) Session["id_user"];

    string elem = "";
    List<Intranet.Paie> lesPaies2 = null;

    if (Request.Form["rechercherPaie"] != null)
    {
      elem = Request.Form["elem"];
    }

    if (elem == "")
    {
       lesPaies = Intranet.Controleur.SelectWherePaie(idemployeP);
    }
    else
    {
       lesPaies = Intranet.Controleur.SelectWherePaie(idemployeP, elem);
    }

%>

<!-- #include file="vue/vue_les_paies.aspx"-->