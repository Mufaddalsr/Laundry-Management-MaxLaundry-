namespace LaundryWeb_MetaData
{
    public class TblUserMetaData
    {
		public TblUserMetaData()
		{

		}

		public int UID { get; set; }
		public string UserID { get; set; }
		public string iPassword { get; set; }
		public int RoleID { get; set; }
		public string DisplayName { get; set; }
		public string RFID { get; set; }
		public bool isActive { get; set; }
		public string BS { get; set; }
		public int Mode { get; set; }
    }
}

