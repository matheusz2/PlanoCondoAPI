using PlanoCondoAPI._2___Interface;
using PlanoCondoAPI._3___Entities;
using PlanoCondoAPI._4___Data;
using PlanoCondoAPI._4___Domain.DTO;
using PlanoCondoAPI.Extensions;
using System.Numerics;
using System.Reflection.Metadata.Ecma335;

namespace PlanoCondoAPI._2___Services
{
    public class PlansService : IPlanService
    {
        private readonly APIDbContext _dbContext;

        public PlansService(APIDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public List<string> Create(PlansDTO plans)
        {
            if (plans == null) { throw new ArgumentNullException("Objeto inválido"); }

            var listErrors = new List<string>();


            if (_dbContext.Plans.Any(p => p.PlanId == plans.PlanId))
                listErrors.Add($"Já existe um registro com esse código [{plans.PlanId}]");

            listErrors.AddRange(PlansValidationRestrictions(plans));

            if (listErrors.Count > 0) { return listErrors; }

            var entity = new Plans();
            entity.PlanId = plans.PlanId;
            entity.PlanName = plans.PlanName;
            entity.ParentPlanId = plans.ParentPlanId;
            entity.TypePlanId = plans.TypePlanId;
            entity.AllowRelease = plans.AllowRelease;
            _dbContext.Add(entity);
            _dbContext.SaveChanges();
            return listErrors;
        }
        public bool Delete(int id)
        {
            var entity = _dbContext.Plans.Find(id);
            if (entity == null) { return false; }
            _dbContext.Plans.Remove(entity);
            _dbContext.SaveChangesAsync();
            return true;
        }

        public PlansDTO Get(string planId)
        {
            Plans? entity = _dbContext.Plans.FirstOrDefault(x => x.PlanId == planId);
            if (entity == null) { return new PlansDTO(); }
            return entity.ToDto();
        }

        public List<PlansDTO> GetAll()
        {
            var listPlans = new List<PlansDTO>();
            List<Plans> plans = _dbContext.Plans.ToList();

            foreach (Plans x in plans)
                listPlans.Add(x.ToDto());

            return listPlans;
        }

        public List<PlansDTO> GetPrimaryPlans()
        {
            var listPlans = new List<PlansDTO>();
            List<Plans> plans = _dbContext.Plans
                                .Where(x => !x.AllowRelease)
                                .ToList();

            foreach (Plans x in plans)
                listPlans.Add(x.ToDto());

            return listPlans;
        }

        public List<string> Update(PlansDTO plans)
        {
            if (plans == null || plans.PlanId == null) { throw new ArgumentNullException("Objeto inválido"); }

            var listErrors = new List<string>();

            var entity = _dbContext.Plans.FirstOrDefault(p => p.PlanId == plans.PlanId);
            if (entity == null)
            {
                listErrors.Add($"Não foi encontrado nenhum registro com o código {plans.PlanId}");
                return listErrors;
            }

            // Executar validações semelhantes às do Create
            listErrors.AddRange(PlansValidationRestrictions(plans));

            if (listErrors.Count > 0) { return listErrors; }  // Retorna erros de validação


            entity.PlanId = plans.PlanId;
            entity.PlanName = plans.PlanName;
            entity.TypePlanId = plans.TypePlanId;
            entity.AllowRelease = plans.AllowRelease;
            _dbContext.SaveChanges();

            return listErrors;
        }


        public List<string> PlansValidationRestrictions(PlansDTO plans)
        {

            var listErrors = new List<string>();

            // Uma conta com lançamento não pode ter filhos
            if (plans.AllowRelease && string.IsNullOrEmpty(plans.ParentPlanId))
                listErrors.Add("Não é possível inserir um plano de conta PAI que gere lançamentos e possua filhos.");

            // Se estiver sendo passado Parent será verificado e valida também que não pode realizar lançamento
            if (!string.IsNullOrEmpty(plans.ParentPlanId))
            {
                // Quando houver parent será feita está validação
                listErrors.AddRange(ValidationPlanParents(plans));
            }

            return listErrors;
        }

        public string SuggestNextPlanCode(string parentPlanId)
        {
            // Verifica a existência do plano pai
            if (!_dbContext.Plans.Any(p => p.PlanId == parentPlanId))
            {
                throw new ArgumentException("Plano PAI não existe.");
            }

            // Obter todos os planos que são filhos diretos do parentPlanId
            var childPlanIds = _dbContext.Plans
                .Where(p => p.PlanId.StartsWith(parentPlanId + "."))
                .Select(p => p.PlanId)
                .ToList();

            // Primeiro filho se não existirem outros.
            if (!childPlanIds.Any())
            {
                int lastNumber = int.Parse(parentPlanId.Substring(parentPlanId.LastIndexOf('.') + 1)) + 1;

                if (lastNumber > 999)
                {
                    var upOneLevel = parentPlanId.Contains('.') ? parentPlanId.Substring(0, parentPlanId.LastIndexOf('.')) : null;
                    if (upOneLevel == null)
                    {
                        return null; // Não é possível subir mais um nível, máximo alcançado
                    }

                    // Tenta encontrar o próximo código possível para o pai
                    return SuggestNextPlanCode(upOneLevel);
                }

                // Split do ParentPlanId
                string[] segments = parentPlanId.Split('.');

                // Substitui o último segmento pelo número incrementado
                segments[segments.Length - 1] = lastNumber.ToString();

                // Junta tudo de volta em um único string com pontos
                string updatedParentPlanId = string.Join(".", segments);



                return $"{updatedParentPlanId}";
            }

            // Extrai somente os códigos dos filhos que são diretamente um nível abaixo do parentPlanId
            var childCodes = childPlanIds
                .Where(id => id.Count(c => c == '.') == parentPlanId.Count(c => c == '.') + 1)
                .Select(id => int.Parse(id.Substring(id.LastIndexOf('.') + 1)))
                .ToList();

            if (!childCodes.Any())
            {
                return $"{parentPlanId}.1"; // Caso todos os filhos estejam em subníveis mais baixos.
            }

            var maxChildCode = childCodes.Max();

            // Verifica se o código máximo já alcançou o limite de 999.
            if (maxChildCode >= 999)
            {
                // Encontra o pai, ou retorna null se já está no topo
                var upOneLevel = parentPlanId.Contains('.') ? parentPlanId.Substring(0, parentPlanId.LastIndexOf('.')) : null;
                if (upOneLevel == null)
                {
                    return null; // Não é possível subir mais um nível, máximo alcançado
                }

                // Tenta encontrar o próximo código possível para o pai
                return SuggestNextPlanCode(upOneLevel);
            }

            return $"{parentPlanId}.{maxChildCode + 1}"; // Retorna o próximo código disponível.
        }

        public List<string> ValidationPlanParents(PlansDTO plans)
        {
            var listErrors = new List<string>();

            // Verifica se o plano existe e se o código do plano é único
            var parentPlan = _dbContext.Plans.FirstOrDefault(p => p.PlanId == plans.ParentPlanId);
            // Verifica se o ParentPlanId passado possui um registro
            if (parentPlan == null)
            {
                listErrors.Add($"Não existe o plano de conta filho passado.");
                return listErrors;
            }

            // Verifica se o tipo do plano do pai é igual o tipo do plano do filho
            if (parentPlan.TypePlanId != plans.TypePlanId)
                listErrors.Add($"O plano de conta PAI é diferente do tipo de plano FILHO.");

            // Verificar se o plano pai permite lançamentos e não possui filhos
            if (parentPlan.AllowRelease)
                listErrors.Add("O plano de conta PAI aceita lançamentos, não é possível criar o registro FILHO.");

            return listErrors;
        }
     
    }
}
