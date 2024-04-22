using PlanoCondoAPI._4___Domain.Enums;

namespace PlanoCondoAPI._4___Domain.DTO
{
    public class PlansTypeRelationshipDTO
    {
        public int PlansTypeID { get; set; }
        public string PlanId { get; set; }
        public bool AllowRelease { get; set; }
        public string PlanName { get; set; }
        public string TypePlanName { get; set; }
        public EnumTypePlans TypePlans { get; set; }

    }
}
