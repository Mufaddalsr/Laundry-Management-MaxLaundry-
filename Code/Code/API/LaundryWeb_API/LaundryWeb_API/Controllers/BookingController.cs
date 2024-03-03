using LaundryWeb_DLL;
using LaundryWeb_MetaData;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Net;

namespace LaundryWeb_API.Controllers
{
    [Produces("application/json")]
    [Route("api/Booking")]
    public class BookingController : ControllerBase
    {

        // GET: api/Booking/5
        [HttpGet("{customerId}")]
        public IActionResult Get(string customerId)
        {
            BookingDLL bookingDLL = null;
            List<BookingMetaData> bookingMetaDatas = null;
            try
            {
                bookingDLL = new BookingDLL();
                bookingMetaDatas = new List<BookingMetaData>();
                Int64 ID = Convert.ToInt64(customerId);
                 bookingMetaDatas = bookingDLL.GetAllBooking(ID);
                if (bookingMetaDatas != null)
                {
                    return Ok(bookingMetaDatas);
                }
                else
                {
                    return NoContent();
                }
            }
            catch (Exception ex)
            {
                return Ok(new
                {
                    statusCode=HttpStatusCode.InternalServerError,
                    success=false,
                    errormessage = ex.Message
                });
            }
        }

        // POST: api/Booking
        [HttpPost]
        public IActionResult Post([FromBody] BookingMetaData bookingMetaDatas)
        {
            DataSet result = null;
            BookingDLL bookingDLL = null;

            try
            {
                result = new DataSet();
                bookingDLL = new BookingDLL();
                bookingMetaDatas.Mode = 1;
                bookingMetaDatas.CustomerId = Convert.ToInt64(bookingMetaDatas.IDString);
                result = bookingDLL.BookingDML(bookingMetaDatas);
                if(Convert.ToInt32(result.Tables[1].Rows[0][1]) == 4)
                {
                    return Ok(new
                    {
                        statusCode = HttpStatusCode.OK,
                        success = "alreadyBook",
                        message="Your booking is already booked on this date."
                    });
                }
                else
                {
                    if(Convert.ToInt32(result.Tables[1].Rows[0][1])>0)
                    {
                        return Ok(new
                        {
                            statusCode = HttpStatusCode.OK,
                            success = true,
                            data = Convert.ToInt32(result.Tables[1].Rows[0][1])
                        });
                    }
                    else
                    {
                        return Ok(new
                        {
                            statusCode = HttpStatusCode.InternalServerError,
                            success = false,
                            data = 0
                        });
                    }
                }
            }
            catch (Exception ex)
            {
                return Ok(new
                {
                    statusCode = HttpStatusCode.InternalServerError,
                    success = false,
                    errormessage = ex.Message
                });
            }
        }
    }
}
