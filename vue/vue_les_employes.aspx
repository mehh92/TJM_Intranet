<h2> Liste des employes </h2>

<table border="1">
    <tr>
        <td>Id User</td>
        <td>Nom</td>
        <td>Prenom</td>
        <td>Email</td>
        <td>Adresse</td>
        <td>Tel</td>
        <td>Mdp</td>
        <td>Role</td>
        <td>Opérations</td>
    </tr>
    
    <%
        String chaine = "";

        foreach(Employe unEmploye in lesEmployes)
    {
        chaine += "<tr>";

        chaine += "<td>" + unEmploye.Id_user + "</td>";
        chaine += "<td>" + unEmploye.Nom + "</td>";
        chaine += "<td>" + unEmploye.Prenom + "</td>";
        chaine += "<td>" + unEmploye.Email + "</td>";
        chaine += "<td>" + unEmploye.Adresse + "</td>";
        chaine += "<td>" + unEmploye.Tel + "</td>";
        chaine += "<td>" + unEmploye.Mdp + "</td>";
        chaine += "<td>" + unEmploye.Role + "</td>";

        chaine += "<td>";
        chaine += "<a href='Default.aspx?page=2&action=sup&idemploye=" + unEmploye.Id_user + "'>Supprimer</a>";
        chaine += "<a href='Default.aspx?page=2&action=edit&idemploye=" + unEmploye.Id_user + "'>Modifier</a>";

        chaine += "</td>";

        chaine += "</tr>";
    }

    %>

    <%= chaine %>
</table>