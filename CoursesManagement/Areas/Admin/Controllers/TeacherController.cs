using CoursesManagement.Entities.Models;
using CoursesManagement.Entities.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using myshop.Entities.Repositories;

namespace CoursesManagement.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class TeacherController : Controller
    {
        private IUnitOfWork _unitOfWork;

        public TeacherController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public IActionResult Index()
        {
            var coueses = _unitOfWork.Teacher.GetAll(null,"Course");
            return View(coueses);
        }
        [HttpGet]
        public IActionResult Create()
        {
            TeacherVM teacherVM = new TeacherVM()
            {
                Name = "",
                CourseList = _unitOfWork.Course.GetAll().Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = x.Id.ToString()
                })
            };
            return View(teacherVM);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(TeacherVM teacherVM)
        {   //Server Side Validation
            if (ModelState.IsValid)
            {
                Teacher teacher = new Teacher();
                teacher.Name = teacherVM.Name;
                teacher.CourseId = teacherVM.CourseId;

                _unitOfWork.Teacher.Add(teacher);

                _unitOfWork.Complete();

                return Redirect("/Admin/Teacher/Index");
            }
            return View(teacherVM);

        }
        [HttpGet]
        public IActionResult Edit(int? id)
        {
            if (id == null || id == 0)
            {
                NotFound();
            }
            Teacher teacher = _unitOfWork.Teacher.GetById(i => i.Id == id,Includeword:"Course");
            TeacherVM teacherVM = new TeacherVM()
            {   Id=teacher.Id,
                Name = teacher.Name,
                CourseId = teacher.CourseId,
                CourseList = _unitOfWork.Course.GetAll().Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = x.Id.ToString()
                })
            };
            return View(teacherVM);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(TeacherVM teacherVM)
        {  
            //Server Side Validation
            if (ModelState.IsValid)
            {
                Teacher teacher = new Teacher()
                {
                    Id = teacherVM.Id,
                    Name = teacherVM.Name,
                    CourseId = teacherVM.CourseId
                };
              

                _unitOfWork.Teacher.Update(teacher);
                _unitOfWork.Complete();


                return Redirect("/Admin/Teacher/Index");
            }
            return View(teacherVM);

        }

        [HttpGet]
        public IActionResult Delete(int? id)
        {
            if (id == null || id == 0)
            {
                NotFound();
            }


            Teacher teacher = _unitOfWork.Teacher.GetById(i => i.Id == id, Includeword: "Course");
            TeacherVM teacherVM = new TeacherVM()
            {
                Id = teacher.Id,
                Name = teacher.Name,
                CourseId = teacher.CourseId,
                CourseList = _unitOfWork.Course.GetAll().Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = x.Id.ToString()
                })
            };

            return View(teacherVM);
        }
        [HttpPost]
        [AutoValidateAntiforgeryToken]
        public IActionResult Delete(TeacherVM teacherVM)
        {
            Teacher teacher = new Teacher()
            {
                Id = teacherVM.Id,
                CourseId = teacherVM.CourseId
            };
            _unitOfWork.Teacher.Delete(teacher);
            _unitOfWork.Complete();
            return Redirect("/Admin/Teacher/Index");

        }
    }
}

