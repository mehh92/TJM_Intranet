using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient; 


namespace Depannage
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
            string url = "SERVER="+this.serveur+"; Database="+this.bdd+"; User Id ="+this.user+"; Password="+this.mdp;

            try
            {
                this.maConnexion = new MySqlConnection(url);
            }
            catch (Exception exp) 
            { 
                Console.WriteLine("Erreur de connexion a : "+url);
            }

        }

        public void InsertClient(Client unClient)
        {
            string requete = "call insertClient(@nom, @prenom, @email, @mdp, @adresse);";
            try
            {
                this.maConnexion.Open();

                MySqlCommand uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@nom", unClient.Nom);
                uneCmde.Parameters.AddWithValue("@prenom", unClient.Prenom);
                uneCmde.Parameters.AddWithValue("@email", unClient.Email);
                uneCmde.Parameters.AddWithValue("@mdp", unClient.Mdp);
                uneCmde.Parameters.AddWithValue("@adresse", unClient.Adresse);

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch(Exception exp)
            {
                Console.WriteLine("Erreur de requete : " + requete);
                Console.WriteLine(exp.Message);

            }
        }
    }
}