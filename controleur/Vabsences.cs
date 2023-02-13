using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Vabsences
    {
        private int id_user;
        private string nom, prenom, role, date_absence, type_absence;

        public Vabsences()
        {
            this.id_user = 0;
            this.nom = "";
            this.prenom = "";
            this.role = "";
            this.date_absence = "";
            this.type_absence = "";
        }

        public Vabsences(int id_user, string nom, string prenom, string role, string date_absence, string type_absence)
        {
            this.id_user = id_user;
            this.nom = nom;
            this.prenom = prenom;
            this.role = role;
            this.date_absence = date_absence;
            this.type_absence = type_absence;
        }

        public Vabsences(string nom, string prenom, string role, string date_absence, string type_absence)
        {
            this.id_user = 0;
            this.nom = nom;
            this.prenom = prenom;
            this.role = role;
            this.date_absence = date_absence;
            this.type_absence = type_absence;
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