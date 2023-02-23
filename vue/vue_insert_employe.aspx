<form method="post">
    <div class="container row g-2 w-25">

        <label> Nom</label>
        <input type="text" name="nom" value="<%= (leEmploye!= null) ? leEmploye.Nom : "" %>" /><br />
        <label> Prénom</label>
        <input type="text" name="prenom" value="<%= (leEmploye!= null) ? leEmploye.Prenom : "" %>" /><br />
        <label> Email</label>
        <input type="text" name="email"  value="<%= (leEmploye!= null) ? leEmploye.Email : "" %>" /><br />
        <label> Tel</label>
        <input type="text" name="tel"  value="<%= (leEmploye!= null) ? leEmploye.Tel : "" %>" /><br />
        <label> Adresse</label>
        <input type="text" name="adresse" value="<%= (leEmploye!= null) ? leEmploye.Adresse : "" %>" /><br />
        <label> Mdp</label>
        <input type="password" name="mdp" value="<%= (leEmploye!= null) ? leEmploye.Mdp : "" %>" /><br />
        <label> Role</label>
        <input type="text" name="role" value="<%= (leEmploye!= null) ? leEmploye.Role : "" %>" /><br />


    </div> <br />

    <input type="submit" <%= (leEmploye != null) ? "name = 'modifierEmp' value='Modifier'" : "name = 'validerEmp' value='Valider'" %> />
    <input type="reset" value="Annuler" />

</form>