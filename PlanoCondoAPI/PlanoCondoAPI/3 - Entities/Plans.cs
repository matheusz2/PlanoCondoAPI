using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PlanoCondoAPI._3___Entities
{
    [Table("Plans")]
    public class Plans
    {
        [Key]
        public string PlanId { get; set; }
        public string PlanName { get; set; }
        public string? ParentPlanId { get; set; } = string.Empty;
        public int TypePlanId { get; set; }
        public bool AllowRelease { get; set; }

        [ForeignKey("TypePlanId")]
        public virtual TypePlans TypePlans { get; set; }

    }
}