using LaundryWeb_DLL;
using LaundryWeb_MetaData;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Net;

namespace LaundryWeb_API.Controllers
{
    [Produces("application/json")]
    [Route("api/Dashboard")]
    public class DashboardController : ControllerBase
    {
        [HttpGet("{customerId}")]
        public IActionResult Get(string customerId)
        {
            DashboardDLL dashboardDLL = null;
            DashboardMetaData dashboardMetaDatas = null;
            try
            {
                dashboardDLL = new DashboardDLL();
                dashboardMetaDatas = new DashboardMetaData();
                Int64 Id = Convert.ToInt64(customerId);
                dashboardMetaDatas = dashboardDLL.GetDashboard(Id);
                if (dashboardMetaDatas != null)
                {
                    return Ok(dashboardMetaDatas);
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
                    errormessage = ex.Message
                });
            }
        }
    }
}
