defmodule GoogleAuthDemoWeb.GoogleTokenController do
  use GoogleAuthDemoWeb, :controller

  alias GoogleAuthDemo.GoogleTokens
  alias GoogleAuthDemo.Users

  def create(conn, %{"credential" => jwt_token_encoded}) do
    {:ok, user} =
      GoogleTokens.decode(jwt_token_encoded)
      |> Users.create_if_not_exists()

    # IO.puts(user)

    conn
    |> put_status(200)
    |> render("user.json", %{user: user})
  end
end
