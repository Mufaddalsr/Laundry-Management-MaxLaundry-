using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class PromotionsDLL
    {
        /// <summary>
        /// Get ALL Promotions
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<PromotionsMetaData> GetAllPromotions(int id = 0)
        {
            DataSet result = null;
			List<PromotionsMetaData> promotionsMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Promotions_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    promotionsMetaDatas = result.Tables[0].ToListNullableTypes<PromotionsMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return promotionsMetaDatas;
        }

        /// <summary>
        /// Get Promotions by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public PromotionsMetaData GetPromotionsbyId(int id = 0)
        {
            PromotionsMetaData promotionsMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Promotions_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    promotionsMetaDatas = result.Tables[0].ToListNullableTypes<PromotionsMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return promotionsMetaDatas;
        }

        /// <summary>
        /// Promotions DML Opearation
        /// </summary>
        /// <param name="promotionsMetaDatas"></param>
        /// <returns></returns>
        public DataSet PromotionsDML(PromotionsMetaData promotionsMetaDatas)
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

				prms.Add(new SqlParameter("ID", promotionsMetaDatas.ID));
				prms.Add(new SqlParameter("PromoCode", promotionsMetaDatas.PromoCode));
				prms.Add(new SqlParameter("PromoName", promotionsMetaDatas.PromoName));
				prms.Add(new SqlParameter("StartDate", promotionsMetaDatas.StartDate));
				prms.Add(new SqlParameter("EndDate", promotionsMetaDatas.EndDate));
				prms.Add(new SqlParameter("PromoType", promotionsMetaDatas.PromoType));
				prms.Add(new SqlParameter("ApplicableAfter", promotionsMetaDatas.ApplicableAfter));
				prms.Add(new SqlParameter("DiscountPer", promotionsMetaDatas.DiscountPer));
				prms.Add(new SqlParameter("CompanyID", promotionsMetaDatas.CompanyID));
				prms.Add(new SqlParameter("Mode", promotionsMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_Promotions_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

