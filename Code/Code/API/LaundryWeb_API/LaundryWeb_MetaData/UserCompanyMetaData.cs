using System;

namespace LaundryWeb_MetaData
{
    public class UserCompanyMetaData
    {
		public UserCompanyMetaData()
		{

		}

		public int TID { get; set; }
		public Nullable<int> UID { get; set; }
		public Nullable<int> CID { get; set; }
		public int Mode { get; set; }
    }
}

