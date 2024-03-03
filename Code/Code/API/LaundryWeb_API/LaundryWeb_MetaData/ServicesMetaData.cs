using System;

namespace LaundryWeb_MetaData
{
    public class ServicesMetaData
    {
		public ServicesMetaData()
		{

		}

		public int ID { get; set; }
		public string ServiceType { get; set; }
		public bool isActive { get; set; }
		public Nullable<int> CompanyID { get; set; }
		public int Mode { get; set; }
    }
}

