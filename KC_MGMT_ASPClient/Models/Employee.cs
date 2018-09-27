using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace KC_MGMT_ASPClient.Models
{
    public class Employee
    {
        #region Persisted fields
        public int       ID              { get; set; }
        public string    employee_name   { get; set; }
        public int?      positionID      { get; set; }
        public decimal?  salary          { get; set; }
        public string    address         { get; set; }
        public int?      phone           { get; set; }
        #endregion

        [ForeignKey("positionID")]
        public Position  positionName        { get; set; }

        public ICollection<ProductsSale> productsSales { get; set; }
        public ICollection<Manufacture> Manufactures { get; set; }
        public ICollection<RawMatPurchase> rawMatPurchases { get; set; }

        public Employee()
        {
            Manufactures = new List<Manufacture>();
            rawMatPurchases = new List<RawMatPurchase>();
            productsSales = new List<ProductsSale>();
        }
    }
}