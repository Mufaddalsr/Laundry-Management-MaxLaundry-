using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace LaundryWeb_DLL
{
    public class BookingDLL
    {
        /// <summary>
        /// GetAllBooking
        /// </summary>
        /// <param name="customerId"></param>
        /// <returns></returns>
        public List<BookingMetaData>GetAllBooking(Int64 customerId)
        {
            List<BookingMetaData> bookingMetaDatas = null;
            List<SqlParameter> prms = null;
            DataSet result = null;
            try
            {
                bookingMetaDatas = new List<BookingMetaData>();
                prms = new List<SqlParameter>();
                result = new DataSet();
                prms.Add(new SqlParameter("CustomerId",customerId));
                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Booking_GetAll", prms.ToArray());
                if(result.Tables.Count > 0)
                {
                    bookingMetaDatas = result.Tables[0].ToListNullableTypes<BookingMetaData>();
                }
                return bookingMetaDatas;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// BookingDML
        /// </summary>
        /// <param name="bookingMetaDatas"></param>
        /// <returns></returns>
        public DataSet BookingDML(BookingMetaData bookingMetaDatas)
        {
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
                SqlParameter sqlParameter = new SqlParameter("@responsemessage",0);
                sqlParameter.Direction = ParameterDirection.Output;
                sqlParameter.DbType = DbType.Int32;
                prms.Add(sqlParameter);                                                           

                prms.Add(new SqlParameter("BookingId", bookingMetaDatas.BookingId));
                prms.Add(new SqlParameter("CustomerId", bookingMetaDatas.CustomerId));
                prms.Add(new SqlParameter("NumberOfGarment", bookingMetaDatas.NumberOfGarment));
                prms.Add(new SqlParameter("TimeSlot", bookingMetaDatas.TimeSlot));
                prms.Add(new SqlParameter("BookingDate", bookingMetaDatas.BookingDate));
                prms.Add(new SqlParameter("Mode", bookingMetaDatas.Mode));
                prms.Add(new SqlParameter("CreatedBy", bookingMetaDatas.CreatedBy));
                prms.Add(new SqlParameter("CreatedOn", DateTime.Now));
                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_booking_DML", prms.ToArray());
                return result;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
