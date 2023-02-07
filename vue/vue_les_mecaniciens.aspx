<h2> Liste des clients </h2>

<table border="1">
    <tr>
        <td>Id Mécanicien</td>
        <td>Nom</td>
        <td>Prenom</td>
        <td>Adresse</td>
        <td>Email</td>
        <td>Tel</td>
    </tr>
    <%
        string chaine = "";
    foreach(Mecanicien unMecanicien In lesMecaniciens)
    {
        chaine += "<tr>";

        chaine += "<td>" + unMecanicien.IdMecanicien + "</td>";
        chaine += "<td>" + unMecanicien.Nom + "</td>";
        chaine += "<td>" + unMecanicien.Prenom + "</td>";
        chaine += "<td>" + unMecanicien.Adresse + "</td>";
        chaine += "<td>" + unMecanicien.Email + "</td>";
        chaine += "<td>" + unMecanicien.Tel + "</td>"; 
    
        chaine += "</tr>"
    }
    
    %>

    <%= chaine %>
</table>