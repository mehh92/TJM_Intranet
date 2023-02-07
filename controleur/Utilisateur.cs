using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Utilisateur
    {
        protected int idUser;  // protected car la class personne est la class mere d'un heritage entre personne -> client / technicien
        protected string nom, prenom, email, tel, mdp, role;

        public Utilisateur()
        {
            this.idUser = 0;
            this.nom = this.prenom = "";
            this.email = this.tel = "";
            this.mdp = this.role = "";
        }

        public Utilisateur(int idUser, string nom, string prenom, string email, string tel, string mdp, string role)
        {
            this.idUser = idUser;
            this.nom = nom;
            this.prenom = prenom;
            this.email = email;
            this.tel = tel;
            this.mdp = mdp;
            this.role = role;
        }

        public Utilisateur(string nom, string prenom, string email, string tel, string mdp, string role)
        {
            this.idUser = 0;
            this.nom = nom;
            this.prenom = prenom;
            this.email = email;
            this.tel = tel;
            this.mdp = mdp;
            this.role = role;
        }

        public int IdUser
        {
            get => idUser; set => idUser = value;
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