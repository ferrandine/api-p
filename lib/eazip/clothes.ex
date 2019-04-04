defmodule Eazip.Clothes do
  @moduledoc """
  The Clothes context.
  """

  import Ecto.Query, warn: false
  alias Eazip.Repo

  alias Eazip.Clothes.Clothe

  @doc """
  Returns the list of clothes.

  ## Examples

      iex> list_clothes()
      [%Clothe{}, ...]

  """
  def list_clothes do
    Repo.all(Clothe)
  end

  @doc """
  Gets a single clothe.

  Raises `Ecto.NoResultsError` if the Clothe does not exist.

  ## Examples

      iex> get_clothe!(123)
      %Clothe{}

      iex> get_clothe!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clothe!(id), do: Repo.get!(Clothe, id)

  @doc """
  Creates a clothe.

  ## Examples

      iex> create_clothe(%{field: value})
      {:ok, %Clothe{}}

      iex> create_clothe(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clothe(attrs \\ %{}) do
    %Clothe{}
    |> Clothe.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clothe.

  ## Examples

      iex> update_clothe(clothe, %{field: new_value})
      {:ok, %Clothe{}}

      iex> update_clothe(clothe, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clothe(%Clothe{} = clothe, attrs) do
    clothe
    |> Clothe.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Clothe.

  ## Examples

      iex> delete_clothe(clothe)
      {:ok, %Clothe{}}

      iex> delete_clothe(clothe)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clothe(%Clothe{} = clothe) do
    Repo.delete(clothe)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clothe changes.

  ## Examples

      iex> change_clothe(clothe)
      %Ecto.Changeset{source: %Clothe{}}

  """
  def change_clothe(%Clothe{} = clothe) do
    Clothe.changeset(clothe, %{})
  end
end
