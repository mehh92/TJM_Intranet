<form method="post">
    <div class="container row g-2 w-25">

        <label> Id_user</label>
        <input type="text" name="id_user" value="<%= (laPaie!= null) ? laPaie.Id_user.ToString() : "" %>" /><br />
        <label> Date tache</label>
        <input type="text" name="date_tache"  value="<%= (laTache!= null) ? laTache.Date_tache : "" %>" /><br />
        <label> Heure tache</label>
        <input type="text" name="heure_tache" value="<%=(laTache!= null) ? laTache.Heure_tache : "" %>" /><br />
        <label> Lieu</label>
        <input type="text" name="lieu" value="<%=(laTache!= null) ? laTache.Lieu : "" %>" /><br />
        <label> Motif</label>
        <input type="text" name="motif" value="<%= (laTache!= null) ? laTache.Motif : "" %>" /><br />


    </div> <br />

    <input type="submit" <%= (laTache != null) ? "name = 'modifierTache' value='Modifier'" : "name = 'validerTache' value='Valider'" %> />
    <input type="reset" value="Annuler" />

</form>