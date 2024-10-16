using CoursesManagement.DataAccess.Data;
using CoursesManagement.DataAccess.Implementation;
using CoursesManagement.Entities.Repositories;
using myshop.Entities.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace myshop.DataAccess.Implementation
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly ApplicationDbContext _context;
        public ICourseRepository Course { get;  set; }
        public ITeacherRepository Teacher { get;  set; }
        public IStudentCourseRepository StudentCourse { get;  set; }


        public UnitOfWork(ApplicationDbContext context)
        {
            _context = context;
            Course = new CourseRepository(context);
            Teacher = new TeacherRepository(context);
            StudentCourse = new StudentCourseRepository(context);
       
        }


        public int Complete()
        {
            return _context.SaveChanges();
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
