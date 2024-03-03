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
    [Route("api/ChangePassword")]
    public class ChangePasswordController : ControllerBase
    {
        #region "Role Update [HttpPut]"
        [HttpPut]
        public IActionResult Put([FromBody] ChangePasswordMetaData changePasswordMetaDatas)
        {
            DataSet result = null;
            ChangePasswordDLL changePasswordDLL = null;
            try
            {
                changePasswordDLL = new ChangePasswordDLL();
                result = new DataSet();
                changePasswordMetaDatas.NewPassword = Utility.EncryptPassword(changePasswordMetaDatas.NewPassword);
                changePasswordMetaDatas.OldPassword = Utility.EncryptPassword(changePasswordMetaDatas.OldPassword);
                changePasswordMetaDatas.ID = Convert.ToInt64(changePasswordMetaDatas.IDString);
                result = changePasswordDLL.ChangePassword(changePasswordMetaDatas);
                if (Convert.ToInt32(result.Tables[0].Rows[0][1]) > 0)
                {
                    return Ok(new
                    {
                        statusCode = HttpStatusCode.OK,
                        success = true,
                        data = Convert.ToInt32(result.Tables[0].Rows[0][1])
                    });
                }
                else if (Convert.ToInt32(result.Tables[0].Rows[0][1]) == 0)
                {
                    return Ok(new
                    {
                        statusCode = HttpStatusCode.OK,
                        success = false,
                        data = Convert.ToInt32(result.Tables[0].Rows[0][1])
                    });
                }
                else
                {
                    return Ok(new
                    {
                        statusCode = HttpStatusCode.InternalServerError,
                        success = false,
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