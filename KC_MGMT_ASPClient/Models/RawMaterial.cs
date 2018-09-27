using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace KC_MGMT_ASPClient.Models
{
    public class RawMaterial
    {
        #region Persisted fields
        public int       ID           { get; set; }
        public string    raw_name     { get; set; }
        public int?      unitID       { get; set; } //Вн. ключ
        public decimal?  sum          { get; set; }
        public decimal?  quantity     { get; set; }
        #endregion

        [ForeignKey("unitID")]
        public Unit     unitName        { get; set; }

        public ICollection<RawMatPurchase> rawMatPurchases { get; set; }
        public RawMaterial()
        {
            rawMatPurchases = new List<RawMatPurchase>();
        }
    }
}