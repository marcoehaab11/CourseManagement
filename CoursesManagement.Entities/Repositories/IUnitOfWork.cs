using CoursesManagement.Entities.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace myshop.Entities.Repositories
{
    public interface IUnitOfWork:IDisposable
    {
        public ICourseRepository Course { get; set; }
        public ITeacherRepository Teacher { get; set; }
        public IStudentCourseRepository StudentCourse { get; set; }
        int Complete();
    }
}
