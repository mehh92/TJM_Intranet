using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Employe
    {
        private int id_user;
        private string nom, prenom, email, tel, adresse, mdp, role;

        public Employe()
        {
            this.id_user = 0;
            this.nom = "";
            this.prenom = "";
            this.email = "";
            this.tel = "";
            this.adresse = "";
            this.mdp = "";
            this.role = "";
        }

        public Employe(int id_user, string nom, string prenom, string email, string tel, string adresse, string mdp, string role)
        {
            this.id_user = id_user;
            this.nom = nom;
            this.prenom = prenom;
            this.email = email;
            this.tel = tel;
            this.adresse = adresse;
            this.mdp = mdp;
            this.role = role;
        }

        public Employe(string nom, string prenom, string email, string tel, string adresse, string mdp, string role)
        {
            this.id_user = 0;
            this.nom = nom;
            this.prenom = prenom;
            this.email = email;
            this.tel = tel;
            this.adresse = adresse;
            this.mdp = mdp;
            this.role = role;
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

        public string Email
        {
            get => email; set => email = value;
        }

        public string Tel
        {
            get => tel; set => tel = value;
        }

        public string Adresse
        {
            get => this.adresse; set => this.adresse = value;
        }

        public string Mdp
        {
            get => mdp; set => mdp = value;
        }

        public string Role
        {
            get => role; set => role = value;
        }
    }
}