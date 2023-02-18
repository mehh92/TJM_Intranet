<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>

<%

    int idemployeP = (int) Session["id_user"];

    List<Intranet.Paie> lesPaies = Intranet.Controleur.SelectWherePaie(idemployeP);
%>

<!-- #include file="vue/vue_les_paies.aspx"-->