<div class="flex-container">
        <div class="item-tache">
            <h4 class="titre-insert-offre">Mes taches du jour</h4>
            <form method="post" class="search border border-paie">
	            <div class="form-group rechercher-flex">
		            <input type="text" class="form-control input-paie" id="rechercherTache" name="elemTache" placeholder="Rechercher par date">
                    <button class="input-rechercher-paie" id="btn-rechercherTache" type="submit" name="rechercherTache" value="Rechercher">
                        <img class="img-rechercher" src="images/rechercher.png"/>
                    </button>
	            </div>
            </form>
            <div class="card-tache">
            <%
                foreach(Tache uneTache in lesTaches)
                { %>
                <div class="card-uneTache border">
                    <h5 class="color-paie"><span class="heure-tache"><%=uneTache.Heure_tache%></span> &nbsp|&nbsp Lieux : <em><%=uneTache.Lieu%></h5></em>              
                    <p class="card-text">Le motif : <%=uneTache.Motif%></p>
		        </div>
                <%  } %>
            </div>
         </div>

         <div class="item-absence">
            <h4 class="titre-insert-offre"> Mes absences</h4>
            <form method="post" class="search border border-paie">
	            <div class="form-group rechercher-flex">
		            <input type="text" class="form-control input-paie" id="rechercherAbsence" name="elemAbsence" placeholder="Rechercher par mois">
                    <button class="input-rechercher-paie" id="btn-rechercherAbsence" type="submit" name="rechercherAbsence" value="Rechercher">
                        <img class="img-rechercher" src="images/rechercher.png"/>
                    </button>
	            </div>
            </form>

            <div class="card-Absence">
            <%
                foreach(Absence uneAbsence in lesAbsences)
                { %>
                <div class="card-uneAbsence border">
                    <h5 class="color-paie">N° d'absence : <%=uneAbsence.Id_absence%> &nbsp|&nbsp Date de l'absence : <em><%=uneAbsence.Date_absence%></h5></em>              
                    <p class="card-text">Le motif de l'absence : <strong><%=uneAbsence.Type_absence%></strong> </p>
                    <a class="a-modifier" href="Default.aspx?page=3&action=edit&idabsence=<%=uneAbsence.Id_absence%>"> Modifier</a>
		        </div>
            <%  } %>
            </div>
        </div>
    </div>

    
</div>