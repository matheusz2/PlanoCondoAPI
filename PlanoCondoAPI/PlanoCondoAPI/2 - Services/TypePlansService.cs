using PlanoCondoAPI._2___Interface;
using PlanoCondoAPI._3___Entities;
using PlanoCondoAPI._4___Data;
using PlanoCondoAPI._4___Domain.DTO;
using PlanoCondoAPI.Extensions;
using System.Numerics;

namespace PlanoCondoAPI._2___Services
{
    public class TypePlansService : ITypePlansService
    {
        private readonly APIDbContext _dbContext;

        public TypePlansService(APIDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public List<string> Create(TypePlansDTO typePlan)
        {

            var listErrors = new List<string>();

            if (typePlan == null) { throw new ArgumentNullException("Objeto inválido"); }

            var entity = new TypePlans();
            entity.TypePlanId = typePlan.TypePlanId;
            entity.TypePlanName = typePlan.TypePlanName;
            _dbContext.Add(entity);
            _dbContext.SaveChanges();

            return listErrors;
        }

        public bool Delete(int id)
        {
            var entity = _dbContext.TypePlans.Find(id);
            if (entity == null) { return false; }
            _dbContext.TypePlans.Remove(entity);
            _dbContext.SaveChangesAsync();
            return true;
        }

        public TypePlansDTO Get(int id)
        {
            TypePlans? entity = _dbContext.TypePlans.Find(id);
            if(entity == null) { return new TypePlansDTO(); }
            return entity.ToDto();
        }

        public List<TypePlansDTO> GetAll()
        {
            var listTypePlan = new List<TypePlansDTO>();
            List<TypePlans> plans = _dbContext.TypePlans.ToList();

            foreach (var x in plans)
            {
                var typePlan = new TypePlansDTO();
                typePlan.TypePlanId = x.TypePlanId;
                typePlan.TypePlanName = x.TypePlanName;
                listTypePlan.Add(typePlan);
            }

            return listTypePlan;
        }

        public List<string> Update(TypePlansDTO typePlan)
        {
            var listErrors = new List<string>();

            if (typePlan == null || typePlan.TypePlanId <= 0) { throw new ArgumentNullException("Objeto inválido"); }

            var entity = _dbContext.TypePlans.Find(typePlan.TypePlanId);

            if (entity == null)
                listErrors.Add($"Não foi encontrado nenhum registro com o código [{typePlan.TypePlanId}]");

            entity.TypePlanId = typePlan.TypePlanId;
            entity.TypePlanName = typePlan.TypePlanName;

            _dbContext.SaveChanges();

            return listErrors;
        }
    }
}
