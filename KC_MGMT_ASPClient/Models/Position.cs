using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KC_MGMT_ASPClient.Models
{
    public class Position
    {
        public int ID { get; set; }
        public string position { get; set; }

        public ICollection<Employee> Employees { get; set; }

        public Position()
        {
            Employees = new List<Employee>();
        }
    }
}