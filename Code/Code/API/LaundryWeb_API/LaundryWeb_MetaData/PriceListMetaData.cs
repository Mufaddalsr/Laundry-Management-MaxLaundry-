using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LaundryWeb_MetaData
{
    public class PriceListMetaData
    {
        public string GarmetType { get; set;}
        public string ServiceType { get; set; }
        public double Price { get; set; }
    }

    public class services
    {
        public string ServiceType { get; set; }
    }
}
