﻿using System;
using System.Collections.Generic;
using System.Data.Common;
using System.IO;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient; 


namespace Intranet
{
    public class Modele
    {
        private string serveur, bdd, user, mdp;
        private MySqlConnection maConnexion;
        public Modele(string serveur, string bdd, string user, string mdp) 
        {
            this.serveur = serveur;
            this.bdd = bdd;
            this.user = user;
            this.mdp = mdp;
            string url = "SslMode=None;  SERVER=" + this.serveur + "; Database=" + this.bdd + "; User ID=" + this.user + "; Password=" + this.mdp;

            try
            {
                this.maConnexion = new MySqlConnection(url);
                Console.WriteLine(url);
            }
            catch (Exception exp)
            {
                Console.WriteLine(exp.Message + " Erreur de connexion a : " + url);
            }

        }

        //EMPLOYE
        public void InsertEmploye(Employe unEmploye)
        {
            string requete = "call insertEmploye(@nom, @prenom, @email, @tel, @adresse, @mdp, @role);";
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@nom", unEmploye.Nom);
                uneCmde.Parameters.AddWithValue("@prenom", unEmploye.Prenom);
                uneCmde.Parameters.AddWithValue("@email", unEmploye.Email);
                uneCmde.Parameters.AddWithValue("@tel", unEmploye.Tel);
                uneCmde.Parameters.AddWithValue("@adresse", unEmploye.Adresse);
                uneCmde.Parameters.AddWithValue("@mdp", unEmploye.Mdp);
                uneCmde.Parameters.AddWithValue("@role", unEmploye.Role);

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch(Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
        }
       /* public void UpdateEmploye(Employe unEmploye)
        {
            string requete = "call updateEmploye(@iduser, @nom, @prenom, @email, @tel, @adresse, @mdp, @role);";
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@iduser", unEmploye.Id_user);
                uneCmde.Parameters.AddWithValue("@nom", unEmploye.Nom);
                uneCmde.Parameters.AddWithValue("@prenom", unEmploye.Prenom);
                uneCmde.Parameters.AddWithValue("@email", unEmploye.Email);
                uneCmde.Parameters.AddWithValue("@tel", unEmploye.Tel);
                uneCmde.Parameters.AddWithValue("@adresse", unEmploye.Adresse);
                uneCmde.Parameters.AddWithValue("@mdp", unEmploye.Mdp);
                uneCmde.Parameters.AddWithValue("@role", unEmploye.Role);
                

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
        }
       */
        public void DeleteEmploye(int idEmploye)
        {
            string requete = "call deleteEmploye (@idemploye);";
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@idemploye", idEmploye);

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);
            }
        }

        public List<Employe> SelectAllEmployes()
        {
            string requete = "select * from employe;";
            List<Employe> lesEmployes = new List<Employe>();
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                // creation d'un curseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un employe
                            Employe unEmploye = new Employe(
                                unReader.GetInt32(0),
                                unReader.GetString(1),
                                unReader.GetString(2),
                                unReader.GetString(3),
                                unReader.GetString(4),
                                unReader.GetString(5),
                                unReader.GetString(6),
                                unReader.GetString(7)
                                );

                            //ajouter dans la liste
                            lesEmployes.Add(unEmploye);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Console.WriteLine("Erreur de requete : " + requete);
                    Console.WriteLine(exp.Message);
                }

                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
            return lesEmployes;
        }

        public Employe SelectWhereEmploye(string email, string mdp)
        {
            string requete = "select * from employe where email = @email and mdp = @mdp;";
            Employe unEmploye = null;
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;//prepare

                uneCmde.Parameters.AddWithValue("@email", email);
                uneCmde.Parameters.AddWithValue("@mdp", mdp);//on execute dans le reader
                // creation d'un curseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader(); //fetchALL
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un employe
                            unEmploye = new Employe(
                            unReader.GetInt32(0),
                            unReader.GetString(1),
                            unReader.GetString(2),
                            unReader.GetString(3),
                            unReader.GetString(4),
                            unReader.GetString(5),
                            unReader.GetString(6),
                            unReader.GetString(7)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Console.WriteLine("Erreur de requete : " + requete);
                    Console.WriteLine(exp.Message);
                }

                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
            return unEmploye;
        }

        public Employe SelectWhereEmploye(string nom)
        {
            string requete = "select * from employe where nom = @nom;";
            Employe unEmploye = null;
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;//prepare

                uneCmde.Parameters.AddWithValue("@nom", nom);
                //on execute dans le reader
                // creation d'un curseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader(); //fetchALL
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un employe
                            unEmploye = new Employe(
                            unReader.GetInt32(0),
                            unReader.GetString(1),
                            unReader.GetString(2),
                            unReader.GetString(3),
                            unReader.GetString(4),
                            unReader.GetString(5),
                            unReader.GetString(6),
                            unReader.GetString(7)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Console.WriteLine("Erreur de requete : " + requete);
                    Console.WriteLine(exp.Message);
                }

                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
            return unEmploye;
        }


        // ABSENCE
        public void InsertAbsence(Absence uneAbsence)
        {
            string requete = "call insertAbsence(@id_user, @date_absence, @type_absence);";
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@id_user", uneAbsence.Id_user);
                uneCmde.Parameters.AddWithValue("@date_absence", uneAbsence.Date_absence);
                uneCmde.Parameters.AddWithValue("@type_absence", uneAbsence.Type_absence);

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);
            }
        }

        public void DeleteAbsence(int id_absence)
        {
            string requete = "call deleteAbsence (@id_absence);";
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@id_absence", id_absence);

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);
            }
        }

        public Absence SelectWhereAbsence(int id_user)
        {
            string requete = "select * from absence where id_user = @id_user;";
            Absence uneAbsence = null;
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;//prepare

                uneCmde.Parameters.AddWithValue("@id_absence", id_user);
                //on execute dans le reader
                // creation d'un curseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader(); //fetchALL
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un employe
                            uneAbsence = new Absence(
                            unReader.GetInt32(0),
                            unReader.GetInt32(1),
                            unReader.GetString(2),
                            unReader.GetString(3)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Console.WriteLine("Erreur de requete : " + requete);
                    Console.WriteLine(exp.Message);
                }

                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
            return uneAbsence;
        }

        public Absence SelectWhereAbsence(int id_user, string date_absence)
        {
            string requete = "select * from absence where id_user = @id_user and month(date_absence) = @date_absence;";
            Absence uneAbsence = null;
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;//prepare

                uneCmde.Parameters.AddWithValue("@id_absence", id_user);
                uneCmde.Parameters.AddWithValue("@date_absence", date_absence);
                //on execute dans le reader
                // creation d'un curseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader(); //fetchALL
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un employe
                            uneAbsence = new Absence(
                            unReader.GetInt32(0),
                            unReader.GetInt32(1),
                            unReader.GetString(2),
                            unReader.GetString(3)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Console.WriteLine("Erreur de requete : " + requete);
                    Console.WriteLine(exp.Message);
                }

                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
            return uneAbsence;
        }


        // TACHE
        public void InsertTache(Tache uneTache)
        {
            string requete = "call insertTache(@id_user, @date_tache, @heure_tache, @lieu, @motif);";

            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@id_user", uneTache.Id_user);
                uneCmde.Parameters.AddWithValue("@date_tache", uneTache.Date_tache);
                uneCmde.Parameters.AddWithValue("@heure_tache", uneTache.Heure_tache);
                uneCmde.Parameters.AddWithValue("@lieu", uneTache.Lieu);
                uneCmde.Parameters.AddWithValue("@motif", uneTache.Motif);

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);
            }
        }

        public void DeleteTache(int id_tache)
        {
            string requete = "call deleteTache (@id_tache);";
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@id_tache", id_tache);

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);
            }
        }

        public Tache SelectWhereTache(int id_user)
        {
            string requete = "select * from tache where id_user = @id_user and date_tache = curdate();";
            Tache uneTache = null;
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;//prepare

                uneCmde.Parameters.AddWithValue("@id_user", id_user);
                //on execute dans le reader
                // creation d'un curseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader(); //fetchALL
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un employe
                            uneTache = new Tache(
                            unReader.GetInt32(0),
                            unReader.GetInt32(1),
                            unReader.GetString(2),
                            unReader.GetString(3),
                            unReader.GetString(4),
                            unReader.GetString(5)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Console.WriteLine("Erreur de requete : " + requete);
                    Console.WriteLine(exp.Message);
                }

                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
            return uneTache;
        }

        public Tache SelectWhereTache(int id_user, string date_tache)
        {
            string requete = "select * from tache where id_user = @id_user and date_tache = @date_tache;";
            Tache uneTache = null;
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;//prepare

                uneCmde.Parameters.AddWithValue("@id_absence", id_user);
                uneCmde.Parameters.AddWithValue("@date_tache", date_tache);
                //on execute dans le reader
                // creation d'un curseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader(); //fetchALL
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un employe
                            uneTache = new Tache(
                            unReader.GetInt32(0),
                            unReader.GetInt32(1),
                            unReader.GetString(2),
                            unReader.GetString(3),
                            unReader.GetString(4),
                            unReader.GetString(5)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Console.WriteLine("Erreur de requete : " + requete);
                    Console.WriteLine(exp.Message);
                }

                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
            return uneTache;
        }

        // PAIE

        public void InsertPaie(Paie unePaie)
        {
            string requete = "call insertPaie(@id_user, @montant, @date_versement, @description, @objet);";
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@id_user", unePaie.Id_user);
                uneCmde.Parameters.AddWithValue("@date_absence", unePaie.Montant);
                uneCmde.Parameters.AddWithValue("@type_absence", unePaie.Date_versement);
                uneCmde.Parameters.AddWithValue("@type_absence", unePaie.Description);
                uneCmde.Parameters.AddWithValue("@type_absence", unePaie.Objet);

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);
            }
        }

        public void DeletePaie(int id_paie)
        {
            string requete = "call deletePaie (@id_paie);";
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@id_paie", id_paie);

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);
            }
        }

        public Paie SelectWherePaie(int id_user)
        {
            string requete = "select * from paie where id_user = @id_user;";
            Paie unePaie = null;
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;//prepare

                uneCmde.Parameters.AddWithValue("@id_user", id_user);
                //on execute dans le reader
                // creation d'un curseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader(); //fetchALL
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un employe
                            unePaie = new Paie(
                            unReader.GetInt32(0),
                            unReader.GetInt32(1),
                            unReader.GetFloat(2),
                            unReader.GetString(3),
                            unReader.GetString(4),
                            unReader.GetString(5)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Console.WriteLine("Erreur de requete : " + requete);
                    Console.WriteLine(exp.Message);
                }

                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
            return unePaie;
        }

        public Paie SelectWherePaie(string elem)
        {
            string requete = "select * from paie where date_versement = @elem or description = @elem or objet = @elem;";
            Paie unePaie = null;
            
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;//prepare

                uneCmde.Parameters.AddWithValue("@elem", elem);
                //on execute dans le reader
                // creation d'un curseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader(); //fetchALL
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un employe
                            unePaie = new Paie(
                            unReader.GetInt32(0),
                            unReader.GetInt32(1),
                            unReader.GetFloat(2),
                            unReader.GetString(3),
                            unReader.GetString(4),
                            unReader.GetString(5)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Console.WriteLine("Erreur de requete : " + requete);
                    Console.WriteLine(exp.Message);
                }

                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
            return unePaie;
        }

        // VABSENCES

        public List<Vabsences> SelectAllVabsences()
        {
            string requete = "select * from VuelesAbsences;";
            List<Vabsences> lesVabsences = new List<Vabsences>();
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                // creation d'un curseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un employe
                            Vabsences uneVabsences = new Vabsences(
                                unReader.GetInt32(0),
                                unReader.GetString(1),
                                unReader.GetString(2),
                                unReader.GetString(3),
                                unReader.GetString(4),
                                unReader.GetString(5)
                                );

                            //ajouter dans la liste
                            lesVabsences.Add(uneVabsences);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Console.WriteLine("Erreur de requete : " + requete);
                    Console.WriteLine(exp.Message);
                }

                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
            return lesVabsences;
        }

        public Vabsences SelectWhereVabsences(string elem)
        {
            string requete = "select * from vuelesabsences where nom = @elem or prenom = @elem or role = @elem or date_absence = @elem or type_absence = @elem;";
            Vabsences uneVabsences = null;
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;//prepare

                uneCmde.Parameters.AddWithValue("@elem", elem);
                //on execute dans le reader
                // creation d'un curseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader(); //fetchALL
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un employe
                            uneVabsences = new Vabsences(
                            unReader.GetInt32(0),
                            unReader.GetString(1),
                            unReader.GetString(2),
                            unReader.GetString(3),
                            unReader.GetString(4),
                            unReader.GetString(5)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Console.WriteLine("Erreur de requete : " + requete);
                    Console.WriteLine(exp.Message);
                }

                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
            return uneVabsences;
        }

        // VTACHES

        public List<Vtaches> SelectAllVtaches()
        {
            string requete = "select * from Vuelestaches;";
            List<Vtaches> lesVtaches = new List<Vtaches>();
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                // creation d'un curseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un employe
                            Vtaches uneVtaches = new Vtaches(
                                unReader.GetInt32(0),
                                unReader.GetString(1),
                                unReader.GetString(2),
                                unReader.GetString(3),
                                unReader.GetString(4),
                                unReader.GetString(5),
                                unReader.GetString(6)
                                );

                            //ajouter dans la liste
                            lesVtaches.Add(uneVtaches);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Console.WriteLine("Erreur de requete : " + requete);
                    Console.WriteLine(exp.Message);
                }

                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
            return lesVtaches;
        }

        public Vtaches SelectWhereVtaches(string elem)
        {
            string requete = "select * from vuelestaches where nom = @elem or prenom = @elem or role = @elem or date_heure_tache = @elem or lieu = @elem or motif = @elem;";
            Vtaches uneVtaches = null;
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;//prepare

                uneCmde.Parameters.AddWithValue("@elem", elem);
                //on execute dans le reader
                // creation d'un curseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader(); //fetchALL
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un employe
                            uneVtaches = new Vtaches(
                            unReader.GetInt32(0),
                            unReader.GetString(1),
                            unReader.GetString(2),
                            unReader.GetString(3),
                            unReader.GetString(4),
                            unReader.GetString(5),
                            unReader.GetString(6)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Console.WriteLine("Erreur de requete : " + requete);
                    Console.WriteLine(exp.Message);
                }

                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
            return uneVtaches;
        }
    }
}