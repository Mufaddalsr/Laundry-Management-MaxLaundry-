using System;

namespace LaundryWeb_MetaData
{
    public class LocationsMetaData
    {
		public LocationsMetaData()
		{

		}

		public int ID { get; set; }
		public string LocationCode { get; set; }
		public string LocationName { get; set; }
		public string LocationType { get; set; }
		public bool isActive { get; set; }
		public Nullable<int> CompanyID { get; set; }
		public Nullable<int> LastOrderID { get; set; }
		public int Mode { get; set; }
    }
}

