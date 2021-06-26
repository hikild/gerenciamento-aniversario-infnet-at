using System;
using System.Collections.Generic;

namespace gerenciamento_aniversario.domain
{
	public class Pessoa
	{
			public Pessoa() { }
			public int Id { get; set; }
			public string Nome { get; set; }
			public string Sobrenome { get; set; }
			public DateTime DataDeAniversario { get; set; }

		public int AniversarioCountdown(DateTime dataAniversario)
		{
			var proximoAniversario = dataAniversario.AddYears(DateTime.Today.Year - dataAniversario.Year);

			if (proximoAniversario < DateTime.Today)
			{
				proximoAniversario = proximoAniversario.AddYears(1);
			}

			return (proximoAniversario - DateTime.Today).Days;
		}

		public void AniversariantesHoje(List<Pessoa> pessoas)
		{
			List<Pessoa> aniversariantes = new List<Pessoa>();

			DateTime now = DateTime.Today;

			foreach (var pessoa in pessoas)
			{
				if (pessoa.DataDeAniversario == now)
				{
					aniversariantes.Add(pessoa);
				}
			}

			foreach(var aniversariante in aniversariantes)
			{
				Console.ForegroundColor = ConsoleColor.Yellow;
				Console.WriteLine($"Feliz aniversário {aniversariante.Nome} {aniversariante.Sobrenome}!");
			}
		}
	}
}
