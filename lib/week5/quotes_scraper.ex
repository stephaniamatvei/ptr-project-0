defmodule Week5.QuotesScraper do
  @moduledoc """
  This module contains the Minimal Tasks for Week 5.
  """

  @doc """
  ## Task 1:
      Write an application that would visit this link: https://quotes.toscrape.com .
      Print out the HTTP response status code, response headers and response body.

  ## How to run:
      iex(1)> Week5.QuotesScraper.get_http_response
  """
  def get_http_response do
    IO.puts("STATUS CODE: #{get_url().status_code}\n
      HEADERS: #{inspect(get_url().headers)}\n
      BODY: #{get_url().body}")
  end

  defp get_url do
    HTTPoison.get!("https://quotes.toscrape.com")
  end

  @doc """
  ## Task 2:
      Continue your previous application. Extract all quotes from the HTTP response body.
      Collect the author of the quote, the quote text and tags.
      Save the data into a list of maps, each map representing a single quote.

  ## How to run:
      iex(1)> Week5.QuotesScraper.parse_http_response_body
  """
  def parse_http_response_body do
    get_url().body
    |> Floki.parse_document!()
    |> Floki.find(".quote")
    |> Enum.map(fn q ->
      %{
        Author: Floki.find(q, ".author") |> Enum.map(fn author -> Floki.text(author) end),
        Text:
          Floki.find(q, ".text")
          |> Enum.map(fn text -> Floki.text(text) |> remove_quotation_marks() end),
        Tags: Floki.find(q, ".tag") |> Enum.map(fn tags -> Floki.text(tags) end)
      }
    end)
  end

  defp remove_quotation_marks(text) do
    text
    |> String.replace("“", "")
    |> String.replace("”", "")
  end

  @doc """
  ## Task 3:
      Continue your previous application. Persist the list of quotes into a file.
      Encode the data into JSON format. Name the file quotes.json.

  ## How to run:
      iex(1)> Week5.QuotesScraper.encode_into_json
  """
  def encode_into_json do
    json =
      Jason.encode_to_iodata!(parse_http_response_body())
      |> Jason.Formatter.pretty_print_to_iodata()

    File.write!("/Users/stephaniamatvei/ptr_lab_1/lib/week5/quotes.json", json)
  end
end
