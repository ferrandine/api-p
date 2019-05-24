defmodule Eazip.Sewers do
  @moduledoc """
  The Sewers context.
  """

  import Ecto.Query, warn: false
  alias Eazip.Repo

  alias Eazip.Sewers.SewerProfile
  # alias Eazip.Reviews.Review

  @doc """
  Returns the list of sewer_profiles.

  ## Examples

      iex> list_sewer_profiles()
      [%SewerProfile{}, ...]

  """
  def list_sewer_profiles do
    SewerProfile |> SewerProfile.get_rating() |> Repo.all() |> Repo.preload(:user)
  end

  @doc """
  Gets a single sewer_profile.

  Raises `Ecto.NoResultsError` if the Sewer profile does not exist.

  ## Examples

      iex> get_sewer_profile!(123)
      %SewerProfile{}

      iex> get_sewer_profile!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sewer_profile!(id) do
    SewerProfile
    |> SewerProfile.get_rating()
    |> where(id: ^id)
    |> Repo.one!()
    |> Repo.preload(:user)
  end

  @doc """
  Creates a sewer_profile.

  ## Examples

      iex> create_sewer_profile(%{field: value})
      {:ok, %SewerProfile{}}

      iex> create_sewer_profile(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sewer_profile(attrs \\ %{}) do
    %SewerProfile{}
    |> SewerProfile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sewer_profile.

  ## Examples

      iex> update_sewer_profile(sewer_profile, %{field: new_value})
      {:ok, %SewerProfile{}}

      iex> update_sewer_profile(sewer_profile, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sewer_profile(%SewerProfile{} = sewer_profile, attrs) do
    sewer_profile
    |> SewerProfile.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SewerProfile.

  ## Examples

      iex> delete_sewer_profile(sewer_profile)
      {:ok, %SewerProfile{}}

      iex> delete_sewer_profile(sewer_profile)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sewer_profile(%SewerProfile{} = sewer_profile) do
    Repo.delete(sewer_profile)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sewer_profile changes.

  ## Examples

      iex> change_sewer_profile(sewer_profile)
      %Ecto.Changeset{source: %SewerProfile{}}

  """
  def change_sewer_profile(%SewerProfile{} = sewer_profile) do
    SewerProfile.changeset(sewer_profile, %{})
  end
end
