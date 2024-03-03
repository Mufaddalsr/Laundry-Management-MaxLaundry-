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
    [Route("api/Payments")]
    public class PaymentsController : Controller
    {
        #region Get All Payments
        [HttpGet]
        public IActionResult Get()
        {
            List<PaymentsMetaData> paymentMetaDatas = null;
            PaymentsDLL paymentDLL = null;
            string payID = null;
            try
            {
                paymentDLL = new PaymentsDLL();

                paymentMetaDatas = paymentDLL.GetAllPayments(payID);
                if (paymentMetaDatas.Count >= 0)
                {
                    return Ok(paymentMetaDatas);
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
                    statusCode = HttpStatusCode.InternalServerError,
                    success = false,
                    errorMessage = ex.Message
                });
            }
        }
        #endregion

        #region Get Payments Data By Id
        // GET: api/Payments/5
        [HttpGet("{payID}")]
        public IActionResult Get(string payID = null)
        {
            PaymentsDLL paymentDLL = null;
            PaymentsMetaData paymentMetaDatas = null;
            try
            {
                paymentDLL = new PaymentsDLL();

                paymentMetaDatas = paymentDLL.GetPaymentsbyId(payID);
                if (paymentMetaDatas != null)
                {
                    return Ok(paymentMetaDatas);
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
                    statusCode = HttpStatusCode.InternalServerError,
                    success = false,
                    errorMessage = ex.Message
                });
            }
        }
        #endregion

        #region Add New Payments
        [HttpPost]
        public IActionResult Post([FromBody] PaymentsMetaData paymentMetaDatas)
        {
            DataSet result = null;
            PaymentsDLL paymentDLL = null;
            try
            {
                paymentDLL = new PaymentsDLL();
                result = new DataSet();

                paymentMetaDatas.Mode = 1;
                result = paymentDLL.PaymentsDML(paymentMetaDatas);

                if (Convert.ToInt32(result.Tables[1].Rows[0][1]) > 0)
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
            catch (Exception ex)
            {
                return Ok(new
                {
                    statusCode = HttpStatusCode.InternalServerError,
                    success = false,
                    errorMessage = ex.Message
                });
            }
        }
        #endregion

        #region Update Payments data
        // PUT: api/Payments/5
        [HttpPut]
        public IActionResult Put([FromBody] PaymentsMetaData paymentMetaDatas)
        {
            DataSet result = null;
            PaymentsDLL paymentDLL = null;
            try
            {
                paymentDLL = new PaymentsDLL();
                result = new DataSet();

                paymentMetaDatas.Mode = 2;
                result = paymentDLL.PaymentsDML(paymentMetaDatas);

                if (Convert.ToInt32(result.Tables[1].Rows[0][1]) > 0)
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
            catch (Exception ex)
            {
                return Ok(new
                {
                    statusCode = HttpStatusCode.InternalServerError,
                    success = false,
                    errorMessage = ex.Message
                });
            }
        }
        #endregion

        #region Delete Payments
        [HttpDelete]
        public IActionResult Delete(string payID = null)
        {
            DataSet result = null;
            PaymentsDLL paymentDLL = null;
            PaymentsMetaData paymentMetaDatas = null;
            try
            {
                paymentDLL = new PaymentsDLL();
                result = new DataSet();
                paymentMetaDatas = new PaymentsMetaData();

                paymentMetaDatas.PayID = payID;
                paymentMetaDatas.Mode = 3;
                result = paymentDLL.PaymentsDML(paymentMetaDatas);

                if (Convert.ToInt32(result.Tables[1].Rows[0][1]) > 0)
                {
                    return Ok(new
                    {
                        statusCode = HttpStatusCode.OK,
                        success = true
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
            catch (Exception ex)
            {
                return Ok(new
                {
                    statusCode = HttpStatusCode.InternalServerError,
                    success = false,
                    errorMessage = ex.Message
                });
            }
        }
        #endregion
    }
}