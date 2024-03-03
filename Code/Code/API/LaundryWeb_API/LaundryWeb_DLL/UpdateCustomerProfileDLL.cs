using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;


namespace LaundryWeb_DLL
{
    public class UpdateCustomerProfileDLL
    {
        /// <summary>
        /// updateCustomerProfileMetaDatas Opearation
        /// </summary>
        /// <param name="updateCustomerProfileMetaDatas"></param>
        /// <returns></returns>
        public DataSet UpdateProfile(UpdateCustomerProfileMetaData updateCustomerProfileMetaDatas)
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

                prms.Add(new SqlParameter("ID", updateCustomerProfileMetaDatas.ID));
                prms.Add(new SqlParameter("FullName", updateCustomerProfileMetaDatas.FullName));
                prms.Add(new SqlParameter("Address", updateCustomerProfileMetaDatas.Address));
                prms.Add(new SqlParameter("PhoneNumber", updateCustomerProfileMetaDatas.PhoneNumber));
                prms.Add(new SqlParameter("MobileNumber", updateCustomerProfileMetaDatas.MobileNumber));
                prms.Add(new SqlParameter("CreatedOn", DateTime.Now));
                prms.Add(new SqlParameter("CreatedBy", updateCustomerProfileMetaDatas.CreatedBy));
                prms.Add(new SqlParameter("Email", updateCustomerProfileMetaDatas.Email));
                prms.Add(new SqlParameter("Mode", updateCustomerProfileMetaDatas.Mode));
                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_UpdateCustomerProfile", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
