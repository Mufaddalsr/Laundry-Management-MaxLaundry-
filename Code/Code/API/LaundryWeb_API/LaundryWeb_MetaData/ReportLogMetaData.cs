using System;

namespace LaundryWeb_MetaData
{
    public class ReportLogMetaData
    {
		public ReportLogMetaData()
		{

		}

		public int ID { get; set; }
		public string ReportType { get; set; }
		public Nullable<System.DateTime> ReportDate { get; set; }
        public Byte[] ReportDoc { get; set; }
        public Nullable<int> ReportBy { get; set; }
		public Nullable<System.DateTime> ReportingTime { get; set; }
		public int Mode { get; set; }
    }
}

