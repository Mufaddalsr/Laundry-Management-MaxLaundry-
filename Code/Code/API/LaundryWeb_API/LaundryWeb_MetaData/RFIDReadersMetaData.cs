using System;

namespace LaundryWeb_MetaData
{
    public class RFIDReadersMetaData
    {
		public RFIDReadersMetaData()
		{

		}

		public int ID { get; set; }
		public string ReaderCode { get; set; }
		public string IPAddress { get; set; }
		public float AN1 { get; set; }
		public float AN2 { get; set; }
		public float AN3 { get; set; }
		public float AN4 { get; set; }
		public string ReaderType { get; set; }
		public Nullable<int> LocationID { get; set; }
		public Nullable<int> CompanyID { get; set; }
		public bool isActive { get; set; }
		public int Mode { get; set; }
    }
}

