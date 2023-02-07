using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Employe : Utilisateur
    {
        private string adresse;
        public Employe() : base()
        {
            this.adresse = "";
        }

        public Employe(int idUser, string nom, string prenom, string email, string tel, string mdp, string role, string adresse) : base(idUser, nom, prenom, email, tel, mdp, role)
        {
            this.adresse = adresse;
        }

        public Employe(string nom, string prenom, string email, string tel, string mdp, string role, string adresse) : base(nom, prenom, email, tel, mdp, role)
        {
            this.adresse = adresse;
        }
        public string Adresse
        {
            get => this.adresse; set => this.adresse = value;
        }
    }
}