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