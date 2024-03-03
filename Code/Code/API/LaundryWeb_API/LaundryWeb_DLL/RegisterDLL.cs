using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;


namespace LaundryWeb_DLL
{
    public class RegisterDLL
    {/// <summary>
     /// Clients DML Opearation
     /// </summary>
     /// <param name="registerMetaDatas"></param>
     /// <returns></returns>
        public DataSet Register(RegisterMetaData registerMetaDatas)
        {
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
                SqlParameter sqlParameter = new SqlParameter("@responsemessage", 0);
                sqlParameter.Direction = ParameterDirection.Output;
                sqlParameter.DbType = DbType.Int32;
                prms.Add(sqlParameter);

                prms.Add(new SqlParameter("ID", registerMetaDatas.ID));
                prms.Add(new SqlParameter("CustomerID", registerMetaDatas.CustomerID));
                prms.Add(new SqlParameter("CompanyID", registerMetaDatas.CompanyID));
                prms.Add(new SqlParameter("CorpID", registerMetaDatas.CorpID));
                prms.Add(new SqlParameter("FullName", registerMetaDatas.FullName));
                prms.Add(new SqlParameter("Address", registerMetaDatas.Address));
                prms.Add(new SqlParameter("PhoneNumber", registerMetaDatas.PhoneNumber));
                prms.Add(new SqlParameter("MobileNumber", registerMetaDatas.MobileNumber));
                prms.Add(new SqlParameter("Email", registerMetaDatas.Email));
                prms.Add(new SqlParameter("Password", registerMetaDatas.Password));
                prms.Add(new SqlParameter("IsActive", registerMetaDatas.IsActive));
                prms.Add(new SqlParameter("Mode", registerMetaDatas.Mode));
                prms.Add(new SqlParameter("CreatedBy", registerMetaDatas.CreatedBy));
                prms.Add(new SqlParameter("CreatedOn", DateTime.Now));
                prms.Add(new SqlParameter("Latitude", registerMetaDatas.Latitude));
                prms.Add(new SqlParameter("Longitude", registerMetaDatas.Longitude));
                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_Register", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public RegisterMetaData SavePhoneNumber(string phoneNumber)
        {
            DataSet result = null;
            List<SqlParameter> prms = null;
            RegisterMetaData registerMetaDatas = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
                registerMetaDatas = new RegisterMetaData();

                //SqlParameter sqlParameter = new SqlParameter("@responsemessage", 0);
                //sqlParameter.Direction = ParameterDirection.Output;
                //sqlParameter.DbType = DbType.Int32;
                //prms.Add(sqlParameter);

                prms.Add(new SqlParameter("PhoneNumber", phoneNumber));
                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_Register_MobileNumber", prms.ToArray());
                if(result.Tables.Count>0)
                {
                    registerMetaDatas = result.Tables[0].ToListNullableTypes<RegisterMetaData>().FirstOrDefault();
                }
                return registerMetaDatas;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
