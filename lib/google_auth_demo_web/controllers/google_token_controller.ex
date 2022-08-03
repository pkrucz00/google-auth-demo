defmodule GoogleAuthDemoWeb.GoogleTokenController do
  use GoogleAuthDemoWeb, :controller

  alias GoogleAuthDemo.GoogleTokens
  alias GoogleAuthDemo.Users
  alias GoogleAuthDemo.CustomTokens

  def create(conn, %{"credential" => jwt_token_encoded}) do
    {:ok, user} =
      GoogleTokens.decode(jwt_token_encoded)
      |> Users.create_if_not_exists()

    {:ok, new_jwt, claims} = CustomTokens.get_signed_token(user.id)

    IO.inspect(claims, label: :claims)

    conn
    |> put_status(200)
    |> render("token.json", %{token: new_jwt})
  end
end
