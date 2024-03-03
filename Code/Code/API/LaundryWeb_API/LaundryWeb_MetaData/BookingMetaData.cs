using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LaundryWeb_MetaData
{
    public class BookingMetaData
    {
        public Nullable<int> BookingId { get; set; }
        public Int64 CustomerId { get; set; }
        public string IDString { get; set; }
        public int NumberOfGarment { get; set; }
        public Nullable<DateTime> BookingDate { get; set; }
        public string TimeSlot { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<DateTime> CreatedOn { get; set; }
        public int Mode { get; set; }
    }
}
