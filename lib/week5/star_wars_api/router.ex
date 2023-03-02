defmodule Week5.StarWarsApi.Router do
  @moduledoc """
  This is the Router module dedicated to handling the HTTP requests.
  """
  use Plug.Router

  plug(Plug.Parsers,
    parsers: [:urlencoded, :json],
    pass: ["*/*"],
    json_decoder: Jason
  )

  plug(:match)
  plug(:dispatch)

  get "/movies" do
    movies =
      Week5.StarWarsApi.ETS.get_all_movies() |> Jason.encode!() |> Jason.Formatter.pretty_print()

    send_resp(conn, 200, movies)
  end

  get "/movies/:id" do
    id = conn.params["id"] |> String.to_integer()

    movie =
      Week5.StarWarsApi.ETS.get_movie_by_id(id)
      |> Jason.encode!()
      |> Jason.Formatter.pretty_print()

    send_resp(conn, 200, movie)
  end

  post "/movies" do
    movie = conn.body_params

    new_movie =
      Week5.StarWarsApi.ETS.create_movie(movie)
      |> Jason.encode!()
      |> Jason.Formatter.pretty_print()

    send_resp(conn, 201, new_movie)
  end

  put "/movies/:id" do
    id = conn.params["id"] |> String.to_integer()
    movie = conn.body_params

    new_movie =
      Week5.StarWarsApi.ETS.replace_movie(id, movie)
      |> Jason.encode!()
      |> Jason.Formatter.pretty_print()

    send_resp(conn, 200, new_movie)
  end

  patch "/movies/:id" do
    id = conn.params["id"] |> String.to_integer()
    movie = conn.body_params

    new_movie =
      Week5.StarWarsApi.ETS.patch_movie(id, movie)
      |> Jason.encode!()
      |> Jason.Formatter.pretty_print()

    send_resp(conn, 200, new_movie)
  end

  delete "/movies/:id" do
    id = conn.params["id"] |> String.to_integer()
    Week5.StarWarsApi.ETS.delete_movie(id)
    send_resp(conn, 204, "")
  end

  match _ do
    send_resp(conn, 404, "Oops!")
  end
end
