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
    public class ManufacturesController : Controller
    {
        private ClothingManufacture_Context db = new ClothingManufacture_Context();

        // GET: Manufactures
        public ActionResult Index()
        {            
            var manufacture = db.Manufacture.Include(m => m.EmployeeName).Include(m => m.FinProduct);
            return View(manufacture.ToList());
        }

        // GET: Manufactures/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Manufacture manufacture = db.Manufacture.Find(id);
            if (manufacture == null)
            {
                return HttpNotFound();
            }
            return View(manufacture);
        }

        // GET: Manufactures/Create
        public ActionResult Create()
        {
            ViewBag.employeeID = new SelectList(db.Employees, "ID", "employee_name");
            ViewBag.product_nameID = new SelectList(db.FinishedProducts, "ID", "product_name");
            return View();
        }

        // POST: Manufactures/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,product_nameID,quantity,date,employeeID")] Manufacture manufacture)
        {
            if (ModelState.IsValid)
            {
                //my dodocode
                try //Catch SaveChanges errors
                {
                    db.Manufacture.Add(manufacture);
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    ViewBag.ManufactureCreateEx = ex.ToString();
                    throw;
                }
                return RedirectToAction("Index");
            }

            ViewBag.employeeID = new SelectList(db.Employees, "ID", "employee_name", manufacture.employeeID);
            ViewBag.product_nameID = new SelectList(db.FinishedProducts, "ID", "product_name", manufacture.product_nameID);
            return View(manufacture);
        }

        // GET: Manufactures/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Manufacture manufacture = db.Manufacture.Find(id);
            if (manufacture == null)
            {
                return HttpNotFound();
            }
            ViewBag.employeeID = new SelectList(db.Employees, "ID", "employee_name", manufacture.employeeID);
            return View(manufacture);
        }

        // POST: Manufactures/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,product_nameID,quantity,date,employeeID")] Manufacture manufacture)
        {
            if (ModelState.IsValid)
            {
                db.Entry(manufacture).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.employeeID = new SelectList(db.Employees, "ID", "employee_name", manufacture.employeeID);
            return View(manufacture);
        }

        // GET: Manufactures/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Manufacture manufacture = db.Manufacture.Find(id);
            if (manufacture == null)
            {
                return HttpNotFound();
            }
            return View(manufacture);
        }

        // POST: Manufactures/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Manufacture manufacture = db.Manufacture.Find(id);
            db.Manufacture.Remove(manufacture);
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
