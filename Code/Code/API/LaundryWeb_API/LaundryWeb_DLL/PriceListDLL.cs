using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace LaundryWeb_DLL
{
    public class PriceListDLL
    {
        /// <summary>
        /// GetAllPriceList
        /// </summary>
        /// <param name="customerId"></param>
        /// <returns></returns>
        public DataSet GetAllPriceList(Int64 customerId)
        {
            List<PriceListMetaData> priceListMetaDatas = null;
            List<SqlParameter> prms = null;
            DataSet result = null;
            try
            {
                priceListMetaDatas = new List<PriceListMetaData>();
                prms = new List<SqlParameter>();
                result = new DataSet();
                prms.Add(new SqlParameter("CustomerId", customerId));
                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_PriceList", prms.ToArray());
                //if (result.Tables.Count > 0)
                //{
                  
                //}
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
