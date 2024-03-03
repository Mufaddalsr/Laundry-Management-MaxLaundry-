using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class CorporateAccountDLL
    {
        /// <summary>
        /// Get ALL CorporateAccount
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<CorporateAccountMetaData> GetAllCorporateAccount(int id = 0)
        {
            DataSet result = null;
			List<CorporateAccountMetaData> corporateaccountMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_CorporateAccount_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    corporateaccountMetaDatas = result.Tables[0].ToListNullableTypes<CorporateAccountMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return corporateaccountMetaDatas;
        }

        /// <summary>
        /// Get CorporateAccount by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public CorporateAccountMetaData GetCorporateAccountbyId(int id = 0)
        {
            CorporateAccountMetaData corporateaccountMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_CorporateAccount_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    corporateaccountMetaDatas = result.Tables[0].ToListNullableTypes<CorporateAccountMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return corporateaccountMetaDatas;
        }

        /// <summary>
        /// CorporateAccount DML Opearation
        /// </summary>
        /// <param name="corporateaccountMetaDatas"></param>
        /// <returns></returns>
        public DataSet CorporateAccountDML(CorporateAccountMetaData corporateaccountMetaDatas)
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

				prms.Add(new SqlParameter("ID", corporateaccountMetaDatas.ID));
				prms.Add(new SqlParameter("CorporateCode", corporateaccountMetaDatas.CorporateCode));
				prms.Add(new SqlParameter("CorpName", corporateaccountMetaDatas.CorpName));
				prms.Add(new SqlParameter("PaymentTerms", corporateaccountMetaDatas.PaymentTerms));
				prms.Add(new SqlParameter("AccountStart", corporateaccountMetaDatas.AccountStart));
				prms.Add(new SqlParameter("CreatedOn", corporateaccountMetaDatas.CreatedOn));
				prms.Add(new SqlParameter("CreatedBy", corporateaccountMetaDatas.CreatedBy));
				prms.Add(new SqlParameter("isActive", corporateaccountMetaDatas.isActive));
				prms.Add(new SqlParameter("Mode", corporateaccountMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_CorporateAccount_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

