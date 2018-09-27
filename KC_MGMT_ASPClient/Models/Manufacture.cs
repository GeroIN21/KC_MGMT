using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace KC_MGMT_ASPClient.Models
{
    [Table("Manufactures")]
    public class Manufacture
    {
        #region Persisted fields
        [Required]
        public int       ID                { get; set; }
        [Required]      
        public int?      product_nameID    { get; set; }
        [Required]
        public int?      quantity          { get; set; }
        [Required]
        public DateTime? date              { get; set; }
        [Required]
        public int?      employeeID        { get; set; }
        #endregion

        [ForeignKey("product_nameID")]
        public FinishedProduct FinProduct       { get; set; }

        [ForeignKey("employeeID")]
        public Employee        EmployeeName     { get; set; }
    }
}