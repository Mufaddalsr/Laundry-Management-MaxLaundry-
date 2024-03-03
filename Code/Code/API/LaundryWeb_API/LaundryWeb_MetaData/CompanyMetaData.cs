namespace LaundryWeb_MetaData
{
    public class CompanyMetaData
    {
		public CompanyMetaData()
		{

		}

		public int ID { get; set; }
		public string CompanyName { get; set; }
		public string CompanyCode { get; set; }
		public string Address { get; set; }
		public string PhoneNo { get; set; }
		public string FaxNo { get; set; }
		public bool isActive { get; set; }
        public string Logo { get; set; }

        public int Mode { get; set; }
    }
}

