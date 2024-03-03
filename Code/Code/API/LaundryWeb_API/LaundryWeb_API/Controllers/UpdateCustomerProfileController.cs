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
    [Route("api/UpdateCustomerProfile")]
    public class UpdateCustomerProfileController : ControllerBase
    {
        #region Update Customer data
        // PUT: api/Customer/5
        [HttpPut]
        public IActionResult Put([FromBody] UpdateCustomerProfileMetaData updateCustomerProfileMetaDatas)
        {
            DataSet result = null;
            UpdateCustomerProfileDLL updateCustomerProfileDLL = null;
            try
            {
                updateCustomerProfileDLL = new UpdateCustomerProfileDLL();
                result = new DataSet();

                updateCustomerProfileMetaDatas.ID = Convert.ToInt64(updateCustomerProfileMetaDatas.IDString);
                updateCustomerProfileMetaDatas.Mode = 2;
                result = updateCustomerProfileDLL.UpdateProfile(updateCustomerProfileMetaDatas);

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
