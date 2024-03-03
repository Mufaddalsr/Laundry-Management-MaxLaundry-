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
    [Route("api/Orders")]
    public class OrdersController : Controller
    {
        #region Get All Orders
        [HttpGet]
        public IActionResult Get()
        {
            List<OrdersMetaData> orderMetaDatas = null;
            OrdersDLL orderDLL = null;
            string id = null;
            try
            {
                orderDLL = new OrdersDLL();

                orderMetaDatas = orderDLL.GetAllOrders(id);
                if (orderMetaDatas.Count >= 0)
                {
                    return Ok(orderMetaDatas);
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

        #region Get Orders Data By Id
        // GET: api/Orders/5
        [HttpGet("{id}")]
        public IActionResult Get(string id = null)
        {
            OrdersDLL orderDLL = null;
            OrdersMetaData orderMetaDatas = null;
            try
            {
                orderDLL = new OrdersDLL();

                orderMetaDatas = orderDLL.GetOrdersbyId(id);
                if (orderMetaDatas != null)
                {
                    return Ok(orderMetaDatas);
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

        #region Add New Orders
        [HttpPost]
        public IActionResult Post([FromBody] OrdersMetaData orderMetaDatas)
        {
            DataSet result = null;
            OrdersDLL orderDLL = null;
            try
            {
                orderDLL = new OrdersDLL();
                result = new DataSet();

                orderMetaDatas.Mode = 1;
                result = orderDLL.OrdersDML(orderMetaDatas);

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

        #region Update Orders data
        // PUT: api/Orders/5
        [HttpPut]
        public IActionResult Put([FromBody] OrdersMetaData orderMetaDatas)
        {
            DataSet result = null;
            OrdersDLL orderDLL = null;
            try
            {
                orderDLL = new OrdersDLL();
                result = new DataSet();

                orderMetaDatas.Mode = 2;
                result = orderDLL.OrdersDML(orderMetaDatas);

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

        #region Delete Orders
        [HttpDelete]
        public IActionResult Delete(string id = null)
        {
            DataSet result = null;
            OrdersDLL orderDLL = null;
            OrdersMetaData orderMetaDatas = null;
            try
            {
                orderDLL = new OrdersDLL();
                result = new DataSet();
                orderMetaDatas = new OrdersMetaData();

                orderMetaDatas.ID = id;
                orderMetaDatas.Mode = 3;
                result = orderDLL.OrdersDML(orderMetaDatas);

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