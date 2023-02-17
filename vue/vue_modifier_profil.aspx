
<h2 class="titre-page">Mes informations personnelles</h2>


<div class="container-employe">
	<form method="post" class="border border-employe">

		<div class="form-group">
			<label class="margin-label-info" for="Nom">Nom</label>
			<input type="text" class="form-control margin-input-info" name="nom" id="nom" value="<%=(lEmploye != null) ? lEmploye.Nom : Session["nom"] %>" disabled>
		</div>
	
		<div class="form-group">
			<label class="margin-label-info" for="Prenom">Prenom</label>
			<input type="text" class="form-control margin-input-info" name="prenom" id="prenom" value="<%=(lEmploye!= null) ? lEmploye.Prenom : Session["prenom"] %>" disabled>
		</div>
	
		<div class="form-group">
			<label class="margin-label-info" for="Email">Email</label>
			<input type="text" class="form-control margin-input-info" name="email" id="email" value="<%=(lEmploye!= null) ? lEmploye.Email : Session["email"] %>" disabled>
		</div>
	
		<div class="form-group">
			<label class="margin-label-info" for="Tel">Tel</label>
			<input type="text" class="form-control margin-input-info" name="tel" id="tel" value="<%=(lEmploye!= null) ? lEmploye.Tel : Session["tel"] %>" disabled>
		</div>

        <div class="form-group">
			<label class="margin-label-info" for="Adresse">Adresse</label>
			<input type="text" class="form-control margin-input-info" name="adresse" id="adresse" value="<%=(lEmploye!= null) ? lEmploye.Adresse : Session["adresse"] %>" disabled>
		</div>

        <div class="form-group">
			<label class="margin-label-info" for="Mot de passe">Mot de passe</label>
			<input type="password" class="form-control margin-input-info" name="mdp" id="mdp" value="<%=(lEmploye!= null) ? lEmploye.Mdp : Session["mdp"] %>" disabled>
		</div>

        <div class="form-group">
			<label class="margin-label-info" for="Role">Role</label>
			<input type="text" class="form-control margin-input-info" name="role" id="role" value="<%=(lEmploye!= null) ? lEmploye.Role : Session["role"] %>" disabled>
		</div>
	
        <div class="bouton-form">  
          <input class="input-bouton" id="btn-modif" type="button" value="Modifier" onclick="removeDisabled(); toggleHideShow()">
          <input class="input-bouton" id="btn-valider" type="submit" name="valider" value="Valider">
        </div>
	</form>
</div>
 