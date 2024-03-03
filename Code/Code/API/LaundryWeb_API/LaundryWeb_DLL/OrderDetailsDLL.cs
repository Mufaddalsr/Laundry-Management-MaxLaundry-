using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class OrderDetailsDLL
    {
        /// <summary>
        /// Get ALL OrderDetails
        /// </summary>
        /// <param name="tID"></param>
        /// <returns></returns>
        public List<OrderDetailsMetaData> GetAllOrderDetails(string tID = null)
        {
            DataSet result = null;
			List<OrderDetailsMetaData> orderdetailsMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("TID", tID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_OrderDetails_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    orderdetailsMetaDatas = result.Tables[0].ToListNullableTypes<OrderDetailsMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return orderdetailsMetaDatas;
        }

        /// <summary>
        /// Get OrderDetails by TID
        /// </summary>
        /// <param name="tID"></param>
        /// <returns></returns>
        public OrderDetailsMetaData GetOrderDetailsbyId(string tID = null)
        {
            OrderDetailsMetaData orderdetailsMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("TID", tID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_OrderDetails_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    orderdetailsMetaDatas = result.Tables[0].ToListNullableTypes<OrderDetailsMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return orderdetailsMetaDatas;
        }

        /// <summary>
        /// OrderDetails DML Opearation
        /// </summary>
        /// <param name="orderdetailsMetaDatas"></param>
        /// <returns></returns>
        public DataSet OrderDetailsDML(OrderDetailsMetaData orderdetailsMetaDatas)
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

				prms.Add(new SqlParameter("TID", orderdetailsMetaDatas.TID));
				prms.Add(new SqlParameter("OrderID", orderdetailsMetaDatas.OrderID));
				prms.Add(new SqlParameter("GarmentID", orderdetailsMetaDatas.GarmentID));
				prms.Add(new SqlParameter("ServiceID", orderdetailsMetaDatas.ServiceID));
				prms.Add(new SqlParameter("Qty", orderdetailsMetaDatas.Qty));
				prms.Add(new SqlParameter("Total", orderdetailsMetaDatas.Total));
				prms.Add(new SqlParameter("Status", orderdetailsMetaDatas.Status));
				prms.Add(new SqlParameter("DeliveredOn", orderdetailsMetaDatas.DeliveredOn));
				prms.Add(new SqlParameter("LineID", orderdetailsMetaDatas.LineID));
				prms.Add(new SqlParameter("Mode", orderdetailsMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_OrderDetails_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

