	<div class="div-hide-absence">

	<h4 class="titre-insert-offre"> <%=(lAbsence!= null) ? "Modifier l'absence" : "Enregistrer une absence"%></h4>

	<form method="post" class="form-horizontal border border-insert-offre">

		<div class="form-group row">
		  <div class="col-md-6">
			<label class="margin-label" for="contrat">Date</label>
			<input type="date" class="form-control champ-insert-offre" name="dateabsence" id="dateabsence"  value="<%=(lAbsence != null) ? lAbsence.Date_absence : "" %>" placeholder="Date de l'absence">
		  </div>
		  <div class="col-md-6">
			<label class="margin-label" for="motif">Choisissez un motif</label>
			<select class="form-control" name="motif" id="motif" value="<%=(lAbsence!= null) ? lAbsence.Type_absence : "" %>">
				<option value="conge paye">conge paye</option>
				<option value="maladie">maladie</option>
				<option value="conge sans solde">conge sans solde</option>
				<option value="formation">formation</option>
			</select>
		  </div>
		</div>

		<input class="btn-formulaire margin-btn-formulaire btn-formulaire-enregistrer" 
			id="btn-ajoutAbsence" type="submit" <%=(lAbsence != null) ? "name='modifierAbsence' value='Modifier'" : "name = 'ajouterAbsence' value='Insérer'"%>>

	  </form>
  
	</div>
