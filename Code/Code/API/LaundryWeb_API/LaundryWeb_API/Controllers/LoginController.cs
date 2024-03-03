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
    [Route("api/Login")]
    public class LoginController : ControllerBase
    {
        #region Login
        [HttpPost]
        public IActionResult Post([FromBody] LoginMetaData loginMetaDatas)
        {
            DataSet result = null;
            LoginDLL loginDLL = null;
            LoginMetaData objloginMetaData = null;
            try
            {
                loginDLL = new LoginDLL();
                result = new DataSet();
                objloginMetaData = new LoginMetaData();
              

                loginMetaDatas.Password = Utility.EncryptPassword(loginMetaDatas.Password);
                result = loginDLL.Login(loginMetaDatas);
                if (Convert.ToInt32(result.Tables[1].Rows[0][1]) == 1)
                {
                    Int64 ID = Convert.ToInt64(result.Tables[0].Rows[0][1]);
                    string IDString = result.Tables[0].Rows[0][2].ToString();
                    string fullName = result.Tables[0].Rows[0][3].ToString();
                    return Ok(new
                    {
                        statusCode = HttpStatusCode.OK,
                        success = true,
                        id = ID,
                        idString= IDString,
                        fullName= fullName
                    });
                }
                else if (Convert.ToInt32(result.Tables[1].Rows[0][1]) == 0)
                {
                    return Ok(new
                    {
                        statusCode = HttpStatusCode.OK,
                        success = "Wrong"
                    });
                }
                else
                {
                    return Ok(new
                    {
                        statusCode = HttpStatusCode.InternalServerError,
                        success = false
                    });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion
    }
}