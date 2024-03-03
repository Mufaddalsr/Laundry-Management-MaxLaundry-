using System;

namespace LaundryWeb_MetaData
{
    public class CustomerMetaData
    {
		public CustomerMetaData()
		{

		}

		public Int64 ID { get; set; }
		public string CustomerID { get; set; }
		public string FullName { get; set; }
		public string Address { get; set; }
		public string Landmark { get; set; }
		public string PhoneNumber { get; set; }
		public string MobileNumber { get; set; }
		public string Attn { get; set; }
		public Nullable<int> AccountType { get; set; }
		public string Phone1 { get; set; }
		public string Phone2 { get; set; }
		public string Phone3 { get; set; }
		public string Phone4 { get; set; }
		public string Phone5 { get; set; }
		public string CustomerCode { get; set; }
		public Nullable<System.DateTime> CreatedOn { get; set; }
		public Nullable<int> CreatedBy { get; set; }
		public Nullable<int> CompanyID { get; set; }
		public bool isActive { get; set; }
		public string Email { get; set; }
		public Nullable<int> CorpID { get; set; }
		public bool isSync { get; set; }
		public int Mode { get; set; }
        public string Longitude { get; set; }
        public string Latitude { get; set; }
    }
}

