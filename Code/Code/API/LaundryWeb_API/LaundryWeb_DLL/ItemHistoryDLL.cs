using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class ItemHistoryDLL
    {
        /// <summary>
        /// Get ALL ItemHistory
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<ItemHistoryMetaData> GetAllItemHistory(int id = 0)
        {
            DataSet result = null;
			List<ItemHistoryMetaData> itemhistoryMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_ItemHistory_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    itemhistoryMetaDatas = result.Tables[0].ToListNullableTypes<ItemHistoryMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return itemhistoryMetaDatas;
        }

        /// <summary>
        /// Get ItemHistory by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ItemHistoryMetaData GetItemHistorybyId(int id = 0)
        {
            ItemHistoryMetaData itemhistoryMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_ItemHistory_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    itemhistoryMetaDatas = result.Tables[0].ToListNullableTypes<ItemHistoryMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return itemhistoryMetaDatas;
        }

        /// <summary>
        /// ItemHistory DML Opearation
        /// </summary>
        /// <param name="itemhistoryMetaDatas"></param>
        /// <returns></returns>
        public DataSet ItemHistoryDML(ItemHistoryMetaData itemhistoryMetaDatas)
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

				prms.Add(new SqlParameter("ID", itemhistoryMetaDatas.ID));
				prms.Add(new SqlParameter("ItemID", itemhistoryMetaDatas.ItemID));
				prms.Add(new SqlParameter("LocationID", itemhistoryMetaDatas.LocationID));
				prms.Add(new SqlParameter("TStamp", itemhistoryMetaDatas.TStamp));
				prms.Add(new SqlParameter("BatchID", itemhistoryMetaDatas.BatchID));
				prms.Add(new SqlParameter("Description", itemhistoryMetaDatas.Description));
				prms.Add(new SqlParameter("isSync", itemhistoryMetaDatas.isSync));
				prms.Add(new SqlParameter("Mode", itemhistoryMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_ItemHistory_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

