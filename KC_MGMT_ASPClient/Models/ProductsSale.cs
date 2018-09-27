using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace KC_MGMT_ASPClient.Models
{
    public class ProductsSale
    {
        #region Persisted fields  
        [Required]
        public int      ID              { get; set; }
        [Required]
        public int      product_nameID  { get; set; }
        [Required]
        public int      quantity        { get; set; }
        [Required]
        public DateTime date            { get; set; }
        [Required]
        public int      emloyeeID       { get; set; }
        [Required]
        public decimal  prod_sum        { get; set; }
        #endregion

        [ForeignKey("emloyeeID")]
        public Employee EmployeeName           { get; set; }

        [ForeignKey("product_nameID")]
        public FinishedProduct FinishedProduct { get; set; }
    }
}