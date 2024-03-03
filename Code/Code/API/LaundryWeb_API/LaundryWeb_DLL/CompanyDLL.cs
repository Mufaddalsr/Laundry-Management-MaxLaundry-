using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class CompanyDLL
    {
        /// <summary>
        /// Get ALL Company
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<CompanyMetaData> GetAllCompany(int id = 0)
        {
            DataSet result = null;
			List<CompanyMetaData> companyMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Company_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    companyMetaDatas = result.Tables[0].ToListNullableTypes<CompanyMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return companyMetaDatas;
        }

        /// <summary>
        /// Get Company by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public CompanyMetaData GetCompanybyId(int id = 0)
        {
            CompanyMetaData companyMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Company_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    companyMetaDatas = result.Tables[0].ToListNullableTypes<CompanyMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return companyMetaDatas;
        }

        /// <summary>
        /// Company DML Opearation
        /// </summary>
        /// <param name="companyMetaDatas"></param>
        /// <returns></returns>
        public DataSet CompanyDML(CompanyMetaData companyMetaDatas)
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

				prms.Add(new SqlParameter("ID", companyMetaDatas.ID));
				prms.Add(new SqlParameter("CompanyName", companyMetaDatas.CompanyName));
				prms.Add(new SqlParameter("CompanyCode", companyMetaDatas.CompanyCode));
				prms.Add(new SqlParameter("Address", companyMetaDatas.Address));
				prms.Add(new SqlParameter("PhoneNo", companyMetaDatas.PhoneNo));
				prms.Add(new SqlParameter("FaxNo", companyMetaDatas.FaxNo));
				prms.Add(new SqlParameter("isActive", companyMetaDatas.isActive));
				prms.Add(new SqlParameter("Logo", companyMetaDatas.Logo));
				prms.Add(new SqlParameter("Mode", companyMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_Company_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

