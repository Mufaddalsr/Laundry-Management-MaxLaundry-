using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LaundryWeb_MetaData
{
    public class InvoiceMetaData
    {
        public double TotalAdvance { get; set; }
        public DateTime OrderDate { get; set; }
        public int totalQty { get; set; }
        public string IDString { get; set; }
        public double OrderTotal { get; set; }
        public string Status { get; set; }
    }
}

