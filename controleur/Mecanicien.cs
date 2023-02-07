using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Mecanicien : Employe
    {
        private string adresse;
        public Mecanicien() : base () 
        {
           
        }

        public Mecanicien(int idUser, string nom, string prenom, string email, string tel, string mdp, string role, string adresse) : base(idUser, nom, prenom, email, tel, mdp, role, adresse)
        {

        }

        public Mecanicien(string nom, string prenom, string email, string tel, string mdp, string role, string adresse) : base(nom, prenom, email, tel, mdp, role, adresse)
        {
            
        }
    }
}