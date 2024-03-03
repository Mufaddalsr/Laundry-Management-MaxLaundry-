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
    [Route("api/Company")]
    public class CompanyController : Controller
    {
        #region Get All Company
        [HttpGet]
        public IActionResult Get()
        {
            List<CompanyMetaData> companyMetaDatas = null;
            CompanyDLL companyDLL = null;
            int id = 0;
            try
            {
                companyDLL = new CompanyDLL();

                companyMetaDatas = companyDLL.GetAllCompany(id);
                if (companyMetaDatas.Count >= 0)
                {
                    return Ok(companyMetaDatas);
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

        #region Get Company Data By Id
        // GET: api/Company/5
        [HttpGet("{id}")]
        public IActionResult Get(int id = 0)
        {
            CompanyDLL companyDLL = null;
            CompanyMetaData companyMetaDatas = null;
            try
            {
                companyDLL = new CompanyDLL();

                companyMetaDatas = companyDLL.GetCompanybyId(id);
                if (companyMetaDatas != null)
                {
                    return Ok(companyMetaDatas);
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

        #region Add New Company
        [HttpPost]
        public IActionResult Post([FromBody] CompanyMetaData companyMetaDatas)
        {
            DataSet result = null;
            CompanyDLL companyDLL = null;
            try
            {
                companyDLL = new CompanyDLL();
                result = new DataSet();

                companyMetaDatas.Mode = 1;
                result = companyDLL.CompanyDML(companyMetaDatas);

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

        #region Update Company data
        // PUT: api/Company/5
        [HttpPut]
        public IActionResult Put([FromBody] CompanyMetaData companyMetaDatas)
        {
            DataSet result = null;
            CompanyDLL companyDLL = null;
            try
            {
                companyDLL = new CompanyDLL();
                result = new DataSet();

                companyMetaDatas.Mode = 2;
                result = companyDLL.CompanyDML(companyMetaDatas);

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

        #region Delete Company
        [HttpDelete]
        public IActionResult Delete(int id = 0)
        {
            DataSet result = null;
            CompanyDLL companyDLL = null;
            CompanyMetaData companyMetaDatas = null;
            try
            {
                companyDLL = new CompanyDLL();
                result = new DataSet();
                companyMetaDatas = new CompanyMetaData();

                companyMetaDatas.ID = id;
                companyMetaDatas.Mode = 3;
                result = companyDLL.CompanyDML(companyMetaDatas);

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