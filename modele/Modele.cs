using System;
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

        public void InsertMecanicien(Mecanicien unMecanicien)
        {
            string requete = "call InsertMecanicien(@nom, @prenom, @email, @tel, @mdp, @role, @adresse);";
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@nom", unMecanicien.Nom);
                uneCmde.Parameters.AddWithValue("@prenom", unMecanicien.Prenom);
                uneCmde.Parameters.AddWithValue("@email", unMecanicien.Email);
                uneCmde.Parameters.AddWithValue("@email", unMecanicien.Tel);
                uneCmde.Parameters.AddWithValue("@mdp", unMecanicien.Mdp);
                uneCmde.Parameters.AddWithValue("@email", unMecanicien.Role);
                uneCmde.Parameters.AddWithValue("@adresse", unMecanicien.Adresse);

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch(Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
        }

        public void InsertManager(Manager unManager)
        {
            string requete = "call InsertManager(@nom, @prenom, @email, @tel, @mdp, @role, @adresse);";
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@nom", unManager.Nom);
                uneCmde.Parameters.AddWithValue("@prenom", unManager.Prenom);
                uneCmde.Parameters.AddWithValue("@email", unManager.Email);
                uneCmde.Parameters.AddWithValue("@email", unManager.Tel);
                uneCmde.Parameters.AddWithValue("@mdp", unManager.Mdp);
                uneCmde.Parameters.AddWithValue("@email", unManager.Role);
                uneCmde.Parameters.AddWithValue("@adresse", unManager.Adresse);

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
        }

        public void UpdateMecanicien(Mecanicien unMecanicien)
        {
            string requete = "call UpdateMecanicien(@iduser, @nom, @prenom, @email, @tel, @mdp, @role, @adresse);";
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@idpers", unMecanicien.IdUser);
                uneCmde.Parameters.AddWithValue("@nom", unMecanicien.Nom);
                uneCmde.Parameters.AddWithValue("@prenom", unMecanicien.Prenom);
                uneCmde.Parameters.AddWithValue("@email", unMecanicien.Email);
                uneCmde.Parameters.AddWithValue("@email", unMecanicien.Tel);
                uneCmde.Parameters.AddWithValue("@mdp", unMecanicien.Mdp);
                uneCmde.Parameters.AddWithValue("@email", unMecanicien.Role);
                uneCmde.Parameters.AddWithValue("@adresse", unMecanicien.Adresse);

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
        }
        public void DeleteMecanicien(int idMecanicien)
        {
            string requete = "call deleteMecanicien (@idmecanicien);";
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@idmecanicien", idMecanicien);

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);
            }
        }

        public List<Mecanicien> SelectAllMecaniciens()
        {
            string requete = "select * from vueClients;";
            List<Mecanicien> lesMecaniciens = new List<Mecanicien>();
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
                            //instanciation d'un client
                            Mecanicien unMecanicien = new Mecanicien(
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
                            lesMecaniciens.Add(unMecanicien);
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
            return lesMecaniciens;
        }

        public Mecanicien SelectWhereMecanicien(int idMecanicien)
        {
            string requete = "select * from vueMecaniciens where iduser = @idmecanicien;";
            Mecanicien unMecanicien = null;
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;//prepare

                uneCmde.Parameters.AddWithValue("@idmecanicien", idMecanicien);//on execute dans le reader
                // creation d'un curseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader(); //fetchALL
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un client
                            unMecanicien = new Mecanicien(
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
            return unMecanicien;
        }

        public Manager SelectWhereManager(string email, string mdp)
        {
            string requete = "select * from vueManagers where email = @email and mdp = @mdp;";
            Manager unManager = null;
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                uneCmde.Parameters.AddWithValue("@email", email);
                uneCmde.Parameters.AddWithValue("@mdp", mdp);
                // creation d'un curseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un client
                            unManager = new Manager(
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
            return unManager;
        }
    }
}