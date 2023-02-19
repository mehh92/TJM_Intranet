<div class="div-hide">

<h4 class="titre-insert-offre">Enregistrer une tâche </h4>

<form method="post" class="form-horizontal border border-insert-offre">

	<div class="form-group row">
	  <div class="col-md-6">
		<label class="margin-label" for="contrat">Date</label>
		<input type="date" class="form-control champ-insert-offre" name="datetache" id="datetache" placeholder="Date de la tâche">
	  </div>
	  <div class="col-md-6">
		<label class="margin-label" for="heure">heure</label>
		<input type="time" class="form-control champ-insert-offre" name="heure" id="heure" placeholder="Heure de la tâche">
	  </div>
	</div>

	<div class="form-group row">
		<div class="col-md-6">
		  <label class="margin-label" for="lieu">Lieu</label>
		  <input type="text" class="form-control champ-insert-offre" name="lieu" id="lieu" placeholder="Lieu">
		</div>
		<div class="col-md-6">
		  <label class="margin-label" for="motif">Motif</label>
		  <input type="text" class="form-control champ-insert-offre" name="motif" id="motif" placeholder="motif">
		</div>
	</div>

	<input type="submit" name="ajouterTache" class="btn-formulaire margin-btn-formulaire" value="Enregistrer">

  </form>
  
</div>



<div class="div-hide">

<h4 class="titre-insert-offre">Enregistrer une absence </h4>

<form method="post" class="form-horizontal border border-insert-offre">

	<div class="form-group row">
	  <div class="col-md-6">
		<label class="margin-label" for="contrat">Date</label>
		<input type="date" class="form-control champ-insert-offre" name="dateabsence" id="dateabsence" placeholder="Date de l'absence">
	  </div>
	  <div class="col-md-6">
        <label class="margin-label" for="motif">Choisissez un motif</label>
        <select class="form-control" name="motif" id="motif">
            <option value="conge paye">conge paye</option>
            <option value="maladie">maladie</option>
            <option value="conge sans solde">conge sans solde</option>
            <option value="formation">formation</option>
        </select>
	  </div>
	</div>

	<input type="submit" name="ajouterAbsence" class="btn-formulaire margin-btn-formulaire" value="Enregistrer">

  </form>
  
</div>