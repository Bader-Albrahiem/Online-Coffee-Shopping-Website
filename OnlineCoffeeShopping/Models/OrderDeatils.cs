using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineCoffeeShopping.Models
{
    public class OrderDeatils
    {
        public string Name { get; set; }
        public string Phone_Number { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Country { get; set; }

        public string ZipCode { get; set; }
    }
}