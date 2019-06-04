defmodule Eazip.Commands do
  @moduledoc """
  The Commands context.
  """

  import Ecto.Query, warn: false
  alias Ecto.Multi
  alias Eazip.Repo

  alias Eazip.Commands.{Command, CommandService}

  @doc """
  Returns the list of commands.

  ## Examples

      iex> list_commands()
      [%Command{}, ...]

  """
  def list_commands do
    Command
    |> Repo.all()
    |> Repo.preload([{:services, [:clothe, {:alteration, :alteration_category}]}])
  end

  @doc """
  Gets a single command.

  Raises `Ecto.NoResultsError` if the Command does not exist.

  ## Examples

      iex> get_command!(123)
      %Command{}

      iex> get_command!(456)
      ** (Ecto.NoResultsError)

  """
  def get_command!(id) do
    Command
    |> Repo.get!(id)
    |> Repo.preload([{:services, [:clothe, {:alteration, :alteration_category}]}])
  end

  @doc """
  Creates a command.

  ## Examples

      iex> create_command(%{field: value})
      {:ok, %Command{}}

      iex> create_command(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_command(attrs \\ %{}) do
    {:ok, %{command: command}} = Repo.transaction(create_command_join_services(attrs))

    {:ok, Repo.preload(command, [{:services, [:clothe, {:alteration, :alteration_category}]}])}
  end

  defp create_command_join_services(%{"services" => services} = attrs) do
    Multi.new()
    |> Multi.insert(:command, Command.changeset(%Command{}, attrs))
    |> Multi.run(:command_services, fn _repo, %{command: command} ->
      services
      |> Enum.map(fn service_id -> %{command_id: command.id, service_id: service_id} end)
      |> Enum.map(&CommandService.changeset(%CommandService{}, &1))
      |> Enum.map(&Repo.insert/1)

      {:ok, command}
    end)
  end

  def for_user(id) do
    query = from c in Command, where: c.customer_id == ^id

    Repo.all(query)
    |> Repo.preload([{:services, [:clothe, {:alteration, :alteration_category}]}])
  end

  def for_sewer(id) do
    query = from c in Command, where: c.sewer_id == ^id

    Repo.all(query)
    |> Repo.preload([{:services, [:clothe, {:alteration, :alteration_category}]}])
  end

  @doc """
  Updates a command.

  ## Examples

      iex> update_command(command, %{field: new_value})
      {:ok, %Command{}}

      iex> update_command(command, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_command(%Command{} = command, attrs) do
    command
    |> Command.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Command.

  ## Examples

      iex> delete_command(command)
      {:ok, %Command{}}

      iex> delete_command(command)
      {:error, %Ecto.Changeset{}}

  """
  def delete_command(%Command{} = command) do
    Repo.delete(command)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking command changes.

  ## Examples

      iex> change_command(command)
      %Ecto.Changeset{source: %Command{}}

  """
  def change_command(%Command{} = command) do
    Command.changeset(command, %{})
  end
end
