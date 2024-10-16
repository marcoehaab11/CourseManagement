using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoursesManagement.Entities.Models
{
    public class Course
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public List<Teacher>? Teachers { get; set; }
        public List<StudentCourse>? StudentCourses { get; set; }

    }
}
