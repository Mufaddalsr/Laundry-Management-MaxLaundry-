using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class RFIDReadersDLL
    {
        /// <summary>
        /// Get ALL RFIDReaders
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<RFIDReadersMetaData> GetAllRFIDReaders(int id = 0)
        {
            DataSet result = null;
			List<RFIDReadersMetaData> rfidreadersMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_RFIDReaders_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    rfidreadersMetaDatas = result.Tables[0].ToListNullableTypes<RFIDReadersMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return rfidreadersMetaDatas;
        }

        /// <summary>
        /// Get RFIDReaders by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public RFIDReadersMetaData GetRFIDReadersbyId(int id = 0)
        {
            RFIDReadersMetaData rfidreadersMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_RFIDReaders_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    rfidreadersMetaDatas = result.Tables[0].ToListNullableTypes<RFIDReadersMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return rfidreadersMetaDatas;
        }

        /// <summary>
        /// RFIDReaders DML Opearation
        /// </summary>
        /// <param name="rfidreadersMetaDatas"></param>
        /// <returns></returns>
        public DataSet RFIDReadersDML(RFIDReadersMetaData rfidreadersMetaDatas)
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

				prms.Add(new SqlParameter("ID", rfidreadersMetaDatas.ID));
				prms.Add(new SqlParameter("ReaderCode", rfidreadersMetaDatas.ReaderCode));
				prms.Add(new SqlParameter("IPAddress", rfidreadersMetaDatas.IPAddress));
				prms.Add(new SqlParameter("AN1", rfidreadersMetaDatas.AN1));
				prms.Add(new SqlParameter("AN2", rfidreadersMetaDatas.AN2));
				prms.Add(new SqlParameter("AN3", rfidreadersMetaDatas.AN3));
				prms.Add(new SqlParameter("AN4", rfidreadersMetaDatas.AN4));
				prms.Add(new SqlParameter("ReaderType", rfidreadersMetaDatas.ReaderType));
				prms.Add(new SqlParameter("LocationID", rfidreadersMetaDatas.LocationID));
				prms.Add(new SqlParameter("CompanyID", rfidreadersMetaDatas.CompanyID));
				prms.Add(new SqlParameter("isActive", rfidreadersMetaDatas.isActive));
				prms.Add(new SqlParameter("Mode", rfidreadersMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_RFIDReaders_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

