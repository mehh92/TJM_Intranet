<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>

<div class="container-paie">
    <h2 class="titre-paie">Mon plannings</h2>
    <div class="btn-planning">
        <input class="input-bouton" id="btn-tache" type="button" name="btntaches" value="Mes tâches" onclick="removeDisabled(); toggleHideShow()">
        <input class="input-bouton" id="btn-absence" type="button" name="btnabsences" value="Mes absences">
    </div>
</div>

<!-- #include file="vue/vue_insert_tache_absence.aspx"-->