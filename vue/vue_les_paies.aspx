<div class="container-paie">
    <h2 class="titre-paie">Mes fiches de paies</h2>
	<form method="post" class="border border-paie">
		<div class="form-group rechercher-flex">
			<input type="text" class="form-control input-paie" id="rechercher" name="elem" placeholder="Rechercher par année">
            <button class="input-rechercher-paie" id="btn-rechercher" type="submit" name="rechercherPaie" value="Rechercher">
                <img class="img-rechercher" src="images/rechercher.png"/>
            </button>
		</div>
    </form>
</div>


<div class="card-paie">
<%
    foreach(Paie unePaie in lesPaies)
    { %>
	    
		<div class="card-bod border">
            <div class="card-titre-paie">
                <strong><h5 class="color-paie">Paie de <%=unePaie.Objet%></h5></strong> 
            </div>
            <p class="card-text">Description : <%=unePaie.Description%></p>
            <p> Versé le : <%=unePaie.Date_versement%></p>
                
			<div class="card-titre-montant">
                <em><p class="card-subtitle mb-3 mt-2 text-muted">Montant: <%=unePaie.Montant%>&nbsp€</p></em> <img onclick="generatePDF()" class="fleche-card" src="images/dl.png">
			</div>
		</div>
	    
<%  } %>
</div>
