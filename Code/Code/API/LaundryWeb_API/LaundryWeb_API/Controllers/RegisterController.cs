using LaundryWeb_DLL;
using LaundryWeb_MetaData;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Data;
using System.Net;


namespace LaundryWeb_API.Controllers
{
    [Produces("application/json")]
    [Route("api/Register")]
    public class RegisterController : ControllerBase
    {
        [HttpGet("{phoneNumber}")]
        public IActionResult SavePhoneNumber(string phoneNumber = "")
        {
            DataSet result = null;
            RegisterDLL registerDLL = null;
            RegisterMetaData registerMetaDatas = null;
            try
            {
                registerDLL = new RegisterDLL();
                result = new DataSet();
                registerMetaDatas = new RegisterMetaData();
                registerMetaDatas = registerDLL.SavePhoneNumber(phoneNumber);
                if(registerMetaDatas.ID > 0)
                {
                    registerMetaDatas.Mode = 2;
                }
                else
                {
                    registerMetaDatas.Mode = 1;
                }
                return Ok(registerMetaDatas);
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

        #region Add New Customer
        [HttpPost]
        public IActionResult Post([FromBody] RegisterMetaData registerMetaData)
        {
            DataSet result = null;
            RegisterDLL registerDLL = null;
            try
            {
                Random rand = new Random();
                string num = rand.Next(1000,9000).ToString();
                registerDLL = new RegisterDLL();
                result = new DataSet();
                //registerMetaData.Mode = 1;
                registerMetaData.ID = Convert.ToInt64(registerMetaData.IDString);
                registerMetaData.Password = Utility.EncryptPassword(num);
                result = registerDLL.Register(registerMetaData);

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
    }
}
