<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Dépannage</title>
</head>
<body>
    <center>
        <h1>Site de dépannage matériel</h1>
        <br>
 
    <a href="Default.aspx?page=0">Accueil</a>
    <a href="Default.aspx?page=1">Gestion des clients</a>
    <a href="Default.aspx?page=2">Gestion des techniciens</a>
    <a href="Default.aspx?page=3">Gestion des interventions</a>

    <%
        int page = 0;
        if (Request["page"] != null)
        {
            page = int.Parse(Request["page"]);
        } else
        {
            page = 0;
        }
        switch(page)
        {
            case 0:  break;
            case 1: %> <!-- #include file="clients.aspx --> <% break;
            case 2: %> <!-- #include file="techniciens.aspx --> <% break;
            case 3: %> <!-- #include file="interventions.aspx --> <% break;
         }

        %>

    </center>
</body>
</html>