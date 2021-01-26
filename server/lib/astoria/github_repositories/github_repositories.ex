defmodule Astoria.GithubRepositories do
  alias Astoria.{GithubInstallations, GithubRepositories, Repo}
  alias AstoriaWeb.{Schema}

  @doc """
  How many repositories have been created
  """
  @spec count() :: :ok
  def count do
    GithubRepositories.GithubRepository.count()
    |> Repo.one()
  end

  @doc """
  Indicates that this repository has seen activity
  """
  @spec indicate_activity(%GithubInstallations.GithubInstallation{}) ::
          {:ok, %GithubInstallations.GithubInstallation{}} | {:error, Ecto.Changeset.t()}
  def indicate_activity(github_repository) do
    with changeset <-
           GithubRepositories.GithubRepository.changeset(github_repository, %{
             last_activity_at: DateTime.utc_now()
           }),
         {:ok, github_repository} <- Repo.update(changeset),
         :ok <-
           Schema.QueuedPublisher.enqueue(
             [
               AstoriaWeb.Endpoint,
               github_repository,
               [github_repository_updated: "#{github_repository.pub_id}"]
             ],
             id: github_repository.pub_id,
             window: 2
           ),
         do: {:ok, github_repository}
  end
end
