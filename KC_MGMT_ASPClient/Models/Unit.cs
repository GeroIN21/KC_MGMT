using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KC_MGMT_ASPClient.Models
{
    public class Unit
    {
        public int      ID          { get; set; }
        public string   unit_name   { get; set; }

        public ICollection<FinishedProduct> FinishedProducts    { get; set; }
        public ICollection<RawMaterial>     RawMaterials        { get; set; }

        public Unit()
        {
            FinishedProducts = new List<FinishedProduct>();
            RawMaterials     = new List<RawMaterial>();
        }
    }
}