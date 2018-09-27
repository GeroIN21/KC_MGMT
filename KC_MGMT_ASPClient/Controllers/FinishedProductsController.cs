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

namespace KC_MGMT_ASPClient.Controllers
{
    public class FinishedProductsController : Controller
    {
        private ClothingManufacture_Context db = new ClothingManufacture_Context();

        // GET: FinishedProducts
        public ActionResult Index()
        {
            var finishedProducts = db.FinishedProducts.Include(f => f.Unit);
            return View(finishedProducts.ToList());
        }

        // GET: FinishedProducts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FinishedProduct finishedProduct = db.FinishedProducts.Find(id);
            if (finishedProduct == null)
            {
                return HttpNotFound();
            }
            return View(finishedProduct);
        }

        // GET: FinishedProducts/Create
        public ActionResult Create()
        {
            ViewBag.unitID = new SelectList(db.Units, "ID", "unit_name");
            return View();
        }

        // POST: FinishedProducts/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,product_name,unitID,sum,quantity")] FinishedProduct finishedProduct)
        {
            if (ModelState.IsValid)
            {
                db.FinishedProducts.Add(finishedProduct);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.unitID = new SelectList(db.Units, "ID", "unit_name", finishedProduct.unitID);
            return View(finishedProduct);
        }

        // GET: FinishedProducts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FinishedProduct finishedProduct = db.FinishedProducts.Find(id);
            if (finishedProduct == null)
            {
                return HttpNotFound();
            }
            ViewBag.unitID = new SelectList(db.Units, "ID", "unit_name", finishedProduct.unitID);
            return View(finishedProduct);
        }

        // POST: FinishedProducts/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,product_name,unitID,sum,quantity")] FinishedProduct finishedProduct)
        {
            if (ModelState.IsValid)
            {
                db.Entry(finishedProduct).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.unitID = new SelectList(db.Units, "ID", "unit_name", finishedProduct.unitID);
            return View(finishedProduct);
    }

        // GET: FinishedProducts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FinishedProduct finishedProduct = db.FinishedProducts.Find(id);
            if (finishedProduct == null)
            {
                return HttpNotFound();
            }
            return View(finishedProduct);
        }

        // POST: FinishedProducts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            FinishedProduct finishedProduct = db.FinishedProducts.Find(id);
            db.FinishedProducts.Remove(finishedProduct);
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
