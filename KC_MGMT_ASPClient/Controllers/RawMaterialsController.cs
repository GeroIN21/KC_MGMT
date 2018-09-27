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
    public class RawMaterialsController : Controller
    {
        private ClothingManufacture_Context db = new ClothingManufacture_Context();

        // GET: RawMaterials
        public ActionResult Index()
        {
            var rawMaterials = db.RawMaterials.Include(r => r.unitName);
            return View(rawMaterials.ToList());
        }

        // GET: RawMaterials/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RawMaterial rawMaterial = db.RawMaterials.Find(id);
            if (rawMaterial == null)
            {
                return HttpNotFound();
            }
            return View(rawMaterial);
        }

        // GET: RawMaterials/Create
        public ActionResult Create()
        {
            ViewBag.unitID = new SelectList(db.Units, "ID", "unit_name");
            return View();
        }

        // POST: RawMaterials/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,raw_name,unitID,sum,quantity")] RawMaterial rawMaterial)
        {
            if (ModelState.IsValid)
            {
                db.RawMaterials.Add(rawMaterial);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.unitID = new SelectList(db.Units, "ID", "unit_name", rawMaterial.unitID);
            return View(rawMaterial);
        }

        // GET: RawMaterials/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RawMaterial rawMaterial = db.RawMaterials.Find(id);
            if (rawMaterial == null)
            {
                return HttpNotFound();
            }
            ViewBag.unitID = new SelectList(db.Units, "ID", "unit_name", rawMaterial.unitID);
            return View(rawMaterial);
        }

        // POST: RawMaterials/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Edit(/*[Bind(Include = "ID,raw_name,unitID,sum,quantity")]*/ RawMaterial rawMaterial)
        {
            if (ModelState.IsValid)
            {
                db.Entry(rawMaterial).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.unitID = new SelectList(db.Units, "ID", "unit_name", rawMaterial.unitID);
            return View(rawMaterial);
        }

        // GET: RawMaterials/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RawMaterial rawMaterial = db.RawMaterials.Find(id);
            if (rawMaterial == null)
            {
                return HttpNotFound();
            }
            return View(rawMaterial);
        }

        // POST: RawMaterials/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RawMaterial rawMaterial = db.RawMaterials.Find(id);
            db.RawMaterials.Remove(rawMaterial);
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
