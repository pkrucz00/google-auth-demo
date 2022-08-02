defmodule GoogleAuthDemo.User do
  @moduledoc """
  User data in the database
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :picture, :string

    timestamps()
  end

  def changeset(webinar, attrs) do
    webinar
    |> cast(attrs, [:name, :email, :picture])
  end
end
