using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace KC_MGMT_ASPClient.Models
{
    public class Ingredient
    {
        public int      ID              { get; set; }
        public int      product_name    { get; set; }
        public int      raw_name        { get; set; }
        public decimal  quantity        { get; set; }

        [ForeignKey("product_name")]
        public FinishedProduct finishedProduct { get; set; }

        [ForeignKey("raw_name")]
        public RawMaterial rawMaterial { get; set; }
    }
}