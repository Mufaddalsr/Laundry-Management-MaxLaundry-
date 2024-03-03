using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;


namespace LaundryWeb_DLL
{
    public class LoginDLL
    {
        /// <summary>
        /// Use For Login
        /// </summary>
        /// <param name="MobileNo"></param>
        /// <param name="PassWord"></param>
        /// <returns></returns>
        public DataSet Login(LoginMetaData loginMetaDatas)
        {
            DataSet result = null;
            List<SqlParameter> _prms = null;
            try
            {
                result = new DataSet();
                _prms = new List<SqlParameter>();
                SqlParameter sqlParameter = new SqlParameter("@responsemessage", 0);
                sqlParameter.Direction = ParameterDirection.Output;
                sqlParameter.DbType = DbType.Int32;
                _prms.Add(sqlParameter);

                _prms.Add(new SqlParameter("PhoneNumber", loginMetaDatas.PhoneNumber));
                _prms.Add(new SqlParameter("Password", loginMetaDatas.Password));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_Login", _prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
