using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class PromotionLocationDLL
    {
        /// <summary>
        /// Get ALL PromotionLocation
        /// </summary>
        /// <param name="tID"></param>
        /// <returns></returns>
        public List<PromotionLocationMetaData> GetAllPromotionLocation(int tID = 0)
        {
            DataSet result = null;
			List<PromotionLocationMetaData> promotionlocationMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("TID", tID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_PromotionLocation_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    promotionlocationMetaDatas = result.Tables[0].ToListNullableTypes<PromotionLocationMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return promotionlocationMetaDatas;
        }

        /// <summary>
        /// Get PromotionLocation by TID
        /// </summary>
        /// <param name="tID"></param>
        /// <returns></returns>
        public PromotionLocationMetaData GetPromotionLocationbyId(int tID = 0)
        {
            PromotionLocationMetaData promotionlocationMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("TID", tID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_PromotionLocation_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    promotionlocationMetaDatas = result.Tables[0].ToListNullableTypes<PromotionLocationMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return promotionlocationMetaDatas;
        }

        /// <summary>
        /// PromotionLocation DML Opearation
        /// </summary>
        /// <param name="promotionlocationMetaDatas"></param>
        /// <returns></returns>
        public DataSet PromotionLocationDML(PromotionLocationMetaData promotionlocationMetaDatas)
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

				prms.Add(new SqlParameter("TID", promotionlocationMetaDatas.TID));
				prms.Add(new SqlParameter("PromotionID", promotionlocationMetaDatas.PromotionID));
				prms.Add(new SqlParameter("LocationID", promotionlocationMetaDatas.LocationID));
				prms.Add(new SqlParameter("Mode", promotionlocationMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_PromotionLocation_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

