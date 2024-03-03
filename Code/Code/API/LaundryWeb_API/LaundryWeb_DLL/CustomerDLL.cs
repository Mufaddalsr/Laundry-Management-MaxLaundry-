using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class CustomerDLL
    {
        /// <summary>
        /// Get ALL Customer
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<CustomerMetaData> GetAllCustomer(Int64 id = 0)
        {
            DataSet result = null;
			List<CustomerMetaData> customerMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Customer_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    customerMetaDatas = result.Tables[0].ToListNullableTypes<CustomerMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return customerMetaDatas;
        }

        /// <summary>
        /// Get Customer by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public CustomerMetaData GetCustomerbyId(Int64 id = 0)
        {
            CustomerMetaData customerMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Customer_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    customerMetaDatas = result.Tables[0].ToListNullableTypes<CustomerMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return customerMetaDatas;
        }

        /// <summary>
        /// Customer DML Opearation
        /// </summary>
        /// <param name="customerMetaDatas"></param>
        /// <returns></returns>
        public DataSet CustomerDML(CustomerMetaData customerMetaDatas)
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

				prms.Add(new SqlParameter("ID", customerMetaDatas.ID));
				prms.Add(new SqlParameter("CustomerID", customerMetaDatas.CustomerID));
				prms.Add(new SqlParameter("FullName", customerMetaDatas.FullName));
				prms.Add(new SqlParameter("Address", customerMetaDatas.Address));
				prms.Add(new SqlParameter("Landmark", customerMetaDatas.Landmark));
				prms.Add(new SqlParameter("PhoneNumber", customerMetaDatas.PhoneNumber));
				prms.Add(new SqlParameter("MobileNumber", customerMetaDatas.MobileNumber));
				prms.Add(new SqlParameter("Attn", customerMetaDatas.Attn));
				prms.Add(new SqlParameter("AccountType", customerMetaDatas.AccountType));
				prms.Add(new SqlParameter("Phone1", customerMetaDatas.Phone1));
				prms.Add(new SqlParameter("Phone2", customerMetaDatas.Phone2));
				prms.Add(new SqlParameter("Phone3", customerMetaDatas.Phone3));
				prms.Add(new SqlParameter("Phone4", customerMetaDatas.Phone4));
				prms.Add(new SqlParameter("Phone5", customerMetaDatas.Phone5));
				prms.Add(new SqlParameter("CustomerCode", customerMetaDatas.CustomerCode));
				prms.Add(new SqlParameter("CreatedOn", customerMetaDatas.CreatedOn));
				prms.Add(new SqlParameter("CreatedBy", customerMetaDatas.CreatedBy));
				prms.Add(new SqlParameter("CompanyID", customerMetaDatas.CompanyID));
				prms.Add(new SqlParameter("isActive", customerMetaDatas.isActive));
				prms.Add(new SqlParameter("Email", customerMetaDatas.Email));
				prms.Add(new SqlParameter("CorpID", customerMetaDatas.CorpID));
				prms.Add(new SqlParameter("isSync", customerMetaDatas.isSync));
				prms.Add(new SqlParameter("Mode", customerMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_Customer_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

