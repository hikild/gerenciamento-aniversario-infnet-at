using gerenciamento_aniversario.domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace gerenciamento_aniversario.repository
{
	public interface IRepositoryPessoa
	{
		void Create(Pessoa pessoa);
		void Update(Pessoa pessoa, int id);
		void Delete(int id);
		Pessoa GetPessoaById(int id);

		List<Pessoa> GetNome(string nome);
		List<Pessoa> GetAll();
	}
}
