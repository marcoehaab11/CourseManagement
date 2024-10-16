using CoursesManagement.Entities.Models;
using CoursesManagement.Entities.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using myshop.Entities.Repositories;

namespace CoursesManagement.Areas.Student.Controllers
{

    [Area("Student")]
    [Authorize(Roles = "Student")]
    public class StudentController : Controller
    {
        private IUnitOfWork _unitOfWork;
        public StudentController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public IActionResult Index()
        {
            var coursesWithTeacher = _unitOfWork.StudentCourse.GetAll(x => x.StudentId == 1,"Course,Teacher");
           return View(coursesWithTeacher);
        }
        [HttpGet]
        public IActionResult AddNewCourse()
        {
            var hisCourse = _unitOfWork.StudentCourse.GetAll().Select(x=>x.CourseId);

            StudentVM studentVM = new StudentVM()
            {
                CourseList = _unitOfWork.Course.GetAll(item => !hisCourse.Contains(item.Id)).Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = x.Id.ToString()
                })
            };

            return View(studentVM);
        }

        [HttpPost]
        public IActionResult SelectTeacher(int CourseId)
        {
            if (ModelState.IsValid)
            {
                StudentVM studentVM = new StudentVM()
                {
                    TeacherList = _unitOfWork.Teacher.GetAll(x => x.CourseId == CourseId).Select(x => new SelectListItem
                    {
                        Text = x.Name,
                        Value = x.Id.ToString()
                    })
                };

                return View(studentVM);
            }

            return Redirect("/Student/Student/Index");

        }
        [HttpPost]
        public IActionResult AddCourseWithTeacher(int TeacherId)
        {
            if(ModelState.IsValid)
            {
                var Teacher =_unitOfWork.Teacher.GetById(x=>x.Id==TeacherId);
               
                StudentCourse studentCourse = new StudentCourse()
                { TeacherId = Teacher.Id,
                    CourseId = (int)Teacher.CourseId,
                    StudentId = 1
                };
                _unitOfWork.StudentCourse.Add(studentCourse);
                _unitOfWork.Complete();
              
                return Redirect("/Student/Student/Index");

            }
            return Redirect("/Student/Student/Index");
        }

        [HttpGet]
        public IActionResult EditTeacherForCourse(int Id)
        {
            var student = _unitOfWork.StudentCourse.GetById(x => x.Id == Id);
            if (student == null)
            {
                return NotFound();
            }
            StudentVM studentVM = new StudentVM()
            {
                Id = student.Id,
                CourseId = student.CourseId,
                TeacherId = student.TeacherId,
                CourseList = _unitOfWork.Course.GetAll().Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = x.Id.ToString()
                }),
                TeacherList = _unitOfWork.Teacher.GetAll(x=>x.CourseId==student.CourseId).Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = x.Id.ToString()
                })
            };
            return View(studentVM);
        }
        [HttpPost]
        public IActionResult EditTeacherForCourse(StudentVM studentVM)
        {
            StudentCourse student = _unitOfWork.StudentCourse.GetById(x=>x.Id==studentVM.Id);
            student.TeacherId=(int)studentVM.TeacherId;

            _unitOfWork.StudentCourse.Update(student);
            _unitOfWork.Complete();
            return Redirect("/Student/Student/Index");

        }
        [HttpGet]
        public IActionResult DeleteCourse(int Id)
        {
            var student = _unitOfWork.StudentCourse.GetById(x=>x.Id==Id);
            if (student==null)
            {
                return NotFound();
            }
            StudentVM studentVM = new StudentVM()
            {   Id = student.Id,
                CourseId=student.CourseId,
                TeacherId=student.TeacherId,
                CourseList = _unitOfWork.Course.GetAll().Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = x.Id.ToString()
                }),
                TeacherList = _unitOfWork.Teacher.GetAll().Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = x.Id.ToString()
                })
            };
            return View(studentVM);
        }

        [HttpPost]
        public IActionResult DeleteCourse(StudentVM studentVM)
        {
            StudentCourse student = new StudentCourse()
            {
                Id=studentVM.Id

            };
            _unitOfWork.StudentCourse.Delete(student);
            _unitOfWork.Complete();
            return Redirect("/Student/Student/Index");

        }
        
       


    }
}
