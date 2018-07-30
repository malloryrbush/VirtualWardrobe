using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using VirtualWardrobeV3;

namespace VirtualWardrobeV3.Controllers
{
    public class ClothingsController : Controller
    {
        private VirtualWardobeV3Entities db = new VirtualWardobeV3Entities();

        // GET: Clothings
        public ActionResult Index()
        {
            var clothings = db.Clothings.Include(c => c.Accessory).Include(c => c.Bottom).Include(c => c.Sho).Include(c => c.Top);
            return View(clothings.ToList());
        }

        // GET: Clothings/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clothing clothing = db.Clothings.Find(id);
            if (clothing == null)
            {
                return HttpNotFound();
            }
            return View(clothing);
        }

        // GET: Clothings/Create
        public ActionResult Create()
        {
            ViewBag.AccessoryID = new SelectList(db.Accessories, "AccessoryID", "Name");
            ViewBag.BottomID = new SelectList(db.Bottoms, "BottomID", "Name");
            ViewBag.ShoeID = new SelectList(db.Shoes, "ShoeID", "Name");
            ViewBag.TopID = new SelectList(db.Tops, "TopID", "Name");
            return View();
        }

        // POST: Clothings/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ClothingID,TopID,BottomID,ShoeID,AccessoryID")] Clothing clothing)
        {
            if (ModelState.IsValid)
            {
                db.Clothings.Add(clothing);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AccessoryID = new SelectList(db.Accessories, "AccessoryID", "Name", clothing.AccessoryID);
            ViewBag.BottomID = new SelectList(db.Bottoms, "BottomID", "Name", clothing.BottomID);
            ViewBag.ShoeID = new SelectList(db.Shoes, "ShoeID", "Name", clothing.ShoeID);
            ViewBag.TopID = new SelectList(db.Tops, "TopID", "Name", clothing.TopID);
            return View(clothing);
        }

        // GET: Clothings/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clothing clothing = db.Clothings.Find(id);
            if (clothing == null)
            {
                return HttpNotFound();
            }
            ViewBag.AccessoryID = new SelectList(db.Accessories, "AccessoryID", "Name", clothing.AccessoryID);
            ViewBag.BottomID = new SelectList(db.Bottoms, "BottomID", "Name", clothing.BottomID);
            ViewBag.ShoeID = new SelectList(db.Shoes, "ShoeID", "Name", clothing.ShoeID);
            ViewBag.TopID = new SelectList(db.Tops, "TopID", "Name", clothing.TopID);
            return View(clothing);
        }

        // POST: Clothings/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ClothingID,TopID,BottomID,ShoeID,AccessoryID")] Clothing clothing)
        {
            if (ModelState.IsValid)
            {
                db.Entry(clothing).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AccessoryID = new SelectList(db.Accessories, "AccessoryID", "Name", clothing.AccessoryID);
            ViewBag.BottomID = new SelectList(db.Bottoms, "BottomID", "Name", clothing.BottomID);
            ViewBag.ShoeID = new SelectList(db.Shoes, "ShoeID", "Name", clothing.ShoeID);
            ViewBag.TopID = new SelectList(db.Tops, "TopID", "Name", clothing.TopID);
            return View(clothing);
        }

        // GET: Clothings/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clothing clothing = db.Clothings.Find(id);
            if (clothing == null)
            {
                return HttpNotFound();
            }
            return View(clothing);
        }

        // POST: Clothings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Clothing clothing = db.Clothings.Find(id);
            db.Clothings.Remove(clothing);
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
