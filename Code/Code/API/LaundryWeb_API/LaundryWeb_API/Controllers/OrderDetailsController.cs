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
    [Route("api/OrderDetails")]
    public class OrderDetailsController : Controller
    {
        #region Get All OrderDetails
        [HttpGet]
        public IActionResult Get()
        {
            List<OrderDetailsMetaData> orderDetailMetaDatas = null;
            OrderDetailsDLL orderDetailDLL = null;
            string tID = null;
            try
            {
                orderDetailDLL = new OrderDetailsDLL();

                orderDetailMetaDatas = orderDetailDLL.GetAllOrderDetails(tID);
                if (orderDetailMetaDatas.Count >= 0)
                {
                    return Ok(orderDetailMetaDatas);
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

        #region Get OrderDetails Data By Id
        // GET: api/OrderDetails/5
        [HttpGet("{tID}")]
        public IActionResult Get(string tID = null)
        {
            OrderDetailsDLL orderDetailDLL = null;
            OrderDetailsMetaData orderDetailMetaDatas = null;
            try
            {
                orderDetailDLL = new OrderDetailsDLL();

                orderDetailMetaDatas = orderDetailDLL.GetOrderDetailsbyId(tID);
                if (orderDetailMetaDatas != null)
                {
                    return Ok(orderDetailMetaDatas);
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

        #region Add New OrderDetails
        [HttpPost]
        public IActionResult Post([FromBody] OrderDetailsMetaData orderDetailMetaDatas)
        {
            DataSet result = null;
            OrderDetailsDLL orderDetailDLL = null;
            try
            {
                orderDetailDLL = new OrderDetailsDLL();
                result = new DataSet();

                orderDetailMetaDatas.Mode = 1;
                result = orderDetailDLL.OrderDetailsDML(orderDetailMetaDatas);

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

        #region Update OrderDetail data
        // PUT: api/OrderDetails/5
        [HttpPut]
        public IActionResult Put([FromBody] OrderDetailsMetaData orderDetailMetaDatas)
        {
            DataSet result = null;
            OrderDetailsDLL orderDetailDLL = null;
            try
            {
                orderDetailDLL = new OrderDetailsDLL();
                result = new DataSet();

                orderDetailMetaDatas.Mode = 2;
                result = orderDetailDLL.OrderDetailsDML(orderDetailMetaDatas);

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

        #region Delete OrderDetails
        [HttpDelete]
        public IActionResult Delete(string tID = null)
        {
            DataSet result = null;
            OrderDetailsDLL orderDetailDLL = null;
            OrderDetailsMetaData orderDetailMetaDatas = null;
            try
            {
                orderDetailDLL = new OrderDetailsDLL();
                result = new DataSet();
                orderDetailMetaDatas = new OrderDetailsMetaData();

                orderDetailMetaDatas.TID = tID;
                orderDetailMetaDatas.Mode = 3;
                result = orderDetailDLL.OrderDetailsDML(orderDetailMetaDatas);

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