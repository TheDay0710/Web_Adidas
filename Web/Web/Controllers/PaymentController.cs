using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Web;

namespace Web.Controllers
{
    public class PaymentController : Controller
    {
        DBADIDASEntities db = new DBADIDASEntities();

        public ActionResult Index()
        {
            var dummyCart = new List<Product>
            {
                new Product { NamePro = "GIÀY ULTRABOOST LIGHT", Price = 5000000, ImagePro = "tải xuống.jpg" },
                new Product { NamePro = "ÁO THUN 3 SỌC", Price = 800000, ImagePro = "sh" }
            };

            ViewBag.Cart = dummyCart;
            ViewBag.Total = dummyCart.Sum(x => x.Price);

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ProcessOrder(OrderPro order)
        {
            if (ModelState.IsValid)
            {
                order.DateOrder = DateTime.Now;
                db.OrderProes.Add(order);
                db.SaveChanges();

                return RedirectToAction("Success", new { id = order.ID });
            }

            return View("Index", order);
        }

        public ActionResult Success(int? id)
        {
            if (id.HasValue)
            {
                var order = db.OrderProes.Find(id);
                return View(order);
            }

            return View();
        }
    }
}