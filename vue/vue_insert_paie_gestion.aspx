<form method="post">
    <div class="container row g-2 w-25">

        <label> Id_user</label>
        <input type="text" name="id_user" value="<%= (laPaie!= null) ? laPaie.Id_user.ToString() : "" %>" /><br />
        <label> Montant</label>
        <input type="text" name="montant" value="<%= (laPaie!= null) ? laPaie.Montant.ToString() : "" %>" /><br />
        <label> Date versement</label>
        <input type="text" name="date_versement" value="<%= (laPaie!= null) ? laPaie.Date_versement : "" %>" /><br />
        <label> Description</label>
        <input type="text" name="description"  value="<%= (laPaie!= null) ? laPaie.Description : "" %>" /><br />
        <label> Objet</label>
        <input type="text" name="objet"  value="<%= (laPaie!= null) ? laPaie.Objet : "" %>" /><br />


    </div> <br />

    <input type="submit" <%= (laPaie != null) ? "name = 'modifierPaie' value='Modifier'" : "name = 'validerPaie' value='Valider'" %> />
    <input type="reset" value="Annuler" />

</form>