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
    [Route("api/UserCompany")]
    public class UserUserCompanyController : Controller
    {
        #region Get All UserCompany
        [HttpGet]
        public IActionResult Get()
        {
            List<UserCompanyMetaData> userCompanyMetaDatas = null;
            UserCompanyDLL userCompanyDLL = null;
            int tID = 0;
            try
            {
                userCompanyDLL = new UserCompanyDLL();

                userCompanyMetaDatas = userCompanyDLL.GetAllUserCompany(tID);
                if (userCompanyMetaDatas.Count >= 0)
                {
                    return Ok(userCompanyMetaDatas);
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

        #region Get UserCompany Data By Id
        // GET: api/UserCompany/5
        [HttpGet("{tID}")]
        public IActionResult Get(int tID = 0)
        {
            UserCompanyDLL userCompanyDLL = null;
            UserCompanyMetaData userCompanyMetaDatas = null;
            try
            {
                userCompanyDLL = new UserCompanyDLL();

                userCompanyMetaDatas = userCompanyDLL.GetUserCompanybyId(tID);
                if (userCompanyMetaDatas != null)
                {
                    return Ok(userCompanyMetaDatas);
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

        #region Add New UserCompany
        [HttpPost]
        public IActionResult Post([FromBody] UserCompanyMetaData userCompanyMetaDatas)
        {
            DataSet result = null;
            UserCompanyDLL userCompanyDLL = null;
            try
            {
                userCompanyDLL = new UserCompanyDLL();
                result = new DataSet();

                userCompanyMetaDatas.Mode = 1;
                result = userCompanyDLL.UserCompanyDML(userCompanyMetaDatas);

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

        #region Update UserCompany data
        // PUT: api/UserCompany/5
        [HttpPut]
        public IActionResult Put([FromBody] UserCompanyMetaData userCompanyMetaDatas)
        {
            DataSet result = null;
            UserCompanyDLL userCompanyDLL = null;
            try
            {
                userCompanyDLL = new UserCompanyDLL();
                result = new DataSet();

                userCompanyMetaDatas.Mode = 2;
                result = userCompanyDLL.UserCompanyDML(userCompanyMetaDatas);

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

        #region Delete UserCompany
        [HttpDelete]
        public IActionResult Delete(int tID = 0)
        {
            DataSet result = null;
            UserCompanyDLL userCompanyDLL = null;
            UserCompanyMetaData userCompanyMetaDatas = null;
            try
            {
                userCompanyDLL = new UserCompanyDLL();
                result = new DataSet();
                userCompanyMetaDatas = new UserCompanyMetaData();

                userCompanyMetaDatas.TID = tID;
                userCompanyMetaDatas.Mode = 3;
                result = userCompanyDLL.UserCompanyDML(userCompanyMetaDatas);

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