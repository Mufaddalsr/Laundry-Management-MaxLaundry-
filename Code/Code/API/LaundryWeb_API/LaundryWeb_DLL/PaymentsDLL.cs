using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class PaymentsDLL
    {
        /// <summary>
        /// Get ALL Payments
        /// </summary>
        /// <param name="payID"></param>
        /// <returns></returns>
        public List<PaymentsMetaData> GetAllPayments(string payID = null)
        {
            DataSet result = null;
			List<PaymentsMetaData> paymentsMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("PayID", payID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Payments_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    paymentsMetaDatas = result.Tables[0].ToListNullableTypes<PaymentsMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return paymentsMetaDatas;
        }

        /// <summary>
        /// Get Payments by PayID
        /// </summary>
        /// <param name="payID"></param>
        /// <returns></returns>
        public PaymentsMetaData GetPaymentsbyId(string payID = null)
        {
            PaymentsMetaData paymentsMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("PayID", payID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Payments_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    paymentsMetaDatas = result.Tables[0].ToListNullableTypes<PaymentsMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return paymentsMetaDatas;
        }

        /// <summary>
        /// Payments DML Opearation
        /// </summary>
        /// <param name="paymentsMetaDatas"></param>
        /// <returns></returns>
        public DataSet PaymentsDML(PaymentsMetaData paymentsMetaDatas)
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

				prms.Add(new SqlParameter("PayID", paymentsMetaDatas.PayID));
				prms.Add(new SqlParameter("OrderID", paymentsMetaDatas.OrderID));
				prms.Add(new SqlParameter("PayDate", paymentsMetaDatas.PayDate));
				prms.Add(new SqlParameter("Amount", paymentsMetaDatas.Amount));
				prms.Add(new SqlParameter("RecievedBy", paymentsMetaDatas.RecievedBy));
				prms.Add(new SqlParameter("PaymentType", paymentsMetaDatas.PaymentType));
				prms.Add(new SqlParameter("isCancelled", paymentsMetaDatas.isCancelled));
				prms.Add(new SqlParameter("CancelledBy", paymentsMetaDatas.CancelledBy));
				prms.Add(new SqlParameter("CancelledOn", paymentsMetaDatas.CancelledOn));
				prms.Add(new SqlParameter("isSync", paymentsMetaDatas.isSync));
				prms.Add(new SqlParameter("Mode", paymentsMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_Payments_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

