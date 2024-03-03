using LaundryWeb_DLL;
using LaundryWeb_MetaData;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Net;

namespace LaundryWeb_API.Controllers
{
    [Produces("application/json")]
    [Route("api/Invoice")]
    public class InvoiceController : ControllerBase
    {
        [HttpGet("{customerId}")]
        public IActionResult Get(string customerId)
        {
            InvoiceDLL invoiceDLL = null;
            List<InvoiceMetaData> invoiceMetaDatas = null;
            try
            {
                invoiceDLL = new InvoiceDLL();
                invoiceMetaDatas = new List<InvoiceMetaData>();
                Int64 ID = Convert.ToInt64(customerId);
                invoiceMetaDatas = invoiceDLL.GetAllInvoiceList(ID);
                if (invoiceMetaDatas != null)
                {
                    return Ok(invoiceMetaDatas);
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
