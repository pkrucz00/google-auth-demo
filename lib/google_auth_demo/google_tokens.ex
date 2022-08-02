defmodule GoogleAuthDemo.GoogleTokens do
  @moduledoc """
  Module for handling google tokens
  """

  alias GoogleAuthDemo.GoogleToken.GoogleToken

  @client_secret "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"

  def decode(jwt_encoded) do
    signer = Joken.Signer.create("RS256", %{"pem" => @client_secret})

    {:ok, claims} =
      jwt_encoded
      # |> Joken.Signer.verify(signer)
      |> Joken.peek_claims()

    claims
  end
end
