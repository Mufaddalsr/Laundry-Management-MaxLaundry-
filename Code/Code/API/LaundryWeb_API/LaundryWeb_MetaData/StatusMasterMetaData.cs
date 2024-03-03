using System;

namespace LaundryWeb_MetaData
{
    public class StatusMasterMetaData
    {
		public StatusMasterMetaData()
		{

		}

		public int ID { get; set; }
		public string StatusDesc { get; set; }
		public Nullable<int> HoursMax { get; set; }
		public int Mode { get; set; }
    }
}

