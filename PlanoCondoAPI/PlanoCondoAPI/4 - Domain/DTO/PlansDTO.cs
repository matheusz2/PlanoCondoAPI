namespace PlanoCondoAPI._4___Domain.DTO
{
    public class PlansDTO
    {
        public string PlanId { get; set; }
        public string PlanName { get; set; }
        public string? ParentPlanId { get; set; }
        public int TypePlanId { get; set; }
        public bool AllowRelease { get; set; } = false;

    }
}