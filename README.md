# Real-Time Programming Project 0

## Table of Contents
- [About](#about)
- [Tasks](#tasks)
- [How to run?](#how-to-run)
- [How to run Actors?](#how-to-run-actors)
- [Testing](#testing)
- [Report](#report)
<!-- - [Installation](#installation) -->

## About
This is the repo for Project 0 on `Real-Time Programming` university course. <br>

It has the aim to explore `Functional Programming` and the `Actor Model` in `Elixir` language.


## Tasks
All tasks can be found in the documentation of each module.

Example:

```
@moduledoc """
  Create an actor that returns any message it receives, while modifying it.
  """
```

## How to run?
*Note: the `$` in the paragraphs below denote a bash command in the terminal. If you are copying this code into your terminal, don’t copy the `$` or it won’t work.*

To run a program, execute the following command in the program's file location:
```
$ elixir file_name.ex
```
Example:
```
$ cd /Users/stephaniamatvei/ptr_lab_1/lib/week1
$ elixir hello_ptr.ex
```

## How to run Actors?
Each module containing the Actor Model has the info about how to run its actors in the module doc.

Example:

```
iex(1)> children = [
...(1)>   %{
...(1)>     id: Week3.WorkerNode,
...(1)>     start: {Week3.WorkerNode, :start_link, [[:hello]]}
...(1)>   }
...(1)> ]
[%{id: Week3.WorkerNode, start: {Week3.WorkerNode, :start_link, [[:hello]]}}]

iex(2)> Supervisor.start_link(children, strategy: :one_for_one)
{:ok, #PID<0.167.0>}

iex(3)> GenServer.call(Week3.WorkerNode, :pop)
"Task succesful: Miau"
:hello
```

## Testing
For testing 🧪, execute the following command in the project root:
```
$ mix test
```

## Report
The report of the project can be found ➡️ [HERE](https://github.com/stephaniamatvei/ptr-project-0/tree/main/lib#fafptr161----project-0) ⬅️

<!-- ## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ptr_lab_1` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ptr_lab_1, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/ptr_lab_1>. -->
