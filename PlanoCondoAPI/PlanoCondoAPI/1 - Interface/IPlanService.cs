using PlanoCondoAPI._1___Interface;
using PlanoCondoAPI._3___Entities;
using PlanoCondoAPI._4___Domain.DTO;

namespace PlanoCondoAPI._2___Interface
{
    public interface IPlanService : ICrud<PlansDTO>
    {
        string SuggestNextPlanCode(string parentPlanId);
    }
}
