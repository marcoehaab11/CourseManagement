using System.Linq.Expressions;

namespace CoursesManagement.Entities.Repositories
{
    public interface IGenralRepository<T> where T:class
    {
        IEnumerable<T> GetAll(Expression<Func<T, bool>>? perdicate = null, string? Includeword = null); 
        T GetById(Expression<Func<T, bool>>? perdicate = null, string? Includeword = null);
        void Add(T entity);
        void Update(T entity);
        void Delete(T entity);
    }
}
