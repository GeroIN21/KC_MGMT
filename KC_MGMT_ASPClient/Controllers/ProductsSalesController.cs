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
    public class ProductsSalesController : Controller
    {
        private ClothingManufacture_Context db = new ClothingManufacture_Context();

        // GET: ProductsSales
        public ActionResult Index()
        {
            var productsSales = db.ProductsSales.Include(p => p.EmployeeName).Include(p => p.FinishedProduct);
            return View(productsSales.ToList());
        }

        // GET: ProductsSales/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductsSale productsSale = db.ProductsSales.Find(id);
            if (productsSale == null)
            {
                return HttpNotFound();
            }
            return View(productsSale);
        }

        // GET: ProductsSales/Create
        public ActionResult Create()
        {
            ViewBag.emloyeeID = new SelectList(db.Employees, "ID", "employee_name");
            ViewBag.product_nameID = new SelectList(db.FinishedProducts, "ID", "product_name");
            return View();
        }

        // POST: ProductsSales/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,product_nameID,quantity,date,emloyeeID,prod_sum")] ProductsSale productsSale)
        {
            if (ModelState.IsValid)
            {
                db.ProductsSales.Add(productsSale);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.emloyeeID = new SelectList(db.Employees, "ID", "employee_name", productsSale.emloyeeID);
            ViewBag.product_nameID = new SelectList(db.FinishedProducts, "ID", "product_name", productsSale.product_nameID);
            return View(productsSale);
        }

        // GET: ProductsSales/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductsSale productsSale = db.ProductsSales.Find(id);
            if (productsSale == null)
            {
                return HttpNotFound();
            }
            ViewBag.emloyeeID = new SelectList(db.Employees, "ID", "employee_name", productsSale.emloyeeID);
            ViewBag.product_nameID = new SelectList(db.FinishedProducts, "ID", "product_name", productsSale.product_nameID);
            return View(productsSale);
        }

        // POST: ProductsSales/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,product_nameID,quantity,date,emloyeeID,prod_sum")] ProductsSale productsSale)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productsSale).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.emloyeeID = new SelectList(db.Employees, "ID", "employee_name", productsSale.emloyeeID);
            ViewBag.product_nameID = new SelectList(db.FinishedProducts, "ID", "product_name", productsSale.product_nameID);
            return View(productsSale);
        }

        // GET: ProductsSales/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductsSale productsSale = db.ProductsSales.Find(id);
            if (productsSale == null)
            {
                return HttpNotFound();
            }
            return View(productsSale);
        }

        // POST: ProductsSales/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProductsSale productsSale = db.ProductsSales.Find(id);
            db.ProductsSales.Remove(productsSale);
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
