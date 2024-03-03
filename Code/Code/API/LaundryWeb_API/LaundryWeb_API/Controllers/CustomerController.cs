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
    [Route("api/Customer")]
    public class CustomerController : Controller
    {
        #region Get All Customer
        [HttpGet]
        public IActionResult Get()
        {
            List<CustomerMetaData> customerMetaDatas = null;
            CustomerDLL customerDLL = null;
            Int64 id = 0;
            try
            {
                customerDLL = new CustomerDLL();

                customerMetaDatas = customerDLL.GetAllCustomer(id);
                if (customerMetaDatas.Count >= 0)
                {
                    return Ok(customerMetaDatas);
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

        #region Get Customer Data By Id
        // GET: api/Customer/5
        [HttpGet("{id}")]
        public IActionResult Get(Int64 id = 0)
        {
            CustomerDLL customerDLL = null;
            CustomerMetaData customerMetaDatas = null;
            try
            {
                customerDLL = new CustomerDLL();

                customerMetaDatas = customerDLL.GetCustomerbyId(id);
                if (customerMetaDatas != null)
                {
                    return Ok(customerMetaDatas);
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

        #region Add New Customer
        [HttpPost]
        public IActionResult Post([FromBody] CustomerMetaData customerMetaDatas)
        {
            DataSet result = null;
            CustomerDLL customerDLL = null;
            try
            {
                customerDLL = new CustomerDLL();
                result = new DataSet();
                
                customerMetaDatas.Mode = 1;
                result = customerDLL.CustomerDML(customerMetaDatas);

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

        #region Update Customer data
        // PUT: api/Customer/5
        [HttpPut]
        public IActionResult Put([FromBody] CustomerMetaData customerMetaDatas)
        {
            DataSet result = null;
            CustomerDLL customerDLL = null;
            try
            {
                customerDLL = new CustomerDLL();
                result = new DataSet();

                customerMetaDatas.Mode = 2;
                result = customerDLL.CustomerDML(customerMetaDatas);

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

        #region Delete Customer
        [HttpDelete]
        public IActionResult Delete(Int64 id = 0)
        {
            DataSet result = null;
            CustomerDLL customerDLL = null;
            CustomerMetaData customerMetaDatas = null;
            try
            {
                customerDLL = new CustomerDLL();
                result = new DataSet();
                customerMetaDatas = new CustomerMetaData();

                customerMetaDatas.ID = id;
                customerMetaDatas.Mode = 3;
                result = customerDLL.CustomerDML(customerMetaDatas);

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