using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class ItemsDLL
    {
        /// <summary>
        /// Get ALL Items
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<ItemsMetaData> GetAllItems(string id = null)
        {
            DataSet result = null;
			List<ItemsMetaData> itemsMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Items_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    itemsMetaDatas = result.Tables[0].ToListNullableTypes<ItemsMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return itemsMetaDatas;
        }

        /// <summary>
        /// Get Items by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ItemsMetaData GetItemsbyId(string id = null)
        {
            ItemsMetaData itemsMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Items_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    itemsMetaDatas = result.Tables[0].ToListNullableTypes<ItemsMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return itemsMetaDatas;
        }

        /// <summary>
        /// Items DML Opearation
        /// </summary>
        /// <param name="itemsMetaDatas"></param>
        /// <returns></returns>
        public DataSet ItemsDML(ItemsMetaData itemsMetaDatas)
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

				prms.Add(new SqlParameter("ID", itemsMetaDatas.ID));
				prms.Add(new SqlParameter("OrderID", itemsMetaDatas.OrderID));
				prms.Add(new SqlParameter("OrderTID", itemsMetaDatas.OrderTID));
				prms.Add(new SqlParameter("TagID", itemsMetaDatas.TagID));
				prms.Add(new SqlParameter("Status", itemsMetaDatas.Status));
				prms.Add(new SqlParameter("TaggedOn", itemsMetaDatas.TaggedOn));
				prms.Add(new SqlParameter("LastSeen", itemsMetaDatas.LastSeen));
				prms.Add(new SqlParameter("LastSeenTime", itemsMetaDatas.LastSeenTime));
				prms.Add(new SqlParameter("LineID", itemsMetaDatas.LineID));
				prms.Add(new SqlParameter("Comments", itemsMetaDatas.Comments));
				prms.Add(new SqlParameter("ItemImage", itemsMetaDatas.ItemImage));
				prms.Add(new SqlParameter("isSync", itemsMetaDatas.isSync));
				prms.Add(new SqlParameter("Mode", itemsMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_Items_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

