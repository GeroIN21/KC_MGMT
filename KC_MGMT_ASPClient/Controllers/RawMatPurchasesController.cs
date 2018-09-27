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
    public class RawMatPurchasesController : Controller
    {
        private ClothingManufacture_Context db = new ClothingManufacture_Context();

        // GET: RawMatPurchases
        public ActionResult Index()
        {
            var rawMatPurchases = db.RawMatPurchases.Include(r => r.employeeName).Include(r => r.rawMaterialName);
            return View(rawMatPurchases.ToList());
        }

        // GET: RawMatPurchases/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RawMatPurchase rawMatPurchase = db.RawMatPurchases.Find(id);
            if (rawMatPurchase == null)
            {
                return HttpNotFound();
            }
            return View(rawMatPurchase);
        }

        // GET: RawMatPurchases/Create
        public ActionResult Create()
        {
            ViewBag.employee_nameID = new SelectList(db.Employees, "ID", "employee_name");
            ViewBag.raw_nameID = new SelectList(db.RawMaterials, "ID", "raw_name");
            return View();
        }

        // POST: RawMatPurchases/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,raw_nameID,quantity,sum,date,employee_nameID")] RawMatPurchase rawMatPurchase)
        {
            if (ModelState.IsValid)
            {
                db.RawMatPurchases.Add(rawMatPurchase);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.employee_nameID = new SelectList(db.Employees, "ID", "employee_name", rawMatPurchase.employee_nameID);
            ViewBag.raw_nameID = new SelectList(db.RawMaterials, "ID", "raw_name", rawMatPurchase.raw_nameID);
            return View(rawMatPurchase);
        }

        // GET: RawMatPurchases/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RawMatPurchase rawMatPurchase = db.RawMatPurchases.Find(id);
            if (rawMatPurchase == null)
            {
                return HttpNotFound();
            }
            ViewBag.employee_nameID = new SelectList(db.Employees, "ID", "employee_name", rawMatPurchase.employee_nameID);
            ViewBag.raw_nameID = new SelectList(db.RawMaterials, "ID", "raw_name", rawMatPurchase.raw_nameID);
            return View(rawMatPurchase);
        }

        // POST: RawMatPurchases/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,raw_nameID,quantity,sum,date,employee_nameID")] RawMatPurchase rawMatPurchase)
        {
            if (ModelState.IsValid)
            {
                db.Entry(rawMatPurchase).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.employee_nameID = new SelectList(db.Employees, "ID", "employee_name", rawMatPurchase.employee_nameID);
            ViewBag.raw_nameID = new SelectList(db.RawMaterials, "ID", "raw_name", rawMatPurchase.raw_nameID);
            return View(rawMatPurchase);
        }

        // GET: RawMatPurchases/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RawMatPurchase rawMatPurchase = db.RawMatPurchases.Find(id);
            if (rawMatPurchase == null)
            {
                return HttpNotFound();
            }
            return View(rawMatPurchase);
        }

        // POST: RawMatPurchases/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RawMatPurchase rawMatPurchase = db.RawMatPurchases.Find(id);
            db.RawMatPurchases.Remove(rawMatPurchase);
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
