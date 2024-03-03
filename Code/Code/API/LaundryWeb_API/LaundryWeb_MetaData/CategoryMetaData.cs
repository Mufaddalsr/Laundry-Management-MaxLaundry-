using System;

namespace LaundryWeb_MetaData
{
    public class CategoryMetaData
    {
		public CategoryMetaData()
		{

		}

		public int ID { get; set; }
		public string Category { get; set; }
		public bool isActive { get; set; }
		public Nullable<int> CompanyID { get; set; }
		public int Mode { get; set; }
    }
}

