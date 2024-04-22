using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PlanoCondoAPI._3___Entities
{
    [Table("TypePlans")]
    public class TypePlans
    {
        [Key]
        public int TypePlanId { get; set; }
        public string TypePlanName { get; set; }
    }
}
