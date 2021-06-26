using gerenciamento_aniversario.domain;
using gerenciamento_aniversario.repository;
using Newtonsoft.Json;
using System;
using System.Linq;

namespace gerenciamento_aniversario
{
	class Program
	{
		private static RepositoryPessoa RepositoryPessoa = new RepositoryPessoa();
		static void Main(string[] args)
		{
			Console.ForegroundColor = ConsoleColor.DarkCyan;

			Console.WriteLine("╠══===== Gerênciamento de Aniversários ======══╣");
			Console.WriteLine("");
			var sair = false;

			while (!sair)
			{
				ExibeOpções();
				var opt = Console.ReadLine();
				switch(opt)
				{
					case "1":
						BuscarPessoa();
						break;
					case "2":
						CadastrarPessoa();
						break;
					case "3":
						AtualizarCadastro();
						break;
					case "4":
						ExcluirCadastro();
						break;
					case "5":
						sair = true;
						break;
					default:
						Console.WriteLine("Opção inválida!");
						break;
				}
			}
		}

		private static void ExcluirCadastro()
		{
			Console.WriteLine("");
			var pessoas = RepositoryPessoa.GetAll();

			foreach (var pessoa in pessoas)
			{
				Console.WriteLine($"{pessoa.Id} - {pessoa.Nome} {pessoa.Sobrenome}");
			}

			Console.WriteLine("Digite o identificador do cadastro para realizar a exclusão");

			var id = Convert.ToInt32(Console.ReadLine());

			var pessoaId = RepositoryPessoa.GetPessoaById(id);

			if (pessoaId == null)
				Console.WriteLine("Pessoa não encontrada.");
			else
			{
				RepositoryPessoa.Delete(id);
				Console.WriteLine("Cadastro excluído com sucesso!");
			}
		}

		private static void AtualizarCadastro()
		{
			Console.WriteLine("");
			var pessoas = RepositoryPessoa.GetAll();

			foreach (var pessoa in pessoas)
			{
				Console.WriteLine($"{pessoa.Id} - {pessoa.Nome} {pessoa.Sobrenome}");
			}

			Console.WriteLine("Digite o identificador do cadastro: ");

			var id = Convert.ToInt32(Console.ReadLine());
			var pessoaId = RepositoryPessoa.GetPessoaById(id);

			if (pessoaId == null)
			{
				Console.WriteLine("Cadastro não encontrado.");
			}
			else
			{

				Console.WriteLine("Digite o nome: ");
				pessoaId.Nome = Console.ReadLine();

				Console.WriteLine("Digite o sobrenome: ");
				pessoaId.Sobrenome = Console.ReadLine();

				Console.WriteLine("Digite a data do aniversário no formato dd/MM/yyyy: ");
				pessoaId.DataDeAniversario = Convert.ToDateTime(Console.ReadLine());

				RepositoryPessoa.Update(pessoaId, id);

				Console.WriteLine("Cadastro atualizado com sucesso!");
			}
		}

		private static void ExibeOpções()
		{
			Console.ForegroundColor = ConsoleColor.DarkCyan;
			Console.WriteLine("******* Aniversariantes de hoje *******");
			Console.ForegroundColor = ConsoleColor.White;
			Console.WriteLine("");
			AniversariantesDeHoje();
			Console.ForegroundColor = ConsoleColor.DarkCyan;
			Console.WriteLine("");
			Console.WriteLine("Selecione as opções");
			Console.WriteLine("1 - Pesquisar pessoas");
			Console.WriteLine("2 - Adicionar nova pessoa");
			Console.WriteLine("3 - Atualizar cadastro");
			Console.WriteLine("4 - Excluir cadastro");
			Console.WriteLine("5 - Sair");
		}

		private static void BuscarPessoa()
		{
			Console.Clear();
			Console.WriteLine("Digite o nome da pessoa que deseja buscar: ");
			var nomePesquisado = Console.ReadLine();
			Pessoa pessoaAniversariante = new Pessoa();
			var pessoaBuscada = RepositoryPessoa.GetNome(nomePesquisado);
			if ((pessoaBuscada.Count == 0) || (nomePesquisado.Length == 0))
			{
				Console.WriteLine("Pessoa não encontrada!");
			} else {
				Console.WriteLine("Selecione uma das opções abaixo para visualizar os dados das pessoas encontradas: ");

				foreach (var pessoa in pessoaBuscada)
				{
					Console.WriteLine($"{pessoa.Id} - {pessoa.Nome} {pessoa.Sobrenome}");
				}

				var opt = Convert.ToInt32(Console.ReadLine());
				var aniversariante = RepositoryPessoa.GetPessoaById(opt);
				var proximoAniversario = pessoaAniversariante.AniversarioCountdown(aniversariante.DataDeAniversario);
				Console.WriteLine("");
				Console.WriteLine($"Dados do aniversariante {aniversariante.Nome}");
				Console.WriteLine($"Nome completo: {aniversariante.Nome} {aniversariante.Sobrenome}");
				Console.WriteLine($"Data do aniversário: {aniversariante.DataDeAniversario}");
				Console.WriteLine($"Faltam {proximoAniversario} dias para esse aniversário.");
				Console.WriteLine("");
			}
		}
		private static void AniversariantesDeHoje()
		{
			var pessoa = new Pessoa();
			pessoa.AniversariantesHoje(RepositoryPessoa.GetAll());
		}
		private static void CadastrarPessoa()
		{
			var pessoa = new Pessoa();
			Console.Clear();
			Console.WriteLine("Digite o nome da pessoa que deseja adicionar: ");
			pessoa.Nome = Console.ReadLine();

			Console.WriteLine("Digite o sobrenome da pessoa que deseja adicionar: ");
			pessoa.Sobrenome = Console.ReadLine();

			Console.WriteLine("Digite a data do aniversário no formato dd/MM/yyyy: ");
			pessoa.DataDeAniversario = Convert.ToDateTime(Console.ReadLine());

			Console.WriteLine("Os dados estão corretos?");
			Console.WriteLine($"Nome: {pessoa.Nome}");
			Console.WriteLine($"Sobrenome: {pessoa.Sobrenome}");
			Console.WriteLine($"Data do aniversário: {pessoa.DataDeAniversario}");
			Console.WriteLine("Sim - 1");
			Console.WriteLine("Não - 2");
			var opt = Console.ReadLine();
			if (opt == "1")
			{
				Console.WriteLine("");
				RepositoryPessoa.Create(pessoa);
				Console.WriteLine("Dados adicionados com sucesso!");
			}
			else if (opt == "2")
			{
				Console.Clear();
				CadastrarPessoa();
			}
		}
	}

}
