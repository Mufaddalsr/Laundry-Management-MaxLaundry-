using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class OrdersDLL
    {
        /// <summary>
        /// Get ALL Orders
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<OrdersMetaData> GetAllOrders(string id = null)
        {
            DataSet result = null;
			List<OrdersMetaData> ordersMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Orders_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    ordersMetaDatas = result.Tables[0].ToListNullableTypes<OrdersMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ordersMetaDatas;
        }

        /// <summary>
        /// Get Orders by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public OrdersMetaData GetOrdersbyId(string id = null)
        {
            OrdersMetaData ordersMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Orders_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    ordersMetaDatas = result.Tables[0].ToListNullableTypes<OrdersMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ordersMetaDatas;
        }

        /// <summary>
        /// Orders DML Opearation
        /// </summary>
        /// <param name="ordersMetaDatas"></param>
        /// <returns></returns>
        public DataSet OrdersDML(OrdersMetaData ordersMetaDatas)
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

				prms.Add(new SqlParameter("ID", ordersMetaDatas.ID));
				prms.Add(new SqlParameter("OrderDate", ordersMetaDatas.OrderDate));
				prms.Add(new SqlParameter("CustomerID", ordersMetaDatas.CustomerID));
				prms.Add(new SqlParameter("DeliverBy", ordersMetaDatas.DeliverBy));
				prms.Add(new SqlParameter("isCancelled", ordersMetaDatas.isCancelled));
				prms.Add(new SqlParameter("isPaid", ordersMetaDatas.isPaid));
				prms.Add(new SqlParameter("CompanyID", ordersMetaDatas.CompanyID));
				prms.Add(new SqlParameter("Status", ordersMetaDatas.Status));
				prms.Add(new SqlParameter("isHang", ordersMetaDatas.isHang));
				prms.Add(new SqlParameter("Comments", ordersMetaDatas.Comments));
				prms.Add(new SqlParameter("LocationID", ordersMetaDatas.LocationID));
				prms.Add(new SqlParameter("PromoApplied", ordersMetaDatas.PromoApplied));
				prms.Add(new SqlParameter("Discount", ordersMetaDatas.Discount));
				prms.Add(new SqlParameter("DoEmail", ordersMetaDatas.DoEmail));
				prms.Add(new SqlParameter("SubTotal", ordersMetaDatas.SubTotal));
				prms.Add(new SqlParameter("VATAmount", ordersMetaDatas.VATAmount));
				prms.Add(new SqlParameter("GrandTotal", ordersMetaDatas.GrandTotal));
				prms.Add(new SqlParameter("Balance", ordersMetaDatas.Balance));
				prms.Add(new SqlParameter("isExpress", ordersMetaDatas.isExpress));
				prms.Add(new SqlParameter("isSync", ordersMetaDatas.isSync));
				prms.Add(new SqlParameter("Mode", ordersMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_Orders_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

