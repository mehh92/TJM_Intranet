using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Absence
    {
        private int id_absence, id_planning, id_user;
        private string type_absence, duree;

        public Absence()
        {
            this.id_absence = 0;
            this.id_planning = 0;
            this.id_user = 0;
            this.type_absence = "";
            this.duree = "";
        }

        public Absence(int id_absence, int id_planning, int id_user, string type_absence, string duree)
        {
            this.id_absence = id_absence;
            this.id_planning = id_planning;
            this.id_user = id_user;
            this.type_absence = type_absence;
            this.duree = duree;
        }

        public Absence(int id_planning, int id_user, string type_absence, string duree)
        {
            this.id_absence = 0;
            this.id_planning = id_planning;
            this.id_user = id_user;
            this.type_absence = type_absence;
            this.duree = duree;
        }

        public int Id_absence
        {
            get => id_absence; set => id_absence = value;
        }

        public int Id_planning
        {
            get => id_planning; set => id_planning = value;
        }

        public int Id_user
        {
            get => id_user; set => id_user = value;
        }

        public string Type_absence
        {
            get => type_absence; set => type_absence = value;
        }

        public string Duree
        {
            get => duree; set => duree = value;
        }
    }
}