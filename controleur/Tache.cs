using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Tache
    {
        private int id_tache, id_planning, id_user;
        private string lieu, heure, motif, duree;

        public Tache()
        {
            this.id_tache = 0;
            this.id_planning = 0;
            this.id_user = 0;
            this.lieu = "";
            this.heure = "";
            this.motif = "";
            this.duree = "";
        }

        public Tache(int id_tache, int id_planning, int id_user, string lieu, string heure, string motif, string duree)
        {
            this.id_tache = id_tache;
            this.id_planning = id_planning;
            this.id_user = id_user;
            this.lieu = lieu;
            this.heure = heure;
            this.motif = motif;
            this.duree = duree;
        }

        public Tache( int id_planning, int id_user, string lieu, string heure, string motif, string duree)
        {
            this.id_tache = 0;
            this.id_planning = id_planning;
            this.id_user = id_user;
            this.lieu = lieu;
            this.heure = heure;
            this.motif = motif;
            this.duree = duree;
        }

        public int Id_tache
        {
            get => id_tache; set => id_tache = value;
        }

        public int Id_planning
        {
            get => id_planning; set => id_planning = value;
        }

        public int Id_user
        {
            get => id_user; set => id_user = value;
        }
        public string Lieu
        {
            get => lieu; set => lieu = value;
        }

        public string Heure
        {
            get => heure; set => heure = value;
        }

        public string Motif
        {
            get => motif; set => motif = value;
        }

        public string Duree
        {
            get => duree; set => duree = value;
        }
    }
}