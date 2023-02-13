using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Tache
    {
        private int id_tache, id_user;
        private string date_heure_tache, lieu, motif;
        public Tache()
        {
            this.id_tache = 0;
            this.id_user = 0;
            this.date_heure_tache = "";
            this.lieu = "";
            this.motif = "";
        }

        public Tache(int id_tache, int id_user, string date_heure_tache, string lieu, string motif)
        {
            this.id_tache = id_tache;
            this.id_user = id_user;
            this.date_heure_tache = date_heure_tache;
            this.lieu = lieu;
            this.motif = motif;
        }

        public Tache(int id_user, string date_heure_tache, string lieu, string motif)
        {
            this.id_tache = 0;
            this.id_user = id_user;
            this.date_heure_tache = date_heure_tache;
            this.lieu = lieu;
            this.motif = motif;
        }

        public int Id_tache
        {
            get => id_tache; set => id_tache = value;
        }

        public int Id_user
        {
            get => id_user; set => id_user = value;
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