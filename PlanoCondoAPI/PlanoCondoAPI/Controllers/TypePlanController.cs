using Microsoft.AspNetCore.Mvc;
using PlanoCondoAPI._2___Interface;
using PlanoCondoAPI._2___Services;
using PlanoCondoAPI._4___Domain.DTO;

namespace PlanoCondoAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TypePlanController : ControllerBase
    {
        private readonly ILogger<TypePlanController> _logger;
        private readonly ITypePlansService _typePlanService;

        public TypePlanController(ILogger<TypePlanController> logger,
                                ITypePlansService typePlanService)
        {
            _logger = logger;
            _typePlanService = typePlanService;
        }

        [Route("GetAll")]
        [HttpGet]
        public List<TypePlansDTO> GetAll()
        {
            return _typePlanService.GetAll();
        }

        [Route("Create")]
        [HttpPost]
        public IActionResult Create([FromBody] TypePlansDTO typePlansDTO)
        {
            if (typePlansDTO == null) return BadRequest();

            var listErrors = _typePlanService.Create(typePlansDTO);
            if (listErrors.Any()) { return BadRequest(listErrors); }
            return Ok("Tipo de plano de conta criado com sucesso.");
        }

        [Route("Update")]
        [HttpPut]
        public IActionResult Update([FromBody] TypePlansDTO typePlansDTO)
        {
            if (typePlansDTO == null) return BadRequest();

            var listErrors = _typePlanService.Update(typePlansDTO);
            if (listErrors.Any()) { return BadRequest(listErrors); }
            return Ok("Tipo de plano de conta alterado com sucesso.");
        }

        [Route("Delete")]
        [HttpDelete]
        public IActionResult Delete(int id)
        {
            var deleted = _typePlanService.Delete(id);
            if (!deleted) { return NotFound(); }
            return Ok(deleted);
        }
    }
}
