using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Vtaches
    {
        private int id_user, id_tache;
        private string nom, prenom, role, date_tache, heure_tache, lieu, motif;
        public Vtaches()
        {
            this.id_user = 0;
            this.nom = "";
            this.prenom = "";
            this.role = "";
            this.id_tache = 0;
            this.date_tache = "";
            this.heure_tache = "";
            this.lieu = "";
            this.motif = "";
        }

        public Vtaches(int id_user, string nom, string prenom, string role, int id_tache, string date_tache, string heure_tache, string lieu, string motif)
        {
            this.id_user = id_user;
            this.nom = nom;
            this.prenom = prenom;
            this.role = role;
            this.id_tache = id_tache;
            this.date_tache = date_tache;
            this.heure_tache = heure_tache;
            this.lieu = lieu;
            this.motif = motif;
        }

        public Vtaches(string nom, string prenom, string role, int id_tache, string date_tache, string heure_tache, string lieu, string motif)
        {
            this.id_user = 0;
            this.nom = nom;
            this.prenom = prenom;
            this.role = role;
            this.id_tache = id_tache;
            this.date_tache = date_tache;
            this.heure_tache= heure_tache;
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

        public int Id_tache
        {
            get => id_tache; set => id_tache = value;
        }

        public string Date_tache
        {
            get => date_tache; set => date_tache = value;
        }

        public string Heure_tache
        {
            get => heure_tache; set => heure_tache = value;
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