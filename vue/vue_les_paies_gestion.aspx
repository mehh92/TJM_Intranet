<h2> Liste des paies </h2>

<table border="1">
    <tr>
        <td>Id Paie</td>
        <td>Id User</td>
        <td>Montant</td>
        <td>Date de versement</td>
        <td>Description</td>
        <td>Objet</td>
        <td>Opérations</td>
    </tr>
    
    <%
        String chainePaie = "";

        foreach(Paie unePaie in lesPaies)
    {
        chainePaie += "<tr>";

        chainePaie += "<td>" + unePaie.Id_paie + "</td>";
        chainePaie += "<td>" + unePaie.Id_user + "</td>";
        chainePaie += "<td>" + unePaie.Montant + "</td>";
        chainePaie += "<td>" + unePaie.Date_versement + "</td>";
        chainePaie += "<td>" + unePaie.Description + "</td>";
        chainePaie += "<td>" + unePaie.Objet + "</td>";
        chainePaie += "<td>";
        chainePaie += "<a href='Default.aspx?page=4&action=sup&id_paie=" + unePaie.Id_paie + "'>Supprimer</a>";
        chainePaie += "<a href='Default.aspx?page=4&action=edit&id_paie=" + unePaie.Id_paie + "'>Modifier</a>";

        chainePaie += "</td>";

        chainePaie += "</tr>";
    }

    %>

    <%= chainePaie %>
</table>