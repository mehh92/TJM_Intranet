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
        public static void UpdateAbsence(Absence uneAbsence)
        {
            unModele.UpdateAbsence(uneAbsence);
        }

        public static void DeleteAbsence(int id_absence)
        {
            unModele.DeleteAbsence(id_absence);
        }

        public static Absence SelectWhereAbsence(int id_user)
        {
            return unModele.SelectWhereAbsence(id_user);
        }

        public static List<Absence> SelectWhereAllAbsence(int id_user)
        {
            return unModele.SelectWhereAllAbsence(id_user);
        }

        public static List<Absence> SelectWhereAbsenceMois(int id_user, string date_absence)
        {
            return unModele.SelectWhereAbsenceMois(id_user, date_absence);
        }

        //TACHE

        public static void InsertTache(Tache uneTache)
        {
            unModele.InsertTache(uneTache);
        }

        public static void UpdateTache(Tache uneTache)
        {
            unModele.UpdateTache(uneTache);
        }

        public static void DeleteTache(int id_tache)
        {
            unModele.DeleteTache(id_tache);
        }

        public static List<Tache> SelectWhereTacheJour(int id_user)
        {
            return unModele.SelectWhereTacheJour(id_user);
        }

        public static List<Tache> SelectWhereTacheDate(int id_user, string date_tache)
        {
            return unModele.SelectWhereTacheDate(id_user, date_tache);
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

        public static List<Paie> SelectWherePaie(int id_user)
        {
            return unModele.SelectWherePaie(id_user);
        }

        public static List<Paie> SelectWherePaie(int id_user, string elem)
        {
            return unModele.SelectWherePaie(id_user, elem);
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
