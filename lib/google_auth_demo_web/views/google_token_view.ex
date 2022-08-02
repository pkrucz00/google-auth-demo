defmodule GoogleAuthDemoWeb.GoogleTokenView do
  use GoogleAuthDemoWeb, :view

  def render("token.json", %{token: token}) do
    %{token: token}
  end

  def render("user.json", %{user: user}) do
    %{
      email: user.email,
      name: user.name,
      image: user.picture
    }
  end
end
