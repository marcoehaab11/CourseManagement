using CoursesManagement.DataAccess.Data;
using Microsoft.EntityFrameworkCore;
using myshop.DataAccess.Implementation;
using myshop.Entities.Repositories;
using Microsoft.AspNetCore.Identity;
using CoursesManagement.DataAccess.Implementation;
using Microsoft.AspNetCore.Identity.UI.Services;
using System.Security.Principal;

namespace CoursesManagement
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();
            builder.Services.AddRazorPages();
            builder.Services.AddDbContext<ApplicationDbContext>(options =>
                options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

            builder.Services.AddIdentity<IdentityUser, IdentityRole>()
                .AddDefaultTokenProviders()
                .AddDefaultUI()
                .AddEntityFrameworkStores<ApplicationDbContext>();

            builder.Services.AddScoped<IUnitOfWork, UnitOfWork>();
            builder.Services.AddSingleton<IEmailSender, EmailSender>();

            var app = builder.Build();

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();

            app.MapRazorPages();

            app.MapGet("/", (IHttpContextAccessor httpContextAccessor) =>
            {
               
                return Results.Redirect("/Identity/Account/Login");
            });

            app.MapControllerRoute(
                name: "Admin",
                pattern: "{area=Admin}/{controller=Home}/{action=Index}/{id?}");
            app.MapControllerRoute(
                  name: "Student",
                     pattern: "{area=Student}/{controller=Home}/{action=Index}/{id?}");


            app.Run();
        }
    }
}
