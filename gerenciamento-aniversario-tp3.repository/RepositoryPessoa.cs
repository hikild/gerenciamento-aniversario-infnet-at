using Dapper;
using gerenciamento_aniversario.domain;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace gerenciamento_aniversario.repository
{
	public class RepositoryPessoa : IRepositoryPessoa
	{
		private string ConnectionString { get; set; } = @"Data Source=DESKTOP-5DTAJ4D\HIKILD;Initial Catalog=AniversarioDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

		public void Create(Pessoa pessoa)
		{
			using (var connection = new SqlConnection(ConnectionString))
			{
				var sql = "dbo.InsertPessoa";

				connection.Execute(sql, new { Nome = pessoa.Nome,
											Sobrenome = pessoa.Sobrenome,
											DataDeAniversario = pessoa.DataDeAniversario }, 
											commandType: System.Data.CommandType.StoredProcedure);
			}
		}

		public void Delete(int id)
		{
			using (var connection = new SqlConnection(ConnectionString))
			{
				var sql = "dbo.DeletePessoa";

				connection.Execute(sql, new { IdPessoa = id }, commandType: System.Data.CommandType.StoredProcedure);
			}
		}

		public List<Pessoa> GetAll()
		{
			using (var connection = new SqlConnection(ConnectionString))
			{
				var sql = "dbo.SelectAllPessoa";

				return connection.Query<Pessoa>(sql, commandType: System.Data.CommandType.StoredProcedure).AsList();
			}
		}

		public Pessoa GetPessoaById(int idPessoa)
		{
			using (var connection = new SqlConnection(ConnectionString))
			{
				var sql = "dbo.SelectPessoaById";

				return connection.QueryFirstOrDefault<Pessoa>(sql, new { IdPessoa = idPessoa}, commandType: System.Data.CommandType.StoredProcedure);
			}
		}

		public List<Pessoa> GetNome(string nomePessoa)
		{
			using (var connection = new SqlConnection(ConnectionString))
			{
				var sql = "dbo.SelectNomePessoa";

				return connection.Query<Pessoa>(sql, new { NomePessoa = nomePessoa }, commandType: System.Data.CommandType.StoredProcedure).AsList();
			}
		}

		public void Update(Pessoa pessoa, int id)
		{
			using (var connection = new SqlConnection(ConnectionString))
			{
				var sql = "dbo.UpdatePessoa";

				connection.Execute(sql, new
				{
					Nome = pessoa.Nome,
					Sobrenome = pessoa.Sobrenome,
					DataDeAniversario = pessoa.DataDeAniversario,
					IdPessoa = pessoa.Id
				},
				commandType: System.Data.CommandType.StoredProcedure);
			}
		}
	}
}
