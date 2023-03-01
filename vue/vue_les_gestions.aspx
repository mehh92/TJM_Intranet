
<div class="flex-gestion">
        <div class="item-lesemployes">
            <h4 class="titre-insert-offre">Les employés</h4>
            <form method="post" class="search border border-paie">
	            <div class="form-group rechercher-flex">
		            <input type="text" class="form-control input-paie" id="nomEmploye" name="nomEmploye" placeholder="Rechercher par nom">
                    <button class="input-rechercher-paie" id="btn-rechercherEmploye" type="submit" name="rechercherEmploye" value="Rechercher">
                        <img class="img-rechercher" src="images/rechercher.png"/>
                    </button>
	            </div>
            </form>
            <div class="scrolltab table-responsive">
                <table class="table table-sm">
                  <thead>
                    <tr>
                      <th scope="col">ID employé</th>
                      <th scope="col">Nom</th>
                      <th scope="col">Prénom</th>
                      <th scope="col">Email</th>
                      <th scope="col">Tel</th>
                      <th scope="col">adresse</th>
                      <th scope="col">Role</th>
                      <th scope="col">Opération</th>  
                    </tr>
                  </thead>
                  <tbody>
                    <%
                        foreach(Employe unEmploye in lesEmployes)
                    {
                    %>
                    <tr>
                      <td><%=unEmploye.Id_user%></td>
                      <td><%=unEmploye.Nom%></td>
                      <td><%=unEmploye.Prenom%></td>
                      <td><%=unEmploye.Email%></td>
                      <td><%=unEmploye.Tel%></td>
                      <td><%=unEmploye.Adresse%></td>
                      <td><%=unEmploye.Role%></td>
                      <td>
                          <a class="a-editemploye" href="Default.aspx?page=4&action=edit&idemployeg=<%=unEmploye.Id_user%>"> <img class="img-lien" src="images/modifier.png" width="25px" height="25px"></a>
                          <a class="a-supemploye" href="Default.aspx?page=4&action=sup&idemployeg=<%=unEmploye.Id_user%>"> <img class="img-lien" src="images/supprimer.png" width="25px" height="25px"></a>
                      </td>
                    </tr>
                  <% } %>
                  </tbody>
                </table>
            </div>    
        </div>

        <div class="item-lespaies">
            <h4 class="titre-insert-offre">Les paies des employés</h4>
            <form method="post" class="search border border-paie">
	            <div class="form-group rechercher-flex">
		            <input type="text" class="form-control input-paie" id="nomEmployePaie" name="nomEmployePaie" placeholder="Rechercher par nom">
                    <button class="input-rechercher-paie" id="btn-rechercherVpaies" type="submit" name="rechercherVpaies" value="Rechercher">
                        <img class="img-rechercher" src="images/rechercher.png"/>
                    </button>
	            </div>
            </form>
            <div class="scrolltab table-responsive">
                <table class="table table-sm">
                  <thead>
                    <tr>
                      <th scope="col">ID employé</th>
                      <th scope="col">Nom</th>
                      <th scope="col">Prénom</th>
                      <th scope="col">Role</th>
                      <th scope="col">Montant</th>
                      <th scope="col">Date versement</th>
                      <th scope="col">Description</th>
                      <th scope="col">Objet</th>
                      <th scope="col">Opération</th>  
                    </tr>
                  </thead>
                  <tbody>
                    <%
                    foreach(Vpaies unePaie in lesVpaies)
                    {
                    %>
                    <tr>
                      <td><%=unePaie.Id_user%></td>
                      <td><%=unePaie.Nom%></td>
                      <td><%=unePaie.Prenom%></td>
                      <td><%=unePaie.Role%></td>
                      <td><%=unePaie.Montant%> €</td>
                      <td><%=unePaie.Date_versement%></td>
                      <td><%=unePaie.Description%></td>
                      <td><%=unePaie.Objet%></td>
                      <td>
                          <a class="a-editpaie" href="Default.aspx?page=4&action=edit&idpaie=<%=unePaie.Id_paie%>"><img class="img-lien" src="images/modifier.png" width="25px" height="25px"></a>
                          <a class="a-suppaie" href="Default.aspx?page=4&action=sup&idpaie=<%=unePaie.Id_paie%>"><img class="img-lien" src="images/supprimer.png" width="25px" height="25px"></a>
                      </td>
                    </tr>
                  <% } %>
                  </tbody>
                </table>
            </div>    
        </div>
</div>

<div class="flex-gestion">
        <div class="item-lestaches">
            <h4 class="titre-insert-offre">Les taches des employés</h4>
            <form method="post" class="search border border-paie">
	            <div class="form-group rechercher-flex">
		            <input type="text" class="form-control input-paie" id="nomEmployeTache" name="nomEmployeTache" placeholder="Rechercher par nom">
                    <button class="input-rechercher-paie" id="btn-rechercherVtaches" type="submit" name="rechercherVtaches" value="Rechercher">
                        <img class="img-rechercher" src="images/rechercher.png"/>
                    </button>
	            </div>
            </form>
            <div class="scrolltab table-responsive">
                <table class="table table-sm">
                  <thead>
                    <tr>
                      <th scope="col">ID employé</th>
                      <th scope="col">Nom</th>
                      <th scope="col">Prénom</th>
                      <th scope="col">Role</th>
                      <th scope="col">Date</th>
                      <th scope="col">Heure</th>
                      <th scope="col">Lieu</th>
                      <th scope="col">Motif</th>
                      <th scope="col">Opération</th>  
                    </tr>
                  </thead>
                  <tbody>
                    <%
                    foreach(Vtaches uneTache in lesVtaches)
                    {
                    %>
                    <tr>
                      <td><%=uneTache.Id_user%></td>
                      <td><%=uneTache.Nom%></td>
                      <td><%=uneTache.Prenom%></td>
                      <td><%=uneTache.Role%></td>
                      <td><%=uneTache.Date_tache%></td>
                      <td><%=uneTache.Heure_tache%></td>
                      <td><%=uneTache.Lieu%></td>
                      <td><%=uneTache.Motif%></td>
                      <td>
                          <a class="a-edittache" href="Default.aspx?page=4&action=edit&idtache=<%=uneTache.Id_tache%>"><img class="img-lien" src="images/modifier.png" width="25px" height="25px"></a>
                          <a class="a-suptache" href="Default.aspx?page=4&action=sup&idtache=<%=uneTache.Id_tache%>"><img class="img-lien" src="images/supprimer.png" width="25px" height="25px"></a>
                      </td>
                    </tr>
                  <% } %>
                  </tbody>
                </table>
            </div>    
        </div>

        <div class="item-lesabsences">
            <h4 class="titre-insert-offre">Les absences des employés</h4>
            <form method="post" class="search border border-paie">
	            <div class="form-group rechercher-flex">
		            <input type="text" class="form-control input-paie" id="nomEmployeAbsence" name="nomEmployeAbsence" placeholder="Rechercher par nom">
                    <button class="input-rechercher-paie" id="btn-rechercherVabsences" type="submit" name="rechercherVabsences" value="Rechercher">
                        <img class="img-rechercher" src="images/rechercher.png"/>
                    </button>
	            </div>
            </form>
            <div class="scrolltab table-responsive">
                <table class="table table-sm">
                  <thead>
                    <tr>
                      <th scope="col">ID employé</th>
                      <th scope="col">Nom</th>
                      <th scope="col">Prénom</th>
                      <th scope="col">Role</th>
                      <th scope="col">Date</th>
                      <th scope="col">Type</th>
                      <th scope="col">Opération</th>  
                    </tr>
                  </thead>
                  <tbody>
                    <%
                    foreach(Vabsences uneAbsence in lesVabsences)
                    {
                    %>
                    <tr>
                      <td><%=uneAbsence.Id_user%></td>
                      <td><%=uneAbsence.Nom%></td>
                      <td><%=uneAbsence.Prenom%></td>
                      <td><%=uneAbsence.Role%></td>
                      <td><%=uneAbsence.Date_absence%></td>
                      <td><%=uneAbsence.Type_absence%></td>
                      <td>
                          <a class="a-supabsence" href="Default.aspx?page=4&action=sup&idabsenceg=<%=uneAbsence.Id_absence%>"><img class="img-lien" src="images/supprimer.png" width="25px" height="25px"></a>
                      </td>
                    </tr>
                  <% } %>
                  </tbody>
                </table>
            </div>    
        </div>
</div>