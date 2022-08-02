defmodule GoogleAuthDemo.Users do
  @moduledoc """
  Module for manipulating the user struct
  """

  alias GoogleAuthDemo.User
  alias GoogleAuthDemo.Repo

  def create(claims) do
    %User{}
    |> User.changeset(claims)
    |> Repo.insert()
  end

  def get_by_email(email) do
    Repo.get_by(User, email: email)
  end

  def create_if_not_exists(claims) do
    case get_by_email(claims["email"]) do
      nil -> create(claims)
      user -> {:ok, user}
    end
  end
end
