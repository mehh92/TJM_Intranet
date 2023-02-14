using MySql.Data.MySqlClient.Memcached;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Controleur
    {
        private static Modele unModele = new Modele("localhost", "tjm", "root", "");

        public static void InsertEmploye(Employe unEmploye)
        {
            unModele.InsertEmploye(unEmploye);
        }

        public static void DeleteEmploye(int idEmploye)
        {
            unModele.DeleteEmploye(idEmploye);
        }

       public static void UpdateEmploye(Employe unEmploye)
        {
            unModele.UpdateEmploye(unEmploye);
        }
        
        public static List<Employe> SelectAllEmployes()
        {
            return unModele.SelectAllEmployes();
        }

        public static Employe SelectWhereEmploye(string email, string mdp)
        {
            return unModele.SelectWhereEmploye(email, mdp);
        }

        public static Employe SelectWhereEmploye(int idEmploye)
        {
            return unModele.SelectWhereEmploye(idEmploye);
        }
    }
}