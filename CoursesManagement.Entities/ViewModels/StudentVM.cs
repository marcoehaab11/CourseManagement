using CoursesManagement.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace CoursesManagement.Entities.ViewModels
{
    public class StudentVM
    {   
        public int Id { get; set; }
        public int? CourseId { get; set; }
        public int? TeacherId { get; set; }
        [ValidateNever]
        public IEnumerable<SelectListItem>? CourseList { get; set; }
        [ValidateNever]
        public IEnumerable<SelectListItem>? TeacherList { get; set; }

    }
}
