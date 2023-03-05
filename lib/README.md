# FAF.PTR16.1 -- Project 0
> **Performed by:** Matvei Stephania, group FAF-203 <br>
> **Verified by:** asist. univ. Alexandru Osadcenco

## Table of Contents
  - [About](#about)
  - [P0W1](#p0w1)
  - [P0W2](#p0w2)
  - [P0W3](#p0w3)
  - [P0W4](#p0w4)
  - [P0W5](#p0w5)
  - [Conclusion](#conclusion)
  - [Bibliography](#bibliography)

## About
This is the report for Project 0 on Real-Time Programming University Course.

## P0W1

**Minimal Task** - Write a script that would print the message “Hello PTR” on the screen. Execute it.

```elixir
defmodule Week1.HelloPtr do
  def print_hello_ptr do
    IO.inspect("Hello PTR")
  end
end

Week1.HelloPtr.print_hello_ptr()
```

## P0W2

**Minimal Task** - Write a function that determines whether an input integer is prime.


```elixir
defmodule PrimeNumbersChecker do
  @moduledoc """
  Write a function that determines whether an input integer is prime.
  """

  def is_prime(2) do
    true
  end

  def is_prime(number) do
    not Enum.any?(2..(number - 1), fn x -> rem(number, x) == 0 end)
  end
end

IO.inspect(PrimeNumbersChecker.is_prime(13))
```

**Minimal Task** - Write a function to calculate the area of a cylinder, given it’s height and radius.

```elixir
defmodule CylinderArea do
  @moduledoc """
  Write a function to calculate the area of a cylinder, given it’s height and radius.
  """

  def calculate_cylinder_area(height, radius) do
    cylinder_area = 2 * :math.pi() * radius * height + 2 * :math.pi() * :math.pow(radius, 2)
    IO.inspect(cylinder_area, label: "The area of the cylinder is")
  end
end

CylinderArea.calculate_cylinder_area(3, 4)
```
**Minimal Task** - Write a function to reverse a list.

```elixir
defmodule ReverseList do
  @moduledoc """
  Write a function to reverse a list.
  """

  def reverse_list(list) do
    reverse = Enum.reverse(list)
    IO.inspect(reverse, label: "The reversed list is")
  end
end

ReverseList.reverse_list([1, 2, 4, 8, 4])

```

**Minimal Task** - Write a function to calculate the sum of unique elements in a list.

```elixir
defmodule UniqueElementsSUm do
  @moduledoc """
  Write a function to calculate the sum of unique elements in a list.
  """

  def calculate_unique_sum(list) do
    sum = Enum.uniq(list) |> Enum.sum()

    IO.inspect(sum, label: "The sum of unique elements in the list is")
  end
end

UniqueElementsSUm.calculate_unique_sum([1, 2, 4, 8, 4, 2])
```

**Minimal Task** - Write a function that extracts a given number of randomly selected elements from a list.

```elixir
defmodule RandomElements do
  @moduledoc """
  Write a function that extracts a given number of randomly selected elements from a list.
  """

  def extract_random_elements(list, n) do
    random_elements = Enum.take_random(list, n)
    IO.inspect(random_elements, label: "The randomly selected elements from the list are")
  end
end

RandomElements.extract_random_elements([1, 2, 4, 8, 4], 3)
```

**Minimal Task** - Write a function that returns the first n elements of the Fibonacci sequence.

```elixir
defmodule Fibonacci do
  @moduledoc """
  Write a function that returns the first n elements of the Fibonacci sequence.
  """

  def fib(0) do
    0
  end

  def fib(1) do
    1
  end

  def fib(n) when n >= 0 do
    fib(n - 1) + fib(n - 2)
  end

  def return_fibonacci_elements(x) do
    elements = for n <- 0..(x - 1), do: fib(n)
    IO.inspect(elements)
  end
end

IO.puts(Fibonacci.return_fibonacci_elements(7))
```

**Minimal Task** - Write a function that, given a dictionary, would translate a sentence. Words not found in the dictionary need not be translated.

```elixir
defmodule Dictionary do
  @moduledoc """
  Write a function that, given a dictionary, would translate a sentence.
  Words not found in the dictionary need not be translated.
  """

  def translate(dictionary, sentence) do
    words = String.split(sentence, " ")

    Enum.map(words, fn word ->
      unless dictionary[word] == nil do
        dictionary[word]
      else
        word
      end
    end)
    |> Enum.join(" ")
  end
end

IO.inspect(
  Dictionary.translate(
    %{"mama" => "mother", "papa" => "father"},
    "mama is with papa"
  )
)
```

**Minimal Task** - Write a function that receives as input three digits and arranges them in an order that would create the smallest possible number. Numbers cannot start with a 0.

```elixir
defmodule SmallestNumber do
  @moduledoc """
  Write a function that receives as input three digits and arranges them in an order
  that would create the smallest possible number. Numbers cannot start with a 0.
  """

  def get_smallest_number(a, b, c) do
    [a, b, c] |> Enum.sort() |> get_smallest_number() |> Enum.join() |> String.to_integer()
  end

  defp get_smallest_number([0, 0, z]) do
    [z, 0, 0]
  end

  defp get_smallest_number([0, y, z]) do
    [y, 0, z]
  end

  defp get_smallest_number([x, y, z]) do
    [x, y, z]
  end
end

IO.inspect(SmallestNumber.get_smallest_number(3, 1, 0))
```

**Minimal Task** - Write a function that would rotate a list n places to the left.

```elixir
defmodule ListRotation do
  @moduledoc """
  Write a function that would rotate a list n places to the left.
  """

  def rotate_left(enumerable, shift) do
    {left, right} = Enum.split(enumerable, shift)
    right ++ left
  end
end

IO.inspect(ListRotation.rotate_left([1, 2, 4, 8, 4], 3))
```

**Minimal Task** - Write a function that lists all tuples a, b, c such that a<sup>2</sup> + b<sup>2</sup> = c<sup>2</sup> and a, b ≤ 20.

```elixir
defmodule PythagoreanTheorem do
  @moduledoc """
  Write a function that lists all tuples a, b, c such that a^2 + b^2 = c^2 and a, b ≤ 20.
  """

  def list_right_angle_triangles, do: Enum.filter(triples(), &is_pythagorean_triple/1)

  defp triples do
    for a <- 1..20, b <- a..20, c <- b..20, do: {a, b, c}
  end

  defp is_pythagorean_triple({a, b, c}) do
    a * a + b * b == c * c
  end
end

IO.inspect(PythagoreanTheorem.list_right_angle_triangles())
```

**Main Task** - Write a function that eliminates consecutive duplicates in a list.

```elixir
defmodule ConsecutiveDuplicates do
  @moduledoc """
  Write a function that eliminates consecutive duplicates in a list.
  """

  def remove_consecutive_duplicates(list) do
    new_list = Enum.dedup(list)
    IO.inspect(new_list, label: "The new list without consecutive duplicates")
  end
end

ConsecutiveDuplicates.remove_consecutive_duplicates([1, 2, 2, 2, 4, 8, 4])
```

**Main Task** - Write a function that, given an array of strings, will return the words that can be typed using only one row of the letters on an English keyboard layout.

```elixir
defmodule KeyboardLayout do
  @moduledoc """
  Write a function that, given an array of strings, will return the words that
  can be typed using only one row of the letters on an English keyboard layout.
  """

  def line_words(words) do
    row1 = "qwertyuiop"
    row2 = "asdfghjkl"
    row3 = "zxcvbnm"

    words
    |> Enum.filter(fn word ->
      chars = word |> String.downcase() |> String.split("")

      row1_chars = Enum.filter(chars, &String.contains?(row1, &1))
      row2_chars = Enum.filter(chars, &String.contains?(row2, &1))
      row3_chars = Enum.filter(chars, &String.contains?(row3, &1))

      length(row1_chars) == length(chars) || length(row2_chars) == length(chars) ||
        length(row3_chars) == length(chars)
    end)
  end
end

IO.inspect(KeyboardLayout.line_words(["Hello", "Alaska", "Dad", "Peace"]))
```

**Main Task** - Create a pair of functions to encode and decode strings using the Caesar cipher.

```elixir
defmodule CaesarCipher do
  @moduledoc """
  Create a pair of functions to `encode/2` and `decode/2` strings using the Caesar cipher.
  """

  @spec encode(message :: String.t(), shift :: integer) :: String.t()
  def encode(message, shift) do
    message
    |> to_charlist()
    |> Enum.map(&apply_encode_shift(&1, shift))
    |> to_string()
  end

  defp apply_encode_shift(letter, shift) do
    cond do
      letter in ?A..?Z -> ?A + rem(letter - ?A + shift, 26)
      letter in ?a..?z -> ?a + rem(letter - ?a + shift, 26)
      true -> letter
    end
  end

  @spec decode(message :: String.t(), shift :: integer) :: String.t()
  def decode(message, shift) do
    message
    |> to_charlist()
    |> Enum.map(&apply_decode_shift(&1, shift))
    |> to_string()
  end

  defp apply_decode_shift(letter, shift) do
    cond do
      letter in ?A..?Z -> ?A + rem(letter - ?A - shift, 26)
      letter in ?a..?z -> ?a + rem(letter - ?a - shift, 26)
      true -> letter
    end
  end
end

IO.inspect(CaesarCipher.encode("lorem", 3))
IO.inspect(CaesarCipher.decode("oruhp", 3))
```

**Main Task** - Write a function that, given a string of digits from 2 to 9, would return all possible letter combinations that the number could represent (think phones with buttons).

```elixir
defmodule LettersCombinations do
  @moduledoc """
  White a function that, given a string of digits from 2 to 9, would return all possible
  letter combinations that the number could represent (think phones with buttons).
  """

  def get_letters_combinations(digits_string) do
    dictionary = %{
      "2" => ["a", "b", "c"],
      "3" => ["d", "e", "f"],
      "4" => ["g", "h", "i"],
      "5" => ["j", "k", "l"],
      "6" => ["m", "n", "o"],
      "7" => ["p", "q", "r", "s"],
      "8" => ["t", "u", "v"],
      "9" => ["w", "x", "y", "z"]
    }

    letter_expansion = fn
      {digits_string, func} ->
        func.({tl(digits_string), dictionary[hd(digits_string)], func})

      {[], acc, _func} ->
        acc

      {digits_string, acc, func} ->
        func.({
          tl(digits_string),
          Enum.map(acc, fn word ->
            Enum.map(dictionary[hd(digits_string)], fn letter -> word <> letter end)
          end)
          |> Enum.concat(),
          func
        })
    end

    letter_expansion.({digits_string |> String.graphemes(), letter_expansion})
  end
end

IO.inspect(LettersCombinations.get_letters_combinations("23"))
```

**Main Task** - Write a function that, given an array of strings, would group the anagrams together.

```elixir
defmodule AnagramsGrouping do
  @moduledoc """
  White a function that, given an array of strings, would group the anagrams together.
  """

  @spec group_anagrams(any) :: any
  def group_anagrams(list) do
    simplify = fn word -> String.graphemes(word) |> Enum.sort() |> Enum.join() end

    groups =
      list
      |> Enum.map(&simplify.(&1))
      |> Enum.uniq()
      |> Map.new(&{&1, []})

    list
    |> Enum.reduce(groups, fn x, acc -> Map.put(acc, simplify.(x), acc[simplify.(x)] ++ [x]) end)
  end
end

IO.inspect(AnagramsGrouping.group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
IO.inspect(AnagramsGrouping.group_anagrams(["gentleman", "elegant", "tnagele", "nameltneg"]))
```

**Bonus Task** - Write a function to convert arabic numbers to roman numerals.

```elixir
defmodule RomanNumerals do
  @moduledoc """
  Write a function to convert arabic numbers to roman numerals.
  """

  @mappings [{"X", 10}, {"IX", 9}, {"V", 5}, {"IV", 4}, {"I", 1}]

  def convert(number) do
    {0, str} =
      for {roman, arabic} <- @mappings, reduce: {number, ""} do
        {num, str} -> {rem(num, arabic), str <> String.duplicate(roman, div(num, arabic))}
      end

    str
  end
end

IO.inspect(RomanNumerals.convert(27))
```

**Bonus Task** - Write a function to calculate the prime factorization of an integer.

```elixir
defmodule PrimeFactorization do
  @moduledoc """
  Write a function to calculate the prime factorization of an integer.
  """

  def generate(num) do
    generate(num, 2, [])
  end

  defp generate(1, _, acc) do
    acc
  end

  defp generate(num, candidate, acc) when rem(num, candidate) == 0 do
    generate(div(num, candidate), candidate, [candidate | acc])
  end

  defp generate(num, candidate, acc) do
    generate(num, candidate + 1, acc)
  end
end

IO.inspect(PrimeFactorization.generate(13))
```

## P0W3

**Minimal Task** - Create an actor that prints on the screen any message it receives.

```elixir
defmodule Week3.Printer do
  @moduledoc """
  Create an actor that prints on the screen any message it receives.

  ## How to run:

    iex(1)> pid = spawn(Week3.Printer, :print, [])
    #PID<0.167.0>

    iex(2)> send(pid, "hello")
    "hello"

  """

  def print do
    receive do
      {input} -> IO.puts("#{input}")
    end

    print()
  end
end
```

**Minimal Task** - Create an actor that returns any message it receives, while modifying it. 

```elixir
defmodule Week3.MessageModifier do
  @moduledoc """
  Create an actor that returns any message it receives, while modifying it.

  ## How to run:

    iex(1)> pid = spawn(Week3.MessageModifier, :handle_input, [])
    #PID<0.167.0>

    iex(2)> send(pid, 10)
    Received: 11
    10

    iex(3)> send(pid, "Hello")
    Received: hello
    "Hello"

    iex(4)> send(pid, {10, "Hello"})
    Received: I don't know how to HANDLE this!
    {10, "Hello"}

  """

  def handle_input do
    receive do
      input when is_integer(input) ->
        IO.puts("Received: #{input + 1}")

      input when is_bitstring(input) ->
        IO.puts("Received: #{String.downcase(input)}")

      _ ->
        IO.puts("Received: I don't know how to HANDLE this!")
    end

    handle_input()
  end
end
```

**Minimal Task** - Create a two actors, actor one ”monitoring” the other. If the second actor stops, actor one gets notified via a message.

```elixir
defmodule Week3.Monitor do
  @moduledoc """
  Create a two actors, actor one ”monitoring” the other.
  If the second actor stops, actor one gets notified via a message.
  """

  @doc """
  We can establish a link between two processes at any time with Process.link().
  Here’s a small actor that we can use to investigate how links behave:
  """
  def loop do
    receive do
      {:exit_because, reason} -> exit(reason)
      {:link_to, pid} -> Process.link(pid)
      {:EXIT, pid, reason} -> IO.puts("Process #{inspect(pid)} exited because #{reason}")
    end

    loop()
  end

  @doc """
  This function allows a process to trap another’s exit by setting its :trap_exit flag.
  For example, we will use `loop_system()` to start pid1. Not only does this mean that it’s
  notified when pid2 has exited (and prints a message to that effect), but it also continues to execute.
  """
  def loop_system do
    Process.flag(:trap_exit, true)
    loop()
  end
end

# pid1 = spawn(Week3.Monitor, :loop_system, [])
# pid2 = spawn(Week3.Monitor, :loop, [])
# send(pid1, {:link_to, pid2})
# send(pid2, {:exit_because, :yet_another_bad_thing_happened})
# Process.info(pid2, :status)
# Process.info(pid1, :status)
```

**Minimal Task** - Create an actor which receives numbers and with each request prints out the current average.

```elixir
defmodule Week3.Averager do
  @moduledoc """
  Create an actor which receives numbers and with each request prints out the current average.

  ## How to run:

    iex(1)> pid = Week3.Averager.start(0)
    #PID<0.167.0>

    iex(2)> Week3.Averager.next
    Current average is 0
    0

    iex(3)> Week3.Averager.next
    Current average is 5.0
    5.0

  """

  def start(count) do
    pid = spawn(__MODULE__, :calculate_average, [count])
    Process.register(pid, :counter)
    pid
  end

  def next do
    ref = make_ref()
    send(:counter, {:next, self(), ref})

    receive do
      {:ok, ^ref, count} -> count
    end
  end

  def calculate_average(count) do
    receive do
      {:next, sender, ref} ->
        send(sender, {:ok, ref, count})
        IO.puts("Current average is #{count}")
        calculate_average((count + 10) / 2)
    end
  end
end
```

**Main Task** - Create an actor which maintains a simple FIFO queue. You should write helper functions to create an API for the user, which hides how the queue is implemented.

```elixir
defmodule Week3.BlockingQueue do
  @moduledoc """
  Create an actor which maintains a simple FIFO queue. You should write helper
  functions to create an API for the user, which hides how the queue is implemented.

  ## How to run:

    iex(1)> {:ok, pid} = Week3.BlockingQueue.start_link()
    {:ok, #PID<0.161.0>}

    iex(2)> Week3.BlockingQueue.push(pid, 1)
    :ok

    iex(3)> Week3.BlockingQueue.pop(pid)
    1

  """

  use GenServer

  @empty_queue :queue.new()
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, nil, opts)
  end

  def push(blocking_queue, item) do
    GenServer.call(blocking_queue, {:push, item})
  end

  def pop(blocking_queue) do
    GenServer.call(blocking_queue, :pop, :infinity)
  end

  @impl true
  def init(_items) do
    {
      :ok,
      {
        # items queue
        :queue.new(),
        # processes waiting for item
        :queue.new()
      }
    }
  end

  @impl true
  def handle_call({:push, item}, _from, {items, refs}) do
    {:reply, :ok, {:queue.in(item, items), refs}, {:continue, :pop}}
  end

  @impl true
  def handle_call(:pop, from, {items, refs}) do
    {:noreply, {items, :queue.in(from, refs)}, {:continue, :pop}}
  end

  # When there’s no items in the items queue, we do nothing and just keep the callers waiting.
  @impl true
  def handle_continue(:pop, {@empty_queue, _refs} = state) do
    {:noreply, state}
  end

  # When there’s no processes waiting for items, we do nothing.
  def handle_continue(:pop, {_items, @empty_queue} = state) do
    {:noreply, state}
  end

  # When both an item and a process waiting for an item are available, we send the item to the process,
  # and recursively check whether there are more jobs to do by returning {:noreply, new_state, {:continue, term}}.
  def handle_continue(:pop, {items, refs}) do
    {{:value, item}, items} = :queue.out(items)
    {{:value, ref}, refs} = :queue.out(refs)
    GenServer.reply(ref, item)
    {:noreply, {items, refs}, {:continue, :pop}}
  end
end
```
*Explanation:*

1. The BlockingQueue needs to store 2 queues, one for items, one for callers.

2. Implementing `push`:

    2.1. When an item is pushed to the blocking queue we just add the caller to the waiting queue and postpone the notification.

3. Implementing `pop`:

    3.1 Same as `push`, we just add the caller to the waiting queue and postpone the notification. The difference is that we should not reply to the callers but keep them waiting, so we should return `{:noreply, …}`. Another thing to note is that we should keep the caller waiting indefinitely, so we should set the timeout to `:infinity`.

4. Implementing the blocking behavior:

    4.1. When there’s no items in the items queue, we do nothing and just keep the callers waiting.

    4.2. When there’s no processes waiting for items, we do nothing.

    4.3. When both an item and a process waiting for an item are available, we send the item to the process, and recursively check whether there are more jobs to do by returning {:noreply, new_state, {:continue, term}}.



**Main Task** - Create a module that would implement a semaphore.

```elixir
defmodule Week3.Semaphore do
  @moduledoc """
  Create a module that would implement a semaphore.

  ## How to run:

    iex(1)> pid = spawn(Week3.Semaphore, :semaphore, [3])
    #PID<0.167.0>

    iex(2)> Week3.Semaphore.request(pid)
    :ok

    iex(3)> Week3.Semaphore.release(pid)
    :release

  """

  def semaphore(0) do
    receive do
      :release ->
        semaphore(1)
    end
  end

  def semaphore(n) do
    receive do
      {:request, from} ->
        send(from, :granted)
        semaphore(n - 1)

      :release ->
        semaphore(n + 1)
    end
  end

  def request(semaphore) do
    send(semaphore, {:request, self()})

    receive do
      :granted ->
        :ok
    end
  end

  def release(semaphore) do
    send(semaphore, :release)
  end
end
```

*Explanation:*

If we create a semaphore with the initial value 4 then at most four processes will be granted access to the critical section.

The requesting process will be suspended waiting in a receive statement until the semaphore responds with a `:granted` message.

A process that sends a `:request` message will have its message inserted as the last message in the message queue. If there are no resources left (the first clause), then request messages will simply not be handled. Only when resources are available will the semaphore handle requests and then it will of course handle them in the order they have arrived in the message queue.

**Bonus Task** - Create a module that would perform some risky business. Start by creating a scheduler actor. When receiving a task to do, it will create a worker node that will perform the task. Given the nature of the task, the worker node is prone to crashes (task completion rate 50%). If the scheduler detects a crash, it will log it and restart the worker node. If the worker node finishes successfully, it should print the result.

```elixir
defmodule Week3.WorkerNode do
  @moduledoc """
  Create a module that would perform some risky business. Start by creating a scheduler actor.
  When receiving a task to do, it will create a worker node that will perform the task.
  Given the nature of the task, the worker node is prone to crashes (task completion rate 50%).
  If the scheduler detects a crash, it will log it and restart the worker node.
  If the worker node finishes successfully, it should print the result.

  ## How to run:

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


    P.S. Sometimes the last command you will return fail due to 50% task completion rate.

  """

  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def go_boom do
    if Enum.random([true, false]) do
      IO.inspect("Test fail")
      exit(:boom)
    end
  end

  ## Callbacks

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    go_boom()
    IO.inspect("Task succesful: Miau")
    {:reply, head, tail}
  end
end
```

## P0W4

**Minimal Task** - Create a supervised pool of identical worker actors. The number of actors is static, given at initialization. Workers should be individually addressable. Worker actors should echo any message they receive. If an actor dies (by receiving a “kill” message), it should be restarted by the supervisor. Logging is welcome.

*Supervisor component:*

```elixir
defmodule Week4.WorkerSupervisor do
  @moduledoc """
  Create a supervised pool of identical worker actors. The number of actors is static, given at initialization.
  Workers should be individually addressable. Worker actors should echo any message they receive. If an actor dies
  (by receiving a “kill” message), it should be restarted by the supervisor. Logging is welcome.

  Supervisor component.
  """

  use Supervisor

  def start_link(num_workers) do
    Supervisor.start_link(__MODULE__, num_workers: num_workers, name: __MODULE__)
    |> elem(1)
  end

  def init(args) do
    children =
      Enum.map(1..args[:num_workers], fn i ->
        %{
          id: i,
          start: {Week4.Worker, :start_link, []}
        }
      end)

    Supervisor.init(children, strategy: :one_for_one)
  end

  def get_worker_pid(pid, id) do
    Supervisor.which_children(pid)
    |> Enum.find(fn {i, _, _, _} -> i == id end)
    |> elem(1)
  end
end

# supervisor_pid = Week4.WorkerSupervisor.start_link(5)
# pid2 = Week4.WorkerSupervisor.get_worker_pid(supervisor_pid, 2)
# Week4.Worker.echo("message")
# Week4.Worker.echo("kill")
# send(pid2, :kill)
# Week4.WorkerSupervisor.get_worker_pid(pid, 1)
```

*Worker component:*

```elixir
defmodule Week4.Worker do
  @moduledoc """
  Create a supervised pool of identical worker actors. The number of actors is static, given at initialization.
  Workers should be individually addressable. Worker actors should echo any message they receive. If an actor dies
  (by receiving a “kill” message), it should be restarted by the supervisor. Logging is welcome.

  Worker component.
  """

  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def init(state) do
    {:ok, state}
  end

  def handle_call(message, _from, state) do
    {:reply, message, state}
  end

  def echo(message) do
    if message == "kill" do
      Process.exit(self(), "kill")
    else
      IO.inspect(message)
    end
  end
end
```

**Main Task** - Create a supervised processing line to clean messy strings. The first worker in the line would split the string by any white spaces (similar to Python’s str.split method). The second actor will lowercase all words and swap all m’s and n’s (you nomster!). The third actor will join back the sentence with one space between words (similar to Python’s str.join method). Each worker will receive as input the previous actor’s output, the last actor printing the result on screen. If any of the workers die because it encounters an error, the whole processing line needs to be restarted. Logging is welcome.

```elixir
defmodule Week4.SupervisedProcessingLine do
  @moduledoc """
  Create a supervised processing line to clean messy strings.
  The first worker in the line would split the string by any white spaces (similar to Python’s `str.split` method).
  The second actor will lowercase all words and swap all m’s and n’s (you nomster!).
  The third actor will join back the sentence with one space between words (similar to Python’s `str.join` method).
  Each worker will receive as input the previous actor’s output, the last actor printing the result on screen.
  If any of the workers die because it encounters an error, the whole processing line needs to be restarted.
  Logging is welcome.

  ## Example

    iex(1)> Week4.SupervisedProcessingLine.start_pipeline("ThiS is ThE MaiN TASK for wEEk 4")
    "this is the naim task for week 4"
  """

  require Logger

  def start_pipeline(input_str) do
    with {:ok, words} <- split_string(input_str),
         {:ok, swapped_words} <- swap_m_n_and_lowercase(words),
         {:ok, result} <- join_words(swapped_words) do
      result
    else
      error ->
        Logger.error("Error in pipeline: #{error}")
        start_pipeline(input_str)
    end
  end

  defp split_string(input_str) do
    try do
      {:ok, input_str |> String.split()}
    rescue
      e ->
        Logger.error("Error in split_string worker: #{e}")
        {:error, e}
    end
  end

  defp swap_m_n_and_lowercase(words) do
    try do
      swapped_words =
        words
        |> Enum.map(&String.downcase/1)
        |> Enum.map(
          &(String.replace(&1, "m", " ")
            |> String.replace("n", "m")
            |> String.replace(" ", "n"))
        )

      {:ok, swapped_words}
    rescue
      e ->
        Logger.error("Error in swap_m_n_and_lowercase worker: #{e}")
        {:error, e}
    end
  end

  defp join_words(swapped_words) do
    try do
      {:ok, swapped_words |> Enum.join(" ")}
    rescue
      e ->
        Logger.error("Error in join_words worker: #{e}")
        {:error, e}
    end
  end
end
```

## P0W5

**Minimal Task** - Write an application that would visit this link. Print out the HTTP response
status code, response headers and response body.

**Minimal Task** -  Continue your previous application. Extract all quotes from the HTTP response body. Collect the author of the quote, the quote text and tags. Save the data into a list of maps, each map representing a single quote.

**Minimal Task** - Continue your previous application. Persist the list of quotes into a file. Encode the data into JSON format. Name the file quotes.json.

```elixir
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
```

**Main Task** - Write an application that would implement a Star Wars-themed RESTful API. The API should implement the following HTTP methods: <br /> 

• GET /movies <br />
• GET /movies/:id <br />
• POST /movies <br />
• PUT /movies/:id <br />
• PATCH /movies/:id <br />
• DELETE /movies/:id <br />

Use a database to persist your data.

*Explanation:*

*application.ex* - this file is the Application module containing all the project's configurations.

```elixir
defmodule Week5.StarWarsApi.Application do
  @moduledoc """
  This is the Application module containing all the project's configurations.
  """
  alias Week5.StarWarsApi
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy,
       scheme: :http, plug: Week5.StarWarsApi.Router, options: [port: cowboy_port()]},
      {StarWarsApi.ETS, []}
    ]

    opts = [strategy: :one_for_one, name: StarWarsApi.Supervisor]

    Logger.info("Star Wars application started ...")

    Supervisor.start_link(children, opts)
  end

  defp cowboy_port, do: Application.get_env(:star_wars_api, :cowboy_port, 8080)
end
```

*config.ex* - file for configuring the port number.

```elixir
use Mix.Config

config :star_wars_api, cowboy_port: 8080
```

*ets.ex* - This module is dedicated to persisting the movies data using Erlang Term Storage.

```elixir
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
```

*router.ex* - This is the Router module dedicated to handling the HTTP requests.

```elixir
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
```

## Conclusion

In the first laboratory work (aka Project 0) on the Real-Time Programming University Course, I've learned:

1. A new programming language - *Elixir*;
2. A new language paradigm - *Functional*;
3. A new concurrency model - *the Actor Model*;
4. How to store data in memory using *ETS - Erlang Term Storage*;
5. How to build an HTTP server using the *PlugCowboy* Elixir library. 

In conclusion, I can say that while working on this project I've learned a lot of new and interesting concepts.


## Bibliography

1. [Elixir](https://elixir-lang.org)
2. [Elixir docs](https://hexdocs.pm/elixir/Kernel.html)
3. [Elixir School](https://elixirschool.com/en)
4. [Seven Concurrency Models in Seven Weeks](http://www.r-5.org/files/books/computers/languages/sql/nosql/Paul_Butcher-Seven_Concurrency_Models_in_Seven_Weeks-EN.pdf)
5. [Mutual Exclusion
Locks, Semaphores and Monitors](https://people.kth.se/~johanmon/courses/id1019/seminars/mutex/mutex.pdf)

[🆙 BACK TO TOP 🆙](#fafptr161----project-0)