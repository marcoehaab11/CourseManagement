using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CoursesManagement.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class UpdateStudentTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Students_Teachers_SelectedTeacherId",
                table: "Students");

            migrationBuilder.DropIndex(
                name: "IX_Students_SelectedTeacherId",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "SelectedTeacherId",
                table: "Students");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "SelectedTeacherId",
                table: "Students",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Students_SelectedTeacherId",
                table: "Students",
                column: "SelectedTeacherId");

            migrationBuilder.AddForeignKey(
                name: "FK_Students_Teachers_SelectedTeacherId",
                table: "Students",
                column: "SelectedTeacherId",
                principalTable: "Teachers",
                principalColumn: "Id");
        }
    }
}
