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

        public void UpdateEmploye(Employe unEmploye)
        {
            string requete = "call updateEmploye(@iduser, @nom, @prenom, @email, @tel, @adresse, @mdp, @role);";
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@iduser", unEmploye.IdUser);
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
            string requete = "select * from vueClients;";
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
            string requete = "select * from vueEmployes where email = @email and mdp = @mdp;";
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
    }
}