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


        //EMPLOYE
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


        //ABSENCE
        public static void InsertAbsence(Absence uneAbsence)
        {
            unModele.InsertAbsence(uneAbsence);
        }

        public static void DeleteAbsence(int id_absence)
        {
            unModele.DeleteAbsence(id_absence);
        }

        public static Absence SelectWhereAbsence(int id_user)
        {
            return unModele.SelectWhereAbsence(id_user);
        }

        //TACHE

        public static void InsertTache(Tache uneTache)
        {
            unModele.InsertTache(uneTache);
        }

        public static void DeleteTache(int id_tache)
        {
            unModele.DeleteTache(id_tache);
        }

        public static Tache SelectWhereTache(int id_user)
        {
            return unModele.SelectWhereTache(id_user);
        }

        //PAIE

        public static void InsertPaie(Paie unePaie)
        {
            unModele.InsertPaie(unePaie);
        }

        public static void DeletePaie(int id_paie)
        {
            unModele.DeletePaie(id_paie);
        }

        public static Paie SelectWherePaie(int id_user)
        {
            return unModele.SelectWherePaie(id_user);
        }

        //VABSENCES

        public static List<Vabsences> SelectAllVabsences()
        {
            return unModele.SelectAllVabsences();
        }

        public static Vabsences SelectWhereVabsences(string elem)
        {
            return unModele.SelectWhereVabsences(elem);
        }

        //VTACHES
        public static List<Vtaches> SelectAllVtaches()
        {
            return unModele.SelectAllVtaches();
        }

        public static Vtaches SelectWhereVtaches(string elem)
        {
            return unModele.SelectWhereVtaches(elem);
        }
    }

}
