using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class CorporateCustomerDLL
    {
        /// <summary>
        /// Get ALL CorporateCustomer
        /// </summary>
        /// <param name="corporateID, customerID"></param>
        /// <returns></returns>
        public List<CorporateCustomerMetaData> GetAllCorporateCustomer(int corporateID = 0,int customerID = 0)
        {
            DataSet result = null;
			List<CorporateCustomerMetaData> corporatecustomerMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("CorporateID", corporateID)); 
				prms.Add(new SqlParameter("CustomerID", customerID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_CorporateCustomer_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    corporatecustomerMetaDatas = result.Tables[0].ToListNullableTypes<CorporateCustomerMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return corporatecustomerMetaDatas;
        }

        /// <summary>
        /// Get CorporateCustomer by CorporateID, CustomerID
        /// </summary>
        /// <param name="corporateID, customerID"></param>
        /// <returns></returns>
        public CorporateCustomerMetaData GetCorporateCustomerbyId(int corporateID = 0, int customerID = 0)
        {
            CorporateCustomerMetaData corporatecustomerMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("CorporateID", corporateID)); 
				prms.Add(new SqlParameter("CustomerID", customerID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_CorporateCustomer_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    corporatecustomerMetaDatas = result.Tables[0].ToListNullableTypes<CorporateCustomerMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return corporatecustomerMetaDatas;
        }

        /// <summary>
        /// CorporateCustomer DML Opearation
        /// </summary>
        /// <param name="corporatecustomerMetaDatas"></param>
        /// <returns></returns>
        public DataSet CorporateCustomerDML(CorporateCustomerMetaData corporatecustomerMetaDatas)
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

				prms.Add(new SqlParameter("CorporateID", corporatecustomerMetaDatas.CorporateID));
				prms.Add(new SqlParameter("CustomerID", corporatecustomerMetaDatas.CustomerID));
				prms.Add(new SqlParameter("Mode", corporatecustomerMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_CorporateCustomer_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

