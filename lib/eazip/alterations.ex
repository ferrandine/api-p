defmodule Eazip.Alterations do
  @moduledoc """
  The Alterations context.
  """

  import Ecto.Query, warn: false
  alias Eazip.Repo

  alias Eazip.Alterations.Alteration

  @doc """
  Returns the list of alterations.

  ## Examples

      iex> list_alterations()
      [%Alteration{}, ...]

  """
  def list_alterations do
    Repo.all(Alteration)
  end

  @doc """
  Gets a single alteration.

  Raises `Ecto.NoResultsError` if the Alteration does not exist.

  ## Examples

      iex> get_alteration!(123)
      %Alteration{}

      iex> get_alteration!(456)
      ** (Ecto.NoResultsError)

  """
  def get_alteration!(id), do: Repo.get!(Alteration, id)

  @doc """
  Creates a alteration.

  ## Examples

      iex> create_alteration(%{field: value})
      {:ok, %Alteration{}}

      iex> create_alteration(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_alteration(attrs \\ %{}) do
    %Alteration{}
    |> Alteration.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a alteration.

  ## Examples

      iex> update_alteration(alteration, %{field: new_value})
      {:ok, %Alteration{}}

      iex> update_alteration(alteration, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_alteration(%Alteration{} = alteration, attrs) do
    alteration
    |> Alteration.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Alteration.

  ## Examples

      iex> delete_alteration(alteration)
      {:ok, %Alteration{}}

      iex> delete_alteration(alteration)
      {:error, %Ecto.Changeset{}}

  """
  def delete_alteration(%Alteration{} = alteration) do
    Repo.delete(alteration)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking alteration changes.

  ## Examples

      iex> change_alteration(alteration)
      %Ecto.Changeset{source: %Alteration{}}

  """
  def change_alteration(%Alteration{} = alteration) do
    Alteration.changeset(alteration, %{})
  end

  alias Eazip.Alterations.AlterationCategory

  @doc """
  Returns the list of alteration_categories.

  ## Examples

      iex> list_alteration_categories()
      [%AlterationCategory{}, ...]

  """
  def list_alteration_categories do
    Repo.all(AlterationCategory)
  end

  @doc """
  Gets a single alteration_category.

  Raises `Ecto.NoResultsError` if the Alteration category does not exist.

  ## Examples

      iex> get_alteration_category!(123)
      %AlterationCategory{}

      iex> get_alteration_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_alteration_category!(id), do: Repo.get!(AlterationCategory, id)

  @doc """
  Creates a alteration_category.

  ## Examples

      iex> create_alteration_category(%{field: value})
      {:ok, %AlterationCategory{}}

      iex> create_alteration_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_alteration_category(attrs \\ %{}) do
    %AlterationCategory{}
    |> AlterationCategory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a alteration_category.

  ## Examples

      iex> update_alteration_category(alteration_category, %{field: new_value})
      {:ok, %AlterationCategory{}}

      iex> update_alteration_category(alteration_category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_alteration_category(%AlterationCategory{} = alteration_category, attrs) do
    alteration_category
    |> AlterationCategory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a AlterationCategory.

  ## Examples

      iex> delete_alteration_category(alteration_category)
      {:ok, %AlterationCategory{}}

      iex> delete_alteration_category(alteration_category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_alteration_category(%AlterationCategory{} = alteration_category) do
    Repo.delete(alteration_category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking alteration_category changes.

  ## Examples

      iex> change_alteration_category(alteration_category)
      %Ecto.Changeset{source: %AlterationCategory{}}

  """
  def change_alteration_category(%AlterationCategory{} = alteration_category) do
    AlterationCategory.changeset(alteration_category, %{})
  end
end
