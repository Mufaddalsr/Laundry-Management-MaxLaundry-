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
    [Route("api/TblRole")]
    public class TblRoleController : Controller
    {
        #region Get All TblRole
        [HttpGet]
        public IActionResult Get()
        {
            List<TblRoleMetaData> tblRoleMetaDatas = null;
            TblRoleDLL tblRoleDLL = null;
            int roleId = 0;
            try
            {
                tblRoleDLL = new TblRoleDLL();

                tblRoleMetaDatas = tblRoleDLL.GetAlltblRole(roleId);
                if (tblRoleMetaDatas.Count >= 0)
                {
                    return Ok(tblRoleMetaDatas);
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

        #region Get TblRole Data By Id
        // GET: api/TblRole/5
        [HttpGet("{roleId}")]
        public IActionResult Get(int roleId = 0)
        {
            TblRoleDLL tblRoleDLL = null;
            TblRoleMetaData tblRoleMetaDatas = null;
            try
            {
                tblRoleDLL = new TblRoleDLL();

                tblRoleMetaDatas = tblRoleDLL.GettblRolebyId(roleId);
                if (tblRoleMetaDatas != null)
                {
                    return Ok(tblRoleMetaDatas);
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

        #region Add New TblRole
        [HttpPost]
        public IActionResult Post([FromBody] TblRoleMetaData tblRoleMetaDatas)
        {
            DataSet result = null;
            TblRoleDLL tblRoleDLL = null;
            try
            {
                tblRoleDLL = new TblRoleDLL();
                result = new DataSet();

                tblRoleMetaDatas.Mode = 1;
                result = tblRoleDLL.tblRoleDML(tblRoleMetaDatas);

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

        #region Update TblRole data
        // PUT: api/TblRole/5
        [HttpPut]
        public IActionResult Put([FromBody] TblRoleMetaData tblRoleMetaDatas)
        {
            DataSet result = null;
            TblRoleDLL tblRoleDLL = null;
            try
            {
                tblRoleDLL = new TblRoleDLL();
                result = new DataSet();

                tblRoleMetaDatas.Mode = 2;
                result = tblRoleDLL.tblRoleDML(tblRoleMetaDatas);

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

        #region Delete TblRole
        [HttpDelete]
        public IActionResult Delete(int roleId = 0)
        {
            DataSet result = null;
            TblRoleDLL tblRoleDLL = null;
            TblRoleMetaData tblRoleMetaDatas = null;
            try
            {
                tblRoleDLL = new TblRoleDLL();
                result = new DataSet();
                tblRoleMetaDatas = new TblRoleMetaData();

                tblRoleMetaDatas.RoleID = roleId;
                tblRoleMetaDatas.Mode = 3;
                result = tblRoleDLL.tblRoleDML(tblRoleMetaDatas);

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