using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LaundryWeb_DLL
{
    public class InvoiceDLL
    {
        /// <summary>
        /// GetAllPriceList
        /// </summary>
        /// <param name="customerId"></param>
        /// <returns></returns>
        public List<InvoiceMetaData> GetAllInvoiceList(Int64 customerId)
        {
            List<InvoiceMetaData> InvoiceMetaDatas = null;
            List<SqlParameter> prms = null;
            DataSet result = null;
            try
            {
                InvoiceMetaDatas = new List<InvoiceMetaData>();
                prms = new List<SqlParameter>();
                result = new DataSet();
                prms.Add(new SqlParameter("CustomerId", customerId));
                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Invoice", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    InvoiceMetaDatas = result.Tables[0].ToListNullableTypes<InvoiceMetaData>();
                }
                return InvoiceMetaDatas;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
