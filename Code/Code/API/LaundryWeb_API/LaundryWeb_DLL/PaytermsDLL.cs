using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class PaytermsDLL
    {
        /// <summary>
        /// Get ALL Payterms
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<PaytermsMetaData> GetAllPayterms(int id = 0)
        {
            DataSet result = null;
			List<PaytermsMetaData> paytermsMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Payterms_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    paytermsMetaDatas = result.Tables[0].ToListNullableTypes<PaytermsMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return paytermsMetaDatas;
        }

        /// <summary>
        /// Get Payterms by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public PaytermsMetaData GetPaytermsbyId(int id = 0)
        {
            PaytermsMetaData paytermsMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Payterms_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    paytermsMetaDatas = result.Tables[0].ToListNullableTypes<PaytermsMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return paytermsMetaDatas;
        }

        /// <summary>
        /// Payterms DML Opearation
        /// </summary>
        /// <param name="paytermsMetaDatas"></param>
        /// <returns></returns>
        public DataSet PaytermsDML(PaytermsMetaData paytermsMetaDatas)
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

				prms.Add(new SqlParameter("ID", paytermsMetaDatas.ID));
				prms.Add(new SqlParameter("PaytermName", paytermsMetaDatas.PaytermName));
				prms.Add(new SqlParameter("PayAfter", paytermsMetaDatas.PayAfter));
				prms.Add(new SqlParameter("isActive", paytermsMetaDatas.isActive));
				prms.Add(new SqlParameter("Mode", paytermsMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_Payterms_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

