<h2> Liste des taches </h2>

<div>
 <form method="post" class="search border border-paie">
	        <div class="form-group rechercher-flex">
		        <input type="text" class="form-control input-paie" id="rechercherTacheGestion" name="nomTacheGestion" placeholder="Rechercher par nom">
                <button class="input-rechercher-paie" id="btn-rechercherAbsence" type="submit" name="rechercherTacheGestion" value="Rechercher">
                    <img class="img-rechercher" src="images/rechercher.png"/>
                </button>
	        </div>
        </form>
</div>

<table border="1">
    <tr>
        <td>Id Paie</td>
        <td>Id User</td>
        <td>Date de la tache</td>
        <td>Heure de la tache</td>
        <td>Lieu</td>
        <td>Motif</td>
        <td>Opérations</td>
    </tr>
    
    <%
        String chaineTache = "";

        foreach(Vtaches uneVtache in lesVtaches)
    {
        chaineTache += "<tr>";

        chaineTache += "<td>" + uneVtache.Id_tache + "</td>";
        chaineTache += "<td>" + uneVtache.Id_user + "</td>";
        chaineTache += "<td>" + uneVtache.Date_tache + "</td>";
        chaineTache += "<td>" + uneVtache.Heure_tache + "</td>";
        chaineTache += "<td>" + uneVtache.Lieu + "</td>";
        chaineTache += "<td>" + uneVtache.Motif + "</td>";
        chaineTache += "<td>";
        chaineTache += "<a href='Default.aspx?page=4&action=sup&id_tache=" + uneVtache.Id_tache + "'>Supprimer</a>";
        chaineTache += "<a href='Default.aspx?page=4&action=edit&id_tache=" + uneVtache.Id_tache + "'>Modifier</a>";

        chaineTache += "</td>";

        chaineTache += "</tr>";
    }

    %>

    <%= chaineTache %>
</table>

v