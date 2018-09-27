using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace KC_MGMT_ASPClient.Models
{
    public class FinishedProduct
    {
        #region Persisted fields
        public int      ID              { get; set; }
        public string   product_name    { get; set; }
        public int?     unitID          { get; set; }
        public decimal? sum             { get; set; }
        public int?     quantity        { get; set; }
        #endregion

        public Unit     Unit            { get; set; }

        public ICollection<Manufacture>  Manufactures  { get; set; }
        public ICollection<ProductsSale> productsSales { get; set; }
        public ICollection<Ingredient> IngredientsCollection { get; set; }

        public FinishedProduct()
        {
            Manufactures  = new List<Manufacture>();
            productsSales = new List<ProductsSale>();
            IngredientsCollection = new List<Ingredient>();
        }
    }
}