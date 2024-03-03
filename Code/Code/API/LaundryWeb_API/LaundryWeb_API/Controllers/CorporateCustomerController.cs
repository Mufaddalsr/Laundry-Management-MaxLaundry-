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
    [Route("api/CorporateCustomer")]
    public class CorporateCustomerController : Controller
    {
        #region Get All CorporateCustomer
        [HttpGet]
        public IActionResult Get()
        {
            List<CorporateCustomerMetaData> corporateCustomerMetaDatas = null;
            CorporateCustomerDLL corporateCustomerDLL = null;
            int corporateID = 0;
            int customerID = 0;
            try
            {
                corporateCustomerDLL = new CorporateCustomerDLL();

                corporateCustomerMetaDatas = corporateCustomerDLL.GetAllCorporateCustomer(corporateID, customerID);
                if (corporateCustomerMetaDatas.Count >= 0)
                {
                    return Ok(corporateCustomerMetaDatas);
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

        #region Get CorporateCustomer Data By Id
        // GET: api/CorporateCustomer/5
        [HttpGet("{corporateID}/{customerID}")]
        public IActionResult Get(int corporateID = 0, int customerID = 0)
        {
            CorporateCustomerDLL corporateCustomerDLL = null;
            CorporateCustomerMetaData corporateCustomerMetaDatas = null;
            try
            {
                corporateCustomerDLL = new CorporateCustomerDLL();

                corporateCustomerMetaDatas = corporateCustomerDLL.GetCorporateCustomerbyId(corporateID, customerID);
                if (corporateCustomerMetaDatas != null)
                {
                    return Ok(corporateCustomerMetaDatas);
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

        #region Add New CorporateCustomer
        [HttpPost]
        public IActionResult Post([FromBody] CorporateCustomerMetaData corporateCustomerMetaDatas)
        {
            DataSet result = null;
            CorporateCustomerDLL corporateCustomerDLL = null;
            try
            {
                corporateCustomerDLL = new CorporateCustomerDLL();
                result = new DataSet();

                corporateCustomerMetaDatas.Mode = 1;
                result = corporateCustomerDLL.CorporateCustomerDML(corporateCustomerMetaDatas);

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

        #region Update CorporateCustomer data
        // PUT: api/CorporateCustomer/5
        [HttpPut]
        public IActionResult Put([FromBody] CorporateCustomerMetaData corporateCustomerMetaDatas)
        {
            DataSet result = null;
            CorporateCustomerDLL corporateCustomerDLL = null;
            try
            {
                corporateCustomerDLL = new CorporateCustomerDLL();
                result = new DataSet();

                corporateCustomerMetaDatas.Mode = 2;
                result = corporateCustomerDLL.CorporateCustomerDML(corporateCustomerMetaDatas);

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

        #region Delete CorporateCustomer
        [HttpDelete]
        public IActionResult Delete(int corporateID = 0, int customerID = 0)
        {
            DataSet result = null;
            CorporateCustomerDLL corporateCustomerDLL = null;
            CorporateCustomerMetaData corporateCustomerMetaDatas = null;
            try
            {
                corporateCustomerDLL = new CorporateCustomerDLL();
                result = new DataSet();
                corporateCustomerMetaDatas = new CorporateCustomerMetaData();

                corporateCustomerMetaDatas.CorporateID = corporateID;
                corporateCustomerMetaDatas.CustomerID = customerID;
                corporateCustomerMetaDatas.Mode = 3;
                result = corporateCustomerDLL.CorporateCustomerDML(corporateCustomerMetaDatas);

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