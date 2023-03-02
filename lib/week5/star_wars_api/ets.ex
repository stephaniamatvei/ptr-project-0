defmodule Week5.StarWarsApi.ETS do
  @moduledoc """
  This module is dedicated to persisting the movies data using Erlang Term Storage.
  """
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(_) do
    :ets.new(:movies_table, [:ordered_set, :protected, :named_table])
    :ok = load_movies_into_ets(:movies_table)
    {:ok, :movies_table}
  end

  defp load_movies_into_ets(movies_table) do
    movies = [
      %{
        id: 1,
        title: "Star Wars: Episode IV - A New Hope",
        release_year: 1977,
        director: "George Lucas"
      },
      %{
        id: 2,
        title: "Star Wars: Episode V - The Empire Strikes Back",
        release_year: 1980,
        director: "Irvin Kershner"
      },
      %{
        id: 3,
        title: "Star Wars: Episode VI - Return of the Jedi",
        release_year: 1983,
        director: "Richard Marquand"
      },
      %{
        id: 4,
        title: "Star Wars: Episode I - The Phantom Menace",
        release_year: 1999,
        director: "George Lucas"
      },
      %{
        id: 5,
        title: "Star Wars: Episode II - Attack of the Clones",
        release_year: 2002,
        director: "George Lucas"
      },
      %{
        id: 6,
        title: "Star Wars: Episode III - Revenge of the Sith",
        release_year: 2005,
        director: "George Lucas"
      },
      %{
        id: 7,
        title: "Star Wars: The Force Awakens",
        release_year: 2015,
        director: "J.J. Abrams"
      },
      %{
        id: 8,
        title: "Rogue One: A Star Wars Story",
        release_year: 2016,
        director: "Gareth Edwards"
      },
      %{
        id: 9,
        title: "Star Wars: The Last Jedi",
        release_year: 2017,
        director: "Rian Johnson"
      },
      %{
        id: 10,
        title: "Solo: A Star Wars Story",
        release_year: 2018,
        director: "Ron Howard"
      },
      %{
        id: 11,
        title: "Star Wars: The Rise of Skywalker",
        release_year: 2019,
        director: "J.J. Abrams"
      }
    ]

    Enum.each(movies, fn movie ->
      :ets.insert(movies_table, {movie[:id], movie})
    end)
  end

  # Server API

  #  GET /movies
  def handle_call(:get_all_movies, _from, movies_table) do
    movies =
      Enum.map(:ets.tab2list(movies_table), fn {key, movie} -> Map.put(movie, :id, key) end)

    {:reply, movies, movies_table}
  end

  # GET /movies/:id
  def handle_call({:get_movie_by_id, id}, _from, movies_table) do
    movies = :ets.lookup(movies_table, id)

    if length(movies) == 0 do
      {:reply, nil, movies_table}
    else
      {key, movie} = List.first(movies)
      {:reply, %{movie | id: key}, movies_table}
    end
  end

  # POST /movies
  def handle_call({:create_movie, movie}, _from, movies_table) do
    id = :ets.info(movies_table, :size) + 1
    Map.put(movie, :id, id)
    :ets.insert(movies_table, {id, movie})
    {:reply, :ok, movies_table}
  end

  # PUT /movies/:id
  def handle_call({:replace_movie, id, movie}, _from, movies_table) do
    :ets.insert(movies_table, {id, movie})
    {:reply, :ok, movies_table}
  end

  # PATCH /movies/:id
  def handle_call({:patch_movie, id, movie}, _from, movies_table) do
    [{id, original_movie}] = :ets.lookup(movies_table, id)
    patched_movie = Map.merge(original_movie, movie)
    :ets.insert(movies_table, {id, patched_movie})
    {:reply, Map.put(patched_movie, :id, id), movies_table}
  end

  # DELETE /movies/:id
  def handle_call({:delete_movie, id}, _from, movies_table) do
    :ets.delete(movies_table, id)
    {:reply, :ok, movies_table}
  end

  # Client API

  def get_all_movies do
    GenServer.call(__MODULE__, :get_all_movies)
  end

  def get_movie_by_id(id) do
    GenServer.call(__MODULE__, {:get_movie_by_id, id})
  end

  def create_movie(movie) do
    GenServer.call(__MODULE__, {:create_movie, movie})
  end

  def replace_movie(id, movie) do
    GenServer.call(__MODULE__, {:replace_movie, id, movie})
  end

  def patch_movie(id, movie) do
    GenServer.call(__MODULE__, {:patch_movie, id, movie})
  end

  def delete_movie(id) do
    GenServer.call(__MODULE__, {:delete_movie, id})
  end
end
