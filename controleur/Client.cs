﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Depannage
{
    public class Client : Personne
    {
        private string adresse;
        public Client() : base () 
        {
            this.adresse = "";
        }

        public Client(int idPers, string nom, string prenom, string email, string mdp, string adresse) : base(idPers, nom, prenom, email, mdp)
        {
            this.adresse = adresse;
        }

        public Client(string nom, string prenom, string email, string mdp, string adresse) : base(nom, prenom, email, mdp)
        {
            this.adresse = adresse;
        }
        public string Adresse
        {
            get => this.adresse; set => this.adresse = value;
        }
    }
}