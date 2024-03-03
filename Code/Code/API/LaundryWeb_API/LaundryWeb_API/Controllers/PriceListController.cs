using LaundryWeb_DLL;
using LaundryWeb_MetaData;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Net;
using System.Linq;
using System.Data;
using LaundryWeb_DLL.DBHelper;

namespace LaundryWeb_API.Controllers
{
    [Produces("application/json")]
    [Route("api/PriceList")]
    public class PriceListController : ControllerBase
    {
        // GET: api/Price/5
        [HttpGet("{customerId}")]
        public IActionResult Get(string customerId)
        {
            PriceListDLL priceListDLL = null;
            List<PriceListMetaData> priceListMetaDatas = null;
            List<services> servicesMetaData = null;
            DataSet ds = new DataSet();
            try
            {
                priceListDLL = new PriceListDLL();
                priceListMetaDatas = new List<PriceListMetaData>();
                servicesMetaData = new List<services>();
                Int64 ID = Convert.ToInt64(customerId);
                ds = priceListDLL.GetAllPriceList(ID);
                priceListMetaDatas = ds.Tables[0].ToListNullableTypes<PriceListMetaData>();
                servicesMetaData = ds.Tables[1].ToListNullableTypes<services>();
                if (priceListMetaDatas != null)
                {
                    return Ok(new
                    {
                        statusCode = HttpStatusCode.InternalServerError,
                        success = true,
                        data = priceListMetaDatas,
                        data1 = servicesMetaData
                });
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
