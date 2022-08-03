defmodule GoogleAuthDemo.GoogleTokens do
  @moduledoc """
  Module for handling google tokens
  """

  alias GoogleAuthDemo.GoogleToken.GoogleToken

  @google_pems_url "https://www.googleapis.com/oauth2/v1/certs"

  def decode(jwt_encoded) do
    GoogleToken.verify_and_validate(jwt_encoded, get_signer(jwt_encoded))
  end

  defp get_signer(jwt) do
    Joken.Signer.create("RS256", get_public_keys(jwt))
  end

  defp get_public_keys(jwt) do
    {:ok, %{"kid" => key_id}} = Joken.peek_header(jwt)

    HTTPoison.get!(@google_pems_url)
    |> Map.get(:body)
    |> Jason.decode!()
    |> Map.get(key_id)
    |> then(&%{"pem" => &1})
  end
end
