using Microsoft.AspNetCore.Mvc;
using PlanoCondoAPI._2___Interface;
using PlanoCondoAPI._2___Services;
using PlanoCondoAPI._4___Domain.DTO;

namespace PlanoCondoAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PlansController : ControllerBase
    {
        private readonly ILogger<PlansController> _logger;
        private readonly IPlanService _planService;

        public PlansController(ILogger<PlansController> logger,
                                IPlanService plansService)
        {
            _logger = logger;
            _planService = plansService;
        }

        [Route("Get")]
        [HttpGet]
        public PlansDTO Get(string planId)
        {
            return _planService.Get(planId);
        }

        [Route("GetAll")]
        [HttpGet]
        public List<PlansDTO> GetAll()
        {
            return _planService.GetAll();
        }

        [Route("GetPrimaryPlans")]
        [HttpGet]
        public List<PlansDTO> GetPrimaryPlans()
        {
            return _planService.GetPrimaryPlans();
        }

        [Route("Create")]
        [HttpPost]
        public IActionResult Create([FromBody] PlansDTO plansDTO)
        {
            if (plansDTO == null) return BadRequest();

            var listErrors = _planService.Create(plansDTO);
            if (listErrors.Any()) { return BadRequest(listErrors); }
            return Ok("Plano de conta inserido com sucesso.");
        }

        [Route("Update")]
        [HttpPut]
        public IActionResult Update([FromBody] PlansDTO plansDTO)
        {
            if (plansDTO == null) return BadRequest();

            var listErrors = _planService.Update(plansDTO);
            if (listErrors.Any()) { return BadRequest(listErrors); }
            return Ok("Plano de conta alterado com sucesso.");
        }

        [Route("Delete")]
        [HttpDelete]
        public IActionResult Delete(int id)
        {
            var deleted = _planService.Delete(id);
            if (!deleted) { return NotFound(); }
            return NoContent();
        }

        [Route("suggest-next-code/{parentPlanId}")]
        [HttpGet]
        public ActionResult<string> SuggestNextCode(string parentPlanId)
        {
            return Ok(_planService.SuggestNextPlanCode(parentPlanId));
        }

    }
}
