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

        public static void InsertMecanicien(Mecanicien unMecanicien)
        {
            unModele.InsertMecanicien(unMecanicien);
        }

        public static void DeleteMecanicien(int idMecanicien)
        {
            unModele.DeleteMecanicien(idMecanicien);
        }

        public static void UpdateMecanicien(Mecanicien unMecanicien)
        {
            unModele.UpdateMecanicien(unMecanicien);
        }

        public static Mecanicien SelectWhereMecanicien(int idMecanicien)
        {
             return unModele.SelectWhereMecanicien(idMecanicien);
        }

        public static List<Mecanicien> SelectAllMecaniciens()
        {
            return unModele.SelectAllMecaniciens();
        }

        public static Manager SelectWhereManager(string email, string mdp)
        {
            return unModele.SelectWhereManager(email, mdp);
        }

        public static void InsertManager(Manager unManager)
        {
            unModele.InsertManager(unManager);
        }
    }
}