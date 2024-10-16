﻿using CoursesManagement.DataAccess.Data;
using CoursesManagement.Entities.Models;
using CoursesManagement.Entities.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoursesManagement.DataAccess.Implementation
{
    public class StudentCourseRepository : GenralRepository<StudentCourse>, IStudentCourseRepository
    {
        public StudentCourseRepository(ApplicationDbContext context) : base(context)
        {
        }
    }
}
