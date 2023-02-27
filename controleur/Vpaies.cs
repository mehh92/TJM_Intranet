using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Vpaies
    {
        private int id_user, id_paie;
        private float montant;
        private string nom, prenom, role, date_versement, description, objet;

        public Vpaies()
        {
            this.id_user = 0;
            this.nom = "";
            this.prenom = "";
            this.role = "";
            this.id_paie = 0;
            this.montant = 0;
            this.date_versement = "";
            this.description = "";
            this.objet = "";
        }

        public Vpaies(int id_user, string nom, string prenom, string role, int id_paie, float montant, string date_versement, string description, string objet)
        {
            this.id_user = id_user;
            this.nom = nom;
            this.prenom = prenom;
            this.role = role;
            this.id_paie = id_paie;
            this.montant = montant;
            this.date_versement = date_versement;
            this.description = description;
            this.objet = objet;
        }

        public Vpaies(string nom, string prenom, string role, int id_paie, float montant, string date_versement, string description, string objet)
        {
            this.id_user = 0;
            this.nom = nom;
            this.prenom = prenom;
            this.role = role;
            this.id_paie = id_paie;
            this.montant = montant;
            this.date_versement = date_versement;
            this.description = description;
            this.objet = objet;
        }

        public int Id_user
        {
            get => id_user; set => id_user = value;
        }

        public string Nom
        {
            get => nom; set => nom = value;
        }

        public string Prenom
        {
            get => prenom; set => prenom = value;
        }

        public string Role
        {
            get => role; set => role = value;
        }

        public int Id_paie
        {
            get => id_paie; set => id_paie = value;
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