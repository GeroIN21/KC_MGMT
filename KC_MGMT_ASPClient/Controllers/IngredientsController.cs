using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using KC_MGMT_ASPClient.Models;
using KC_MGMT_ASPClient.Models.Context;
using System.Data.SqlClient;

namespace KC_MGMT_ASPClient.Controllers
{
    public class IngredientsController : Controller
    {
        private ClothingManufacture_Context db = new ClothingManufacture_Context();

        // GET: Ingredients
        public ActionResult Index(int? id)
        {
            using (var MyConnection = new SqlConnection(db.connectionString))
            {
                SqlCommand getIngredient = new SqlCommand("GetProductIngredients", MyConnection);

                getIngredient.CommandType = CommandType.StoredProcedure;
                getIngredient.Parameters.AddWithValue("@product_id", id);

                //MyConnection.Open();
                //getIngredient.ExecuteReader();
                //MyConnection.Close();

                DataTable dt = new DataTable();
                MyConnection.Open();
                try
                {
                    ViewBag.FinProdCurName = db.FinishedProducts.Find(id).product_name;
                    dt.Load(getIngredient.ExecuteReader());
                }
                catch (Exception ex)
                {
                    ViewBag.IngrException = ex;
                    //throw;
                }
                MyConnection.Close();

                ViewBag.IngredientView = dt.DefaultView;
            }

            var ingredients = db.Ingredients.Include(i => i.finishedProduct).Include(i => i.rawMaterial);
            return View(ingredients.ToList());
        }

        // GET: Ingredients/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ingredient ingredient = db.Ingredients.Find(id);
            if (ingredient == null)
            {
                return HttpNotFound();
            }
            return View(ingredient);
        }

        // GET: Ingredients/Create
        public ActionResult Create()
        {
            ViewBag.product_name = new SelectList(db.FinishedProducts, "ID", "product_name");
            ViewBag.raw_name = new SelectList(db.RawMaterials, "ID", "raw_name");
            return View();
        }

        // POST: Ingredients/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,product_name,raw_name,quantity")] Ingredient ingredient)
        {
            if (ModelState.IsValid)
            {
                db.Ingredients.Add(ingredient);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.product_name = new SelectList(db.FinishedProducts, "ID", "product_name", ingredient.product_name);
            ViewBag.raw_name = new SelectList(db.RawMaterials, "ID", "raw_name", ingredient.raw_name);
            return View(ingredient);
        }

        // GET: Ingredients/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ingredient ingredient = db.Ingredients.Find(id);
            if (ingredient == null)
            {
                return HttpNotFound();
            }
            ViewBag.product_name = new SelectList(db.FinishedProducts, "ID", "product_name", ingredient.product_name);
            ViewBag.raw_name = new SelectList(db.RawMaterials, "ID", "raw_name", ingredient.raw_name);
            return View(ingredient);
        }

        // POST: Ingredients/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,product_name,raw_name,quantity")] Ingredient ingredient)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ingredient).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.product_name = new SelectList(db.FinishedProducts, "ID", "product_name", ingredient.product_name);
            ViewBag.raw_name = new SelectList(db.RawMaterials, "ID", "raw_name", ingredient.raw_name);
            return View(ingredient);
        }

        // GET: Ingredients/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ingredient ingredient = db.Ingredients.Find(id);
            if (ingredient == null)
            {
                return HttpNotFound();
            }
            return View(ingredient);
        }

        // POST: Ingredients/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Ingredient ingredient = db.Ingredients.Find(id);
            db.Ingredients.Remove(ingredient);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
