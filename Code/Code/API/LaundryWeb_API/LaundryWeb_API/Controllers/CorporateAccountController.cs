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
    [Route("api/CorporateAccount")]
    public class CorporateAccountController : Controller
    {
        #region Get All CorporateAccount
        [HttpGet]
        public IActionResult Get()
        {
            List<CorporateAccountMetaData> corporateAccountMetaDatas = null;
            CorporateAccountDLL corporateAccountDLL = null;
            int id = 0;
            try
            {
                corporateAccountDLL = new CorporateAccountDLL();

                corporateAccountMetaDatas = corporateAccountDLL.GetAllCorporateAccount(id);
                if (corporateAccountMetaDatas.Count >= 0)
                {
                    return Ok(corporateAccountMetaDatas);
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

        #region Get CorporateAccount Data By Id
        // GET: api/CorporateAccount/5
        [HttpGet("{id}")]
        public IActionResult Get(int id = 0)
        {
            CorporateAccountDLL corporateAccountDLL = null;
            CorporateAccountMetaData corporateAccountMetaDatas = null;
            try
            {
                corporateAccountDLL = new CorporateAccountDLL();

                corporateAccountMetaDatas = corporateAccountDLL.GetCorporateAccountbyId(id);
                if (corporateAccountMetaDatas != null)
                {
                    return Ok(corporateAccountMetaDatas);
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

        #region Add New CorporateAccount
        [HttpPost]
        public IActionResult Post([FromBody] CorporateAccountMetaData corporateAccountMetaDatas)
        {
            DataSet result = null;
            CorporateAccountDLL corporateAccountDLL = null;
            try
            {
                corporateAccountDLL = new CorporateAccountDLL();
                result = new DataSet();

                corporateAccountMetaDatas.Mode = 1;
                result = corporateAccountDLL.CorporateAccountDML(corporateAccountMetaDatas);

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

        #region Update CorporateAccount data
        // PUT: api/CorporateAccount/5
        [HttpPut]
        public IActionResult Put([FromBody] CorporateAccountMetaData corporateAccountMetaDatas)
        {
            DataSet result = null;
            CorporateAccountDLL corporateAccountDLL = null;
            try
            {
                corporateAccountDLL = new CorporateAccountDLL();
                result = new DataSet();

                corporateAccountMetaDatas.Mode = 2;
                result = corporateAccountDLL.CorporateAccountDML(corporateAccountMetaDatas);

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

        #region Delete CorporateAccount
        [HttpDelete]
        public IActionResult Delete(int id = 0)
        {
            DataSet result = null;
            CorporateAccountDLL corporateAccountDLL = null;
            CorporateAccountMetaData corporateAccountMetaDatas = null;
            try
            {
                corporateAccountDLL = new CorporateAccountDLL();
                result = new DataSet();
                corporateAccountMetaDatas = new CorporateAccountMetaData();

                corporateAccountMetaDatas.ID = id;
                corporateAccountMetaDatas.Mode = 3;
                result = corporateAccountDLL.CorporateAccountDML(corporateAccountMetaDatas);

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