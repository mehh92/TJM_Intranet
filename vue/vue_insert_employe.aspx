<form method="post">


        <label> Nom</label>
        <input type="text" name="nom" value="<%= (lEmploye!= null) ? lEmploye.Nom : "" %>" /><br />
        <label> Prénom</label>
        <input type="text" name="prenom" value="<%=(lEmploye!= null) ? lEmploye.Prenom : "" %>" /><br />
        <label> Email</label>
        <input type="text" name="email"  value="<%= (lEmploye!= null) ? lEmploye.Email : "" %>" /><br />
        <label> Tel</label>
        <input type="tel" name="tel" value="<%=(lEmploye!= null) ? lEmploye.Tel : "" %>" /><br />
        <label> Adresse</label>
        <input type="text" name="adresse"  value="<%= (lEmploye!= null) ? lEmploye.Adresse : "" %>" /><br />
        <label> Mdp</label>
        <input type="password" name="mdp"  value="<%= (lEmploye!= null) ? lEmploye.Mdp : "" %>" /><br />
        <label> Role</label>
        <input type="text" name="role"  value="<%= (lEmploye!= null) ? lEmploye.Role : "" %>" /><br />
       


    <input type="submit" <%= (lEmploye!= null) ? "name = 'modifier' value='Modifier'" : "name = 'valider' value='Valider'" %> />
    <input type="reset" value="Annuler" />

</form>