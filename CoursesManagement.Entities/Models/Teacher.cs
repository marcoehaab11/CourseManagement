using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoursesManagement.Entities.Models
{
    public class Teacher
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int? CourseId { get; set; }
        public Course Course { get; set; }
        public List<StudentCourse>? StudentCourses { get; set; }

    }
}
