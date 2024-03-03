using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace LaundryWeb_DLL.DBHelper
{
    public class DBHelper
    {

        public static string connectionString = "";
        //private static readonly string connectionString = "Data Source=SERVER\\SQLEXPRESS;initial catalog=Student;user id=sa;password=omtec12#;";

        private void WriteLog(string Message)
        {
            string str = "MLog" + DateTime.Today.ToShortDateString().Replace("/", "") + ".txt";
            try
            {
                string path = AppDomain.CurrentDomain.BaseDirectory + "\\" + str;
                if (!File.Exists(path))
                {
                    using (StreamWriter text = File.CreateText(path))
                    {
                        text.WriteLine("-----------------------------------------------------------------------------------------------------");
                        text.WriteLine("Time:" + DateTime.Now.ToString());
                        text.WriteLine("Message: " + Message ?? "");
                        text.WriteLine();
                        text.Flush();
                        text.Close();
                    }
                }
                else
                {
                    using (StreamWriter streamWriter = File.AppendText(path))
                    {
                        streamWriter.WriteLine("---------------------------------------------------------------------------");
                        streamWriter.WriteLine("Time:" + DateTime.Now.ToString());
                        streamWriter.WriteLine("Message: " + Message ?? "");
                        streamWriter.WriteLine();
                        streamWriter.Flush();
                        streamWriter.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable GetDataTableFromList<T>(List<T> data)
        {
            //Create property description collection object of you table type object
            PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(T));

            DataTable table = new DataTable();

            //Bind object field as header row of DataTable
            foreach (PropertyDescriptor prop in properties)
            {
                table.Columns.Add(prop.Name, typeof(string));
            }

            //Bind data of list into DataTable
            foreach (T item in data)
            {
                //Create dataRow object for Table
                DataRow row = table.NewRow();
                foreach (PropertyDescriptor prop in properties)
                {
                    //Assign list value into dataTable column
                    row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                }
                table.Rows.Add(row);
            }

            //return DataTable object
            return table;
        }

        public DataTable GetTableFromSP(string sp, Dictionary<string, object> parametersCollection)
        {

            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };

                foreach (KeyValuePair<string, object> parameter in parametersCollection)
                    command.Parameters.AddWithValue(parameter.Key, parameter.Value);

                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);
                command.Parameters.Clear();

                if (dataSet.Tables.Count > 0)
                {
                    return dataSet.Tables[0];
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();

            }
        }

        public DataTable GetTableFromSP(string sp, SqlParameter[] prms)
        {


            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                command.Parameters.AddRange(prms);

                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);
                command.Parameters.Clear();

                if (dataSet.Tables.Count > 0)
                {
                    return dataSet.Tables[0];
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataTable GetTableFromSP(string sp)
        {


            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            try
            {
                command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);
                command.Parameters.Clear();

                if (dataSet.Tables.Count > 0)
                {
                    return dataSet.Tables[0];
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
                command.Dispose();
            }
        }

        public void ExecuteNonQuery(string sp, SqlParameter[] prms)
        {

            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            try
            {
                command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                command.Parameters.AddRange(prms);

                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;

            }
            finally
            {
                connection.Close();
                command.Dispose();
            }
        }

        public void ExecuteNonQuery(string sp, SqlParameter prms)
        {

            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            try
            {
                command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();
                prms.SqlDbType = SqlDbType.Structured;
                command.Parameters.Add(prms);
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
                command.Dispose();
            }
        }

        public void ExecuteNonQuery(string sp, SqlParameter prm, SqlParameter[] prms)
        {

            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            try
            {
                command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();
                prm.SqlDbType = SqlDbType.Structured;
                command.Parameters.Add(prm);
                command.Parameters.AddRange(prms);
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
                command.Dispose();
            }
        }

        public int ExecuteNonQuery(string commandText)
        {

            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            try
            {
                command = new SqlCommand(commandText, connection) { CommandType = CommandType.Text, CommandTimeout = 3600 };
                connection.Open();
                int result = command.ExecuteNonQuery();
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
                command.Dispose();
            }
        }

        public DataTable GetTableRow(string sp, SqlParameter[] prms)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                command.Parameters.AddRange(prms);
                connection.Open();

                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);
                command.Parameters.Clear();

                if (dataSet.Tables.Count > 0)
                {
                    return dataSet.Tables[0];
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet GetDatasetFromSP(string sp, SqlParameter[] prms)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                command.Parameters.AddRange(prms);

                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet, "ResultSet");
                command.Parameters.Clear();

                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public decimal GetDatasetFromSPUser(string sp, SqlParameter[] prms)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            decimal num = new decimal();
            try
            {
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction("UpdateUserSession");

                command.Parameters.AddRange(prms);
                command.Transaction = transaction;
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);
                command.Parameters.Clear();

                num = Convert.ToDecimal(dataSet.Tables[0].Rows[0]["USR_LOGID"].ToString());
                if (num > decimal.Zero)
                {
                    transaction.Commit();
                }
                else
                {
                    transaction.Rollback("UpdateUserSession");
                }

                return num;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet GetDatasetFromSPWithResult(string sp, SqlParameter[] prms)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                command.Parameters.AddRange(prms);
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet, "ResultSet");

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                command.Parameters.Clear();

                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult(string sp, SqlParameter[] prms, string transactionName, bool transapply = true)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlTransaction transaction = null;
            try
            {
                if (transapply)
                    transactionName = Guid.NewGuid().ToString().Substring(0, 10);

                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();
                command.Parameters.AddRange(prms);
                if (transapply)
                {
                    transaction = connection.BeginTransaction(transactionName);
                    command.Transaction = transaction;
                }
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables["Result1"].Rows.Count > 0)
                    {
                        if (!dataSet.Tables["Result1"].Rows[0].IsNull("Value"))
                        {
                            switch (Convert.ToDecimal(dataSet.Tables["Result1"].Rows[0]["Value"]))
                            {
                                case decimal.MinusOne:
                                    command.Parameters.Clear();
                                    if (transapply)
                                    {
                                        transaction.Rollback(transactionName);
                                    }
                                    return dataSet;
                            }
                        }
                    }
                }
                if (transapply)
                {
                    transaction.Commit();
                }
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult15(string sp, SqlParameter[] prms, string transactionName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                SqlTransaction transaction = connection.BeginTransaction(transactionName);

                command.Parameters.AddRange(prms);
                command.Transaction = transaction;
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        if (Convert.ToInt16(command.Parameters["TYPE"]) != 6 || Convert.ToInt16(command.Parameters["INV_PAYMODE"]) != 3)
                        {
                            if (!dataSet.Tables[0].Rows[0].IsNull("RET"))
                            {
                                switch (Convert.ToDecimal(dataSet.Tables[0].Rows[0]["RET"].ToString()))
                                {
                                    case decimal.Zero:
                                    case decimal.MinusOne:
                                        command.Parameters.Clear();
                                        transaction.Rollback(transactionName);
                                        return dataSet;
                                }
                            }
                        }
                        else
                        {
                            if (!dataSet.Tables[0].Rows[0].IsNull(0))
                            {
                                switch (Convert.ToDecimal(dataSet.Tables[0].Rows[0][0].ToString()))
                                {
                                    case decimal.One:
                                        transaction.Commit();
                                        command.Parameters.Clear();
                                        return dataSet;
                                }
                            }
                        }
                    }
                }


                transaction.Commit();
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult14(string sp, SqlParameter[] prms, string transactionName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                SqlTransaction transaction = connection.BeginTransaction(transactionName);

                command.Parameters.AddRange(prms);
                command.Transaction = transaction;
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        if (!dataSet.Tables[0].Rows[0].IsNull("RET"))
                        {
                            switch (Convert.ToDecimal(dataSet.Tables[0].Rows[0]["RET"].ToString()))
                            {
                                case decimal.Zero:
                                case decimal.MinusOne:
                                    command.Parameters.Clear();
                                    transaction.Rollback(transactionName);
                                    return dataSet;
                            }
                        }
                    }
                }
                transaction.Commit();
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult3(string sp, SqlParameter[] prms, string transactionName, bool transapply = true)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlTransaction transaction = null;
            try
            {
                if (transapply)
                {
                    transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                }
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                command.Parameters.AddRange(prms);

                if (transapply)
                {
                    transaction = connection.BeginTransaction(transactionName);
                    command.Transaction = transaction;
                }

                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        if (!dataSet.Tables[0].Rows[0].IsNull("PRESULT"))
                        {
                            switch (Convert.ToDecimal(dataSet.Tables[0].Rows[0]["PRESULT"].ToString()))
                            {
                                case decimal.Zero:
                                case decimal.MinusOne:
                                    command.Parameters.Clear();
                                    if (transapply)
                                    {
                                        transaction.Rollback(transactionName);
                                    }
                                    return dataSet;
                            }
                        }
                    }
                }
                if (transapply)
                {
                    transaction.Commit();
                }
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult4(string sp, SqlParameter[] prms, string transactionName, bool transapply = true)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlTransaction transaction = null;
            try
            {
                if (transapply)
                {
                    transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                }
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();
                command.Parameters.AddRange(prms);

                if (transapply)
                {
                    transaction = connection.BeginTransaction(transactionName);
                    command.Transaction = transaction;
                }

                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        if (!dataSet.Tables[0].Rows[0].IsNull("PRESULT"))
                        {
                            switch (Convert.ToDecimal(dataSet.Tables[0].Rows[0]["PRESULT"].ToString()))
                            {
                                case decimal.MinusOne:
                                    command.Parameters.Clear();
                                    if (transapply)
                                    {
                                        transaction.Rollback(transactionName);
                                    }
                                    return dataSet;
                            }
                        }
                    }
                }
                if (transapply)
                {
                    transaction.Commit();
                }
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult2(string sp, SqlParameter[] prms, string transactionName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                SqlTransaction transaction = connection.BeginTransaction(transactionName);

                command.Parameters.AddRange(prms);
                command.Transaction = transaction;
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables["Result1"].Rows.Count > 0)
                    {
                        if (!dataSet.Tables["Result1"].Rows[0].IsNull("Value"))
                        {
                            switch (Convert.ToDecimal(dataSet.Tables["Result1"].Rows[0]["Value"]))
                            {
                                case decimal.One:
                                    transaction.Commit();
                                    command.Parameters.Clear();
                                    return dataSet;
                            }
                        }
                    }
                }
                transaction.Rollback(transactionName);
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult33(string sp, SqlParameter[] prms, string transactionName, bool transapply = false)
        {
            SqlTransaction transaction = null;
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                if (transapply)
                {
                    transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                }
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                command.Parameters.AddRange(prms);
                if (transapply)
                {
                    transaction = connection.BeginTransaction(transactionName);
                    command.Transaction = transaction;
                }

                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        if (!dataSet.Tables[0].Rows[0].IsNull(0))
                        {
                            switch (Convert.ToDecimal(dataSet.Tables[0].Rows[0][0].ToString()))
                            {
                                case decimal.One:
                                    command.Parameters.Clear();
                                    if (transapply)
                                    {
                                        transaction.Commit();

                                    }
                                    return dataSet;
                            }
                        }
                    }
                }
                if (transapply)
                {
                    transaction.Rollback(transactionName);
                }
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }
        public DataSet SaveDatasetFromSPWithResult7(string sp, SqlParameter[] prms, string transactionName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                SqlTransaction transaction = connection.BeginTransaction(transactionName);

                command.Parameters.AddRange(prms);
                command.Transaction = transaction;
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        if (!dataSet.Tables[0].Rows[0].IsNull(0))
                        {
                            switch (Convert.ToDecimal(dataSet.Tables[0].Rows[0][0].ToString()))
                            {
                                case decimal.One:
                                    transaction.Commit();
                                    command.Parameters.Clear();
                                    return dataSet;
                            }
                        }
                    }
                }
                transaction.Rollback(transactionName);
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult8(string sp, SqlParameter[] prms, string transactionName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                SqlTransaction transaction = connection.BeginTransaction(transactionName);

                command.Parameters.AddRange(prms);
                command.Transaction = transaction;
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        if (!dataSet.Tables[0].Rows[0].IsNull(0))
                        {
                            switch (Convert.ToDecimal(dataSet.Tables[0].Rows[0]["COUNT"].ToString()))
                            {
                                case decimal.One:
                                    transaction.Commit();
                                    command.Parameters.Clear();
                                    return dataSet;
                            }
                        }
                    }
                }
                transaction.Rollback(transactionName);
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult9(string sp, SqlParameter[] prms, string transactionName, bool transapply = true)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlTransaction transaction = null;
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                command.Parameters.AddRange(prms);

                if (transapply)
                {
                    transaction = connection.BeginTransaction(transactionName);
                    command.Transaction = transaction;
                }

                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        if (!dataSet.Tables[0].Rows[0].IsNull("RESULT"))
                        {
                            switch (Convert.ToDecimal(dataSet.Tables[0].Rows[0]["RESULT"].ToString()))
                            {
                                case decimal.MinusOne:
                                case decimal.Zero:
                                    command.Parameters.Clear();
                                    if (transapply)
                                    {
                                        transaction.Rollback(transactionName);
                                    }
                                    return dataSet;
                            }
                        }
                    }
                }
                if (transapply)
                {
                    transaction.Commit();
                }
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult6(string sp, SqlParameter[] prms, string transactionName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                SqlTransaction transaction = connection.BeginTransaction(transactionName);

                command.Parameters.AddRange(prms);
                command.Transaction = transaction;
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        if (!dataSet.Tables[0].Rows[0].IsNull("Return"))
                        {
                            if (Convert.ToDecimal(dataSet.Tables[0].Rows[0]["Return"]) > decimal.Zero)
                            {
                                transaction.Commit();
                                command.Parameters.Clear();
                                return dataSet;
                            }
                        }
                    }
                }
                transaction.Rollback(transactionName);
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult18(string sp, SqlParameter[] prms, string transactionName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                SqlTransaction transaction = connection.BeginTransaction(transactionName);

                command.Parameters.AddRange(prms);
                command.Transaction = transaction;
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        if (!dataSet.Tables[0].Rows[0].IsNull("Return"))
                        {
                            if (Convert.ToDecimal(dataSet.Tables[0].Rows[0]["Return"]) == decimal.One)
                            {
                                transaction.Commit();
                                command.Parameters.Clear();
                                return dataSet;
                            }
                        }
                    }
                }
                transaction.Rollback(transactionName);
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult12(string sp, SqlParameter[] prms, string transactionName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                SqlTransaction transaction = connection.BeginTransaction(transactionName);

                command.Parameters.AddRange(prms);
                command.Transaction = transaction;
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        if (!dataSet.Tables["Result1"].Rows[0].IsNull("Value"))
                        {
                            if (Convert.ToDecimal(dataSet.Tables["Result1"].Rows[0]["Value"]) > decimal.Zero)
                            {
                                transaction.Commit();
                                command.Parameters.Clear();
                                return dataSet;
                            }
                        }
                    }
                }
                transaction.Rollback(transactionName);
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithTransferResult(string sp, SqlParameter[] prms, string transactionName, short formIdentity, bool transapply = true)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlTransaction transaction = null;
            try
            {
                if (transapply)
                {
                    transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                }
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                command.Parameters.AddRange(prms);

                if (transapply)
                {
                    transaction = connection.BeginTransaction(transactionName);
                    command.Transaction = transaction;
                }

                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (formIdentity != 2)
                    {
                        switch (Convert.ToDecimal(dataSet.Tables[0].Rows[0][0]))
                        {
                            case decimal.MinusOne:
                                if (transapply)
                                {
                                    transaction.Rollback(transactionName);
                                }
                                command.Parameters.Clear();
                                return dataSet;
                        }
                    }
                    if (!dataSet.Tables["Result1"].Rows[0].IsNull("Value"))
                    {
                        switch (Convert.ToDecimal(dataSet.Tables["Result1"].Rows[0]["Value"]))
                        {
                            case decimal.MinusOne:
                                if (transapply)
                                {
                                    transaction.Rollback(transactionName);
                                }
                                command.Parameters.Clear();
                                return dataSet;
                        }
                    }
                }
                if (transapply)
                {
                    transaction.Commit();
                }
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult1(string sp, SqlParameter[] prms, string transactionName, bool transapply = true)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlTransaction transaction = null;
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                command.Parameters.AddRange(prms);
                if (transapply)
                {
                    transaction = connection.BeginTransaction(transactionName);
                    command.Transaction = transaction;
                }

                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables["Result1"].Rows.Count > 0)
                    {
                        if (!dataSet.Tables["Result1"].Rows[0].IsNull("Value"))
                        {
                            switch (Convert.ToDecimal(dataSet.Tables["Result1"].Rows[0]["Value"]))
                            {
                                case decimal.Zero:
                                case decimal.MinusOne:
                                    command.Parameters.Clear();
                                    if (transapply)
                                    {
                                        transaction.Rollback(transactionName);
                                    }
                                    return dataSet;
                            }
                        }
                    }
                }
                if (transapply)
                {
                    transaction.Commit();
                    transaction.Dispose();
                }
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult10(string sp, SqlParameter[] prms, string transactionName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                SqlTransaction transaction = connection.BeginTransaction(transactionName);

                command.Parameters.AddRange(prms);
                command.Transaction = transaction;
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        if (!dataSet.Tables[0].Rows[0].IsNull("Return"))
                        {
                            switch (Convert.ToDecimal(dataSet.Tables[0].Rows[0]["Return"]))
                            {
                                case decimal.Zero:
                                case decimal.MinusOne:
                                    command.Parameters.Clear();
                                    transaction.Rollback(transactionName);
                                    return dataSet;
                            }
                        }
                    }
                }
                transaction.Commit();
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult11(string sp, SqlParameter[] prms, string transactionName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                SqlTransaction transaction = connection.BeginTransaction(transactionName);

                command.Parameters.AddRange(prms);
                command.Transaction = transaction;
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables["Result1"].Rows.Count > 0)
                    {
                        if (!dataSet.Tables["Result1"].Rows[0].IsNull("Value"))
                        {
                            switch (Convert.ToDecimal(dataSet.Tables[0].Rows[0]["RETVAL"]))
                            {
                                case decimal.One:
                                    transaction.Commit();
                                    command.Parameters.Clear();
                                    return dataSet;
                            }
                        }
                    }
                }
                transaction.Rollback(transactionName);
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult16(string sp, SqlParameter[] prms, string transactionName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                SqlTransaction transaction = connection.BeginTransaction(transactionName);

                command.Parameters.AddRange(prms);
                command.Transaction = transaction;
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        if (!dataSet.Tables[0].Rows[0].IsNull(0))
                        {
                            switch (Convert.ToDecimal(dataSet.Tables[0].Rows[0][0].ToString()))
                            {
                                case decimal.Zero:
                                case decimal.One:
                                    transaction.Commit();
                                    command.Parameters.Clear();
                                    return dataSet;
                            }
                        }
                    }
                }
                transaction.Rollback(transactionName);
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet SaveDatasetFromSPWithResult17(string sp, SqlParameter[] prms, string transactionName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                SqlTransaction transaction = connection.BeginTransaction(transactionName);

                command.Parameters.AddRange(prms);
                command.Transaction = transaction;
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                DataTable table = new DataTable("Result1");
                table.Columns.Add("Name");
                table.Columns.Add("Value");

                foreach (SqlParameter paraMeter in command.Parameters)
                {
                    if (paraMeter.Direction == ParameterDirection.Output && paraMeter.DbType != DbType.Object)
                    {
                        DataRow row = table.NewRow();
                        row[0] = paraMeter.ParameterName;
                        row[1] = paraMeter.Value;
                        table.Rows.Add(row);
                    }
                }

                if (table.Rows.Count > 0)
                {
                    dataSet.Tables.Add(table);
                }

                if (dataSet.Tables.Count > 0)
                {
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        if (!dataSet.Tables[0].Rows[0].IsNull(0))
                        {
                            switch (Convert.ToDecimal(dataSet.Tables[0].Rows[0][0].ToString()))
                            {
                                case decimal.MinusOne:
                                    transaction.Commit();
                                    command.Parameters.Clear();
                                    return dataSet;
                            }
                        }
                    }
                }
                transaction.Rollback(transactionName);
                command.Parameters.Clear();
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }


        public DataSet GetDatasetFromSP(string sp)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);
                command.Parameters.Clear();

                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet GetDatasetFromSPTranscation(string sp, string transactionName, SqlParameter[] prms)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                SqlTransaction tran = connection.BeginTransaction(transactionName);

                command.Parameters.AddRange(prms);
                command.Transaction = tran;
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                if (dataSet.Tables[0].Rows[0]["COUNT"].ToString() != "0")
                {
                    tran.Commit();
                    return dataSet;
                }
                tran.Rollback(transactionName);
                command.Parameters.Clear();

                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet GetDatasetFromSPTranscationResult(string sp, string transactionName, SqlParameter[] prms)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                transactionName = Guid.NewGuid().ToString().Substring(0, 10);
                SqlCommand command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                SqlTransaction tran = connection.BeginTransaction(transactionName);

                command.Parameters.AddRange(prms);
                command.Transaction = tran;
                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);

                if (dataSet.Tables.Count > 1)
                {
                    if (Convert.ToDecimal(dataSet.Tables[1].Rows[0][0]) > decimal.Zero)
                    {
                        tran.Commit();
                        return dataSet;
                    }
                }
                else if (dataSet.Tables.Count == 1)
                {
                    if (Convert.ToDecimal(dataSet.Tables[0].Rows[0][0]) > decimal.Zero)
                    {
                        tran.Commit();
                        return dataSet;
                    }
                }
                tran.Rollback(transactionName);
                command.Parameters.Clear();

                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet GetDatasetFromQuery(string sp)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                SqlCommand command = new SqlCommand(sp, connection) { CommandTimeout = 3600 };
                connection.Open();

                DataSet dataSet = new DataSet();
                (new SqlDataAdapter(command)).Fill(dataSet);
                command.Parameters.Clear();

                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
                //return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public int ExecuteNonQueryReturn(string sp, SqlParameter[] prms)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            try
            {
                command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();
                command.Parameters.AddRange(prms);
                SqlParameter returnParameter = command.Parameters.Add("RetVal", SqlDbType.Int);
                returnParameter.Direction = ParameterDirection.ReturnValue;
                //int result = command.ExecuteNonQuery();
                command.ExecuteNonQuery();
                int result = (int)returnParameter.Value;
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
                command.Dispose();
            }
        }

        public int ExecuteMultipleRowsInsertQueryReturn(string sp, DataTable dataTable)
        {

            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            try
            {
                command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();
                command.Parameters.AddWithValue("@table1", dataTable);
                SqlParameter returnParameter = command.Parameters.Add("RetVal", SqlDbType.Int);
                returnParameter.Direction = ParameterDirection.ReturnValue;
                //int result = command.ExecuteNonQuery();
                command.ExecuteNonQuery();
                int result = (int)returnParameter.Value;
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
                command.Dispose();
            }
        }

        public string ExecuteNonQueryReturnStraing(string sp, string returnParameter, SqlParameter[] prms)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            try
            {
                command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();

                command.Parameters.AddRange(prms);
                //int result = command.ExecuteNonQuery();
                command.ExecuteNonQuery();
                string result = (string)command.Parameters[returnParameter].Value;
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
                command.Dispose();
            }
        }

        public string ExecuteScalarFunction(string CommandText)
        {
            string Result = "";

            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            try
            {
                connection.Open();
                command = new SqlCommand(CommandText, connection);
                SqlDataAdapter da = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                da.Fill(dt);

                Result = dt.Rows[0][0].ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
                command.Dispose();
            }

            return Result;

        }

        public void ExecuteMultipleDatatable(string sp, SqlParameter[] prms, DataSet ds)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            try
            {
                command = new SqlCommand(sp, connection) { CommandType = CommandType.StoredProcedure, CommandTimeout = 3600 };
                connection.Open();
                command.Parameters.AddRange(prms);
                if (null != ds)
                {
                    foreach (DataTable dt in ds.Tables)
                    {
                        SqlParameter parameter = new SqlParameter();
                        parameter.SqlDbType = SqlDbType.Structured;

                        //DataTable.TableName is the parameter Name
                        //e.g: @AppList
                        parameter.ParameterName = dt.TableName;
                        //DataTable.DisplayExpression is the equivalent SQLType Name. i.e. Name of the UserDefined Table type
                        //e.g: AppCollectionType
                        //parameter.TypeName = dt.DisplayExpression;
                        parameter.TypeName = dt.Namespace;
                        parameter.Value = dt;

                        command.Parameters.Add(parameter);
                    }
                }
                int result = command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
                command.Dispose();
            }


        }

    }
}

