<div class="flex-insert">

    <div class ="hide-gestion">
        <div class="div-hide-employe">

        <h4 class="titre-insert-offre"> <%=(leEmploye != null) ? "Modifier l'employé" : "Enregistrer un employé"%></h4>

        <form method="post" class="form-horizontal border border-insert-offre">

	        <div class="form-group row">

                <div class="margin-bot col-md-6">
                    <label class="margin-label" for="nom">Nom</label>
                    <input type="text" class="form-control champ-insert-offre" name="nomemploye" id="nomemploye"  value="<%=(leEmploye != null) ? leEmploye.Nom : "" %>" placeholder="Le nom">
                </div>

                <div class="margin-bot col-md-6">
                    <label class="margin-label" for="prenom">Prénom</label>
                    <input type="text" class="form-control champ-insert-offre" name="prenomemploye" id="prenomemploye"  value="<%=(leEmploye != null) ? leEmploye.Prenom : "" %>" placeholder="Le prénom">
                </div>

                <div class="margin-bot col-md-6">
                    <label class="margin-label" for="email">Email</label>
                    <input type="email" class="form-control champ-insert-offre" name="emailemploye" id="emailemploye"  value="<%=(leEmploye != null) ? leEmploye.Email : "" %>" placeholder="L'email">
                </div>

                <div class="margin-bot col-md-6">
                    <label class="margin-label" for="tel">Tel</label>
                    <input type="text" class="form-control champ-insert-offre" name="telemploye" id="telemploye"  value="<%=(leEmploye != null) ? leEmploye.Tel : "" %>" placeholder="Le téléphone">
                </div>

                <div class="margin-bot col-md-6">
                    <label class="margin-label" for="adresse">Adresse</label>
                    <input type="text" class="form-control champ-insert-offre" name="adresseemploye" id="adresseemploye"  value="<%=(leEmploye != null) ? leEmploye.Adresse : "" %>" placeholder="L'adresse">
                </div>

                <div class="margin-bot col-md-6">
                    <label class="margin-label" for="mdp">Mdp</label>
                    <input type="password" class="form-control champ-insert-offre" name="mdpemploye" id="mdpemploye"  value="<%=(leEmploye != null) ? leEmploye.Mdp : "" %>" placeholder="Le mot de passe">
                </div>
        

	            <div class="margin-bot col-md-6">
                    <label class="margin-label" for="motif">Choisissez un rôle</label>
                    <select class="form-control" name="roleemploye" id="roleemploye" value="<%=(leEmploye != null) ? leEmploye.Role : "" %>">
                        <option value="vendeur">vendeur</option>
                        <option value="recruteur">recruteur</option>
                        <option value="mecanicien">mecanicien</option>
                        <option value="manager">manager</option>
                    </select>
	            </div>
	        </div>

            <input class="btn-formulaire margin-btn-formulaire btn-formulaire-enregistrer" 
		        id="btn-ajoutLeEmploye" type="submit" <%=(leEmploye != null) ? "name='modifierLeEmploye' value='Modifier'" : "name = 'ajouterLeEmploye' value='Ajouter'"%>>

          </form>
  
        </div>

        <div class="div-hide-paie">

        <h4 class="titre-insert-offre"> <%=(laPaie != null) ? "Modifier la paie" : "Enregistrer une paie"%></h4>

        <form method="post" class="form-horizontal border border-insert-offre">

	        <div class="form-group row">

                <div class="margin-bot col-md-6">
                    <label class="margin-label" for="id">ID</label>
                    <input type="number" class="form-control champ-insert-offre" name="iduserpaie" id="iduserpaie"  value="<%=(laPaie!= null) ? laPaie.Id_user.ToString() : "" %>" placeholder="ID de l'employé">
                </div>

                <div class="margin-bot col-md-6">
                    <label class="margin-label" for="montant">Montant</label>
                    <input type="number" class="form-control champ-insert-offre" name="montantpaie" id="montantpaie" step=".01" value="<%=(laPaie!= null) ? laPaie.Montant.ToString() : "" %>" placeholder="Le montant en €">
                </div>

                <div class="margin-bot col-md-6">
                    <label class="margin-label" for="date versement">Date versement</label>
                    <input type="date" class="form-control champ-insert-offre" name="dateversementpaie" id="dateversementpaie"  value="<%=(laPaie != null) ? laPaie.Date_versement : "" %>">
                </div>

                <div class="margin-bot col-md-6">
                    <label class="margin-label" for="description">Description</label>
                    <input type="text" class="form-control champ-insert-offre" name="descriptionpaie" id="descriptionpaie"  value="<%=(laPaie != null) ? laPaie.Description : "" %>" placeholder="La description de la paie">
                </div>

                <div class="margin-bot col-md-6">
                    <label class="margin-label" for="objet">Objet</label>
                    <input type="text" class="form-control champ-insert-offre" name="objetpaie" id="objetpaie"  value="<%=(laPaie != null) ? laPaie.Objet : "" %>" placeholder="L'objet de la paie">
                </div>

	        </div>

            <input class="btn-formulaire margin-btn-formulaire btn-formulaire-enregistrer" 
		        id="btn-ajoutPaie" type="submit" <%=(laPaie != null) ? "name='modifierLaPaie' value='Modifier'" : "name = 'ajouterLaPaie' value='Ajouter'"%>>

          </form>
  
        </div>
    </div>



<div class="hide-tache">
    <div class="div-hide-tache">

    <h4 class="titre-insert-offre"> <%=(laTache != null) ? "Modifier la tache" : "Enregistrer une tache"%></h4>

    <form method="post" class="form-horizontal border border-insert-offre">

	    <div class="form-group row">

            <div class="margin-bot col-md-6">
                <label class="margin-label" for="id">ID</label>
                <input type="number" class="form-control champ-insert-offre" name="idusertache" id="idusertache"  value="<%=(laTache!= null) ? laTache.Id_user.ToString() : "" %>" placeholder="ID de l'employé">
            </div>

            <div class="margin-bot col-md-6">
                <label class="margin-label" for="date tache">Date Tache</label>
                <input type="date" class="form-control champ-insert-offre" name="datetache" id="datetache"  value="<%=(laTache != null) ? laTache.Date_tache : "" %>">
            </div>

            <div class="margin-bot col-md-6">
                <label class="margin-label" for="heure tache">Heure tache</label>
                <input type="time" class="form-control champ-insert-offre" name="heuretache" id="heuretache"  value="<%=(laTache != null) ? laTache.Heure_tache : "" %>">
            </div>

            <div class="margin-bot col-md-6">
                <label class="margin-label" for="lieu">Lieu</label>
                <input type="text" class="form-control champ-insert-offre" name="lieutache" id="lieutache"  value="<%=(laTache != null) ? laTache.Lieu : "" %>" placeholder="Le lieu de la tache">
            </div>

            <div class="margin-bot col-md-6">
                <label class="margin-label" for="motif">Motif</label>
                <input type="text" class="form-control champ-insert-offre" name="motiftache" id="motiftache"  value="<%=(laTache != null) ? laTache.Motif : "" %>" placeholder="Le motif de la tache">
            </div>

	    </div>

        <input class="btn-formulaire margin-btn-formulaire btn-formulaire-enregistrer" 
		    id="btn-ajoutTache" type="submit" <%=(laTache!= null) ? "name='modifierLaTache' value='Modifier'" : "name = 'ajouterLaTache' value='Ajouter'"%>>

      </form>
  
    </div>
</div>
</div>

