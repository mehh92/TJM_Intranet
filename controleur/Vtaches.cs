using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Vtaches
    {
        private int id_user;
        private string nom, prenom, role, date_heure_tache, lieu, motif;
        public Vtaches()
        {
            this.id_user = 0;
            this.nom = "";
            this.prenom = "";
            this.role = "";
            this.date_heure_tache = "";
            this.lieu = "";
            this.motif = "";
        }

        public Vtaches(int id_user, string nom, string prenom, string role, string date_heure_tache, string lieu, string motif)
        {
            this.id_user = id_user;
            this.nom = nom;
            this.prenom = prenom;
            this.role = role;
            this.date_heure_tache = date_heure_tache;
            this.lieu = lieu;
            this.motif = motif;
        }

        public Vtaches(string nom, string prenom, string role, string date_heure_tache, string lieu, string motif)
        {
            this.id_user = 0;
            this.nom = nom;
            this.prenom = prenom;
            this.role = role;
            this.date_heure_tache = date_heure_tache;
            this.lieu = lieu;
            this.motif = motif;
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

        public string Date_heure_tache
        {
            get => date_heure_tache; set => date_heure_tache = value;
        }

        public string Lieu
        {
            get => lieu; set => lieu = value;
        }

        public string Motif
        {
            get => motif; set => motif = value;
        }
    }
}