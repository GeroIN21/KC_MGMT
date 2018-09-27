using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace KC_MGMT_ASPClient.Models.Context
{
    public class ClothingManufacture_Context : DbContext
    {
        public DbSet<FinishedProduct>   FinishedProducts    { get; set; }
        public DbSet<Unit>              Units               { get; set; }
        public DbSet<RawMaterial>       RawMaterials        { get; set; }
        public DbSet<RawMatPurchase>    RawMatPurchases     { get; set; }
        public DbSet<ProductsSale>      ProductsSales       { get; set; }
        public DbSet<Position>          Positions           { get; set; }
        public DbSet<Manufacture>       Manufacture         { get; set; }
        public DbSet<Employee>          Employees           { get; set; }
        public DbSet<Ingredient>        Ingredients         { get; set; }

        public string connectionString = @"Data Source=DESKTOP-73OD3QJ\SQLEXPRESS;Initial Catalog=KCM_MGMT_DB;Integrated Security=True";
    }
}