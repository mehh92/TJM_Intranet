using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Paie
    {
        private int id_paie, id_user;
        private float montant;
        private string date_versement, description, objet;

        public Paie()
        {
            this.id_paie = 0;
            this.id_user = 0;
            this.montant = 0;
            this.date_versement = "";
            this.description = "";
            this.objet = "";
        }

        public Paie(int id_paie, int id_user, float montant, string date_versement, string description, string objet)
        {
            this.id_paie = id_paie;
            this.id_user = id_user;
            this.montant = montant;
            this.date_versement = date_versement;
            this.description = description;
            this.objet = objet;
        }

        public Paie(int id_user, float montant, string date_versement, string description, string objet)
        {
            this.id_paie = 0;
            this.id_user = id_user;
            this.montant = montant;
            this.date_versement = date_versement;
            this.description = description;
            this.objet = objet;
        }

        public int Id_paie
        {
            get => id_paie; set => id_paie = value;
        }

        public int Id_user
        {
            get => id_user; set => id_user = value;
        }
        public float Montant
        { 
            get => montant; set => montant = value;
        }

        public string Date_versement
        {
            get => date_versement; set => date_versement = value;
        }

        public string Description
        { 
            get => description; set => description = value;
        }

        public string Objet
        {
            get => objet; set => objet = value;
        }
    }
}