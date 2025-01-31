﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Security.Cryptography;
namespace vwar.service.host
{
    //not using these currently, but will be useful eventually
    public enum APIKeyState {ACTIVE =0, INACTIVE};

    //a quick st
    public class APIKey
    {
        public string Key;
        public string Email;
        public string Usage;
        public APIKeyState State;

        public APIKey()
        {
            Email = String.Empty;
            Usage = String.Empty;
        }

        public override bool Equals(object obj)
        {
            APIKey compareTo = obj as APIKey;
            return compareTo != null
                && compareTo.Email.ToLower().Equals(this.Email.ToLower())
                && compareTo.Usage.Equals(this.Usage)
                && compareTo.Key.Equals(this.Key)
                && compareTo.State.Equals(this.State);
        }
        
    }
    public class APIKeyManager 
    {

        private string ConnectionString;
        private System.Data.Odbc.OdbcConnection mConnection;
        public APIKeyManager()
        {
            ConnectionString = ConfigurationManager.ConnectionStrings["APIKeyDatabaseConnection"].ConnectionString;
            mConnection = new System.Data.Odbc.OdbcConnection(ConnectionString);
            CheckConnection();
        }
        static public bool KillODBCConnection(System.Data.Odbc.OdbcConnection myConn)
        {
            if (myConn != null)
            {
                if (myConn.State == System.Data.ConnectionState.Closed)
                    return false;

                try
                {
                    string strSQL = "kill connection_id()";
                    System.Data.Odbc.OdbcCommand myCmd = new System.Data.Odbc.OdbcCommand(strSQL, myConn);
                    myCmd.CommandText = strSQL;
                    
                    myCmd.ExecuteNonQuery();

          
                }
                catch (Exception ex)
                {
                }

            }

            return true;
        }
        ~APIKeyManager()
        {
            KillODBCConnection(mConnection);
            mConnection = null;
        }
        public void Dispose()
        {
            KillODBCConnection(mConnection);
            mConnection = null;
        }
        //Get all keys registered to a user
        public List<APIKey> GetKeysByUser(string email)
        {
            CheckConnection();
            
            List<APIKey> results = new List<APIKey>();

            using (var command = mConnection.CreateCommand())
            {
                command.CommandText = "{CALL GetByUser(?)}";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("newEmail", email);

                using (var resultSet = command.ExecuteReader())
                {
                    while (resultSet.Read())
                    {
                        APIKey newkey = new APIKey();
                        newkey.Email = resultSet["Email"].ToString();
                        newkey.Key = resultSet["KeyText"].ToString();
                        newkey.Usage = resultSet["UsageText"].ToString();
                        newkey.State = (APIKeyState)(System.Convert.ToInt16(resultSet["State"].ToString()));
                        results.Add(newkey);
                    }
                }
            }
            
            return results;
        }
        //Get the user a key is registered to
        public string GetUserByKey(string key)
        {
            CheckConnection();

            APIKey newkey = null;
            using (var command = mConnection.CreateCommand())
            {
                command.CommandText = "{CALL GetByKey(?)}";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("newkey", key);

                using (var resultSet = command.ExecuteReader())
                {
                    while (resultSet.Read())
                    {
                        newkey = new APIKey();
                        newkey.Email = resultSet["Email"].ToString();
                        newkey.Key = resultSet["KeyText"].ToString();
                        newkey.Usage = resultSet["UsageText"].ToString();
                        newkey.State = (APIKeyState)(System.Convert.ToInt16(resultSet["State"].ToString()));
                       
                    }
                }
            }
            
            if (newkey != null)
                return newkey.Email;
            else
                return null;
        }
        //Get the user a key is registered to
        public APIKey GetKeyByKey(string key)
        {
            CheckConnection();

            APIKey newkey = null;
            using (var command = mConnection.CreateCommand())
            {
                command.CommandText = "{CALL GetByKey(?)}";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("newkey", key);

                using (var resultSet = command.ExecuteReader())
                {
                    while (resultSet.Read())
                    {
                        newkey = new APIKey();
                        newkey.Email = resultSet["Email"].ToString();
                        newkey.Key = resultSet["KeyText"].ToString();
                        newkey.Usage = resultSet["UsageText"].ToString();
                        newkey.State = (APIKeyState)(System.Convert.ToInt16(resultSet["State"].ToString()));

                    }
                }
            }
            
            return newkey;  
        }
        //Create a new key for a user
        public APIKey CreateKey(string email, string usage)
        {
            CheckConnection();
            APIKey key = new APIKey();
            key.Email = email;
            key.Usage = usage;
            key.Key = GetNewKey( email,  usage);
            InsertKey(key);
            return key;
        }
        //Get a unique string for a key
        private string GetNewKey(string email, string usage)
        {
            string key = Hash(email + usage);
            key = key.Substring(key.Length - 8);

            string Collides = GetUserByKey(key);
            if (Collides != null)
                return GetNewKey(email + key, usage + key);

            return key;
        }
        //Create a string from the input
        private static string Hash(string url)
        {
            byte[] result;
            SHA256 shaM = new SHA256Managed();
            byte[] ms = new byte[url.Length];
            for (int i = 0; i < url.Length; i++)
            {
                byte b = Convert.ToByte(url[i]);
                ms[i] = (b);
            }
            shaM.Initialize();
            result = shaM.ComputeHash(ms, 0, ms.Length);
            return BitConverter.ToString(result);
        }
        //Add a key to the database
        public bool UpdateKey(APIKey key)
        {

            //you must give a valid key - also, you cannot change a keycode
            APIKey oldkey = GetKeyByKey(key.Key);
            if (oldkey == null)
                return false;

            //you cannot modify the email registerd to a key
            if (key.Email != oldkey.Email)
                return false;


            using (var command = mConnection.CreateCommand())
            {

                command.CommandText = "{CALL UpdateKey(?,?,?,?)}";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("newEmail", key.Email);
                command.Parameters.AddWithValue("newKeyText", key.Key);
                command.Parameters.AddWithValue("newUsage", key.Usage);
                command.Parameters.AddWithValue("newState", key.State);

                command.ExecuteScalar();
            }
            
            return true;
        }
        //Add a key to the database
        private bool InsertKey(APIKey key)
        {
            using (var command = mConnection.CreateCommand())
            {

                command.CommandText = "{CALL InsertKey(?,?,?,?)}";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("newEmail", key.Email);
                command.Parameters.AddWithValue("newKeyText", key.Key);
                command.Parameters.AddWithValue("newUsage", key.Usage);
                command.Parameters.AddWithValue("newState", key.State);

                command.ExecuteScalar();
            }
            
            return true;
        }
        //Remove a key from the database
        public bool DeleteKey(string key)
        {
            CheckConnection();
            using (var command = mConnection.CreateCommand())
            {
                command.CommandText = "{CALL DeleteKey(?)}";
                command.Parameters.AddWithValue("newKey", key);
                command.ExecuteScalar();
            }
            
            return true;
        }
        //check that a connection can be made to the database
        private bool CheckConnection()
        {
            if (mConnection == null)
                mConnection = new System.Data.Odbc.OdbcConnection(ConnectionString);
            int sleeptime = 0;
            while ((mConnection.State == System.Data.ConnectionState.Connecting ||
                mConnection.State == System.Data.ConnectionState.Connecting ||
                mConnection.State == System.Data.ConnectionState.Connecting) &&
                sleeptime < 5000
                )
            {
                sleeptime += 100;
                System.Threading.Thread.Sleep(100);
            }
            if (sleeptime > 5000)
                throw new System.Net.WebException("Could not connect to database");

            if (mConnection.State != System.Data.ConnectionState.Open)
                mConnection.Open();

            return true;
        }
    }

}