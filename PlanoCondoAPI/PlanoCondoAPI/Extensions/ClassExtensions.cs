using PlanoCondoAPI._3___Entities;
using PlanoCondoAPI._4___Domain.DTO;

namespace PlanoCondoAPI.Extensions
{
    public static class ClassExtensions
    {
        public static TypePlansDTO ToDto(this TypePlans entity)
        {
            if (entity == null) { return null; }

            return new TypePlansDTO
            {
                TypePlanId = entity.TypePlanId,
                TypePlanName = entity.TypePlanName
            };
        }

        public static PlansDTO ToDto(this Plans entity)
        {
            if (entity == null) { return null; }

            return new PlansDTO
            {
                PlanId = entity.PlanId,
                PlanName = entity.PlanName,
                TypePlanId = entity.TypePlanId,
                ParentPlanId = entity.ParentPlanId,
                AllowRelease = entity.AllowRelease
            };
        }
    }
}
