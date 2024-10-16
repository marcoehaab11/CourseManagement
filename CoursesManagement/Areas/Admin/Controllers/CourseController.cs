using CoursesManagement.Entities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using myshop.Entities.Repositories;

namespace CoursesManagement.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles ="Admin")]
    public class CourseController : Controller
    {
        //[Authorize(Roles = "Admin")]
        
        private IUnitOfWork _unitOfWork;

        public CourseController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public IActionResult Index()
        {
           var coueses= _unitOfWork.Course.GetAll();
            return View(coueses);
        }
        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Course course)
        {   //Server Side Validation
            if (ModelState.IsValid)
            {
                _unitOfWork.Course.Add(course);
                _unitOfWork.Complete();

                return Redirect("/Admin/Course/Index");
            }
            return View(course);

        }
        [HttpGet]
        public IActionResult Edit(int? id)
        {
            if (id == null || id == 0)
            {
                NotFound();
            }
            var course = _unitOfWork.Course.GetById(i=>i.Id==id);
            return View(course);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(Course course)
        {   //Server Side Validation
            if (ModelState.IsValid)
            {
                _unitOfWork.Course.Update(course);
                _unitOfWork.Complete();

                
                return Redirect("/Admin/Course/Index");
            }
            return View(course);

        }

        [HttpGet]
        public IActionResult Delete(int? id)
        {
            if (id == null || id == 0)
            {
                NotFound();
            }


            var course = _unitOfWork.Course.GetById(x => x.Id == id);

            return View(course);
        }
        [HttpPost]
        [AutoValidateAntiforgeryToken]
        public IActionResult Delete(Course course)
        {   

            _unitOfWork.Course.Delete(course);
            _unitOfWork.Complete();
            return  Redirect("/Admin/Course/Index");



        }
    }
}
