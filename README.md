# Real-Time Programming Project 0

## Table of Contents
- [About](#about)
- [Running](#running)
- [Testing](#testing)
- [Installation](#installation)

## About
This is the repo for project 0 on Real-Time Programming university course. <br>

It has the aim to explore *Functional Programming* and the *Actor Model* in *Elixir* language.

## Running
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

## Testing
For testing, execute the following command in the project root:
```
$ mix test
```

## Installation

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
be found at <https://hexdocs.pm/ptr_lab_1>.
