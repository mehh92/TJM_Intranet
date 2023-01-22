using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Depannage
{
    public class Controleur
    {
        private static Modele unModele = new Modele("localhost", "depannage_sd_23", "root", "");

        public static void InsertClient(Client unClient)
        {
            unModele.InsertClient(unClient);
        }
    }
}