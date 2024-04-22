using Microsoft.AspNetCore.Mvc;

namespace PlanoCondoAPI._1___Interface
{
    public interface ICrud<T>
    {
        // Método para criar um novo objeto
        List<string> Create(T entity);

        // Método para obter uma lista de objeto
        List<T> GetAll();

        // Método para atualizar um objeto existente
        List<string> Update(T entity);

        // Método para excluir um objeto
        bool Delete(int id);
    }
}
