using CoursesManagement.DataAccess.Data;
using CoursesManagement.Entities.Models;
using CoursesManagement.Entities.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoursesManagement.DataAccess.Implementation
{
    public class CourseRepository : GenralRepository<Course>, ICourseRepository
    {
        public CourseRepository(ApplicationDbContext context) : base(context)
        {
        }
    }
}
