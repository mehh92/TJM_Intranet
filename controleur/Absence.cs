using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Absence
    {
        private int id_absence, id_user;
        private string date_absence, type_absence;

        public Absence()
        {
            this.id_absence = 0;
            this.id_user = 0;
            this.date_absence = "";
            this.type_absence = "";
        }

        public Absence(int id_absence, int id_user, string date_absence, string type_absence)
        {
            this.id_absence = id_absence;
            this.id_user = id_user;
            this.date_absence = date_absence;
            this.type_absence = type_absence;
        }

        public Absence(int id_user, string date_absence, string type_absence)
        {
            this.id_absence = 0;
            this.id_user = id_user;
            this.date_absence = date_absence;
            this.type_absence = type_absence;
        }

        public int Id_absence
        {
            get => id_absence; set => id_absence = value;
        }

        public int Id_user
        {
            get => id_user; set => id_user = value;
        }

        public string Date_absence
        {
            get => date_absence; set => date_absence = value;
        }

        public string Type_absence
        {
            get => type_absence; set => type_absence = value;
        }
    }
}