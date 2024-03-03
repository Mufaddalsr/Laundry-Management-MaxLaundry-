using System;

namespace LaundryWeb_MetaData
{
    public class GarmentTypeMetaData
    {
		public GarmentTypeMetaData()
		{

		}

		public int ID { get; set; }
		public string GarmetType { get; set; }
		public bool isActive { get; set; }
		public Nullable<System.DateTime> CreatedOn { get; set; }
		public Nullable<int> CreatedBy { get; set; }
        public Byte[] GImage { get; set; }
        public Nullable<int> CompanyID { get; set; }
		public Nullable<int> CategoryID { get; set; }
		public Nullable<int> TagCount { get; set; }
		public float Weight { get; set; }
		public int Mode { get; set; }
    }
}

