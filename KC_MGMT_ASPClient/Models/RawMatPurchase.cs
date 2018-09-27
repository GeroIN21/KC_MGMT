using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace KC_MGMT_ASPClient.Models
{
    public class RawMatPurchase
    {
        #region Persisted fields
        [Required]
        public int           ID                 { get; set; }
        [Required]
        public int           raw_nameID         { get; set; }
        [Required]
        public decimal       quantity           { get; set; }
        [Required]
        public decimal       sum                { get; set; }
        [Required]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime      date               { get; set; }
        [Required]
        public int           employee_nameID    { get; set; }
        #endregion

        [ForeignKey("raw_nameID")]
        public RawMaterial   rawMaterialName    { get; set; } //ссылка на внешний ключ RawMaterials

        [ForeignKey("employee_nameID")]
        public Employee      employeeName       { get; set; } //ссылка на внешний ключ Employee
    }
}