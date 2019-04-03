defmodule GameOfLife do
  @moduledoc """
  GameOfLife keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def board do
    %{
      "0,0": generate_coord(),
      "0,1": generate_coord(),
      "0,2": generate_coord(),
      "1,0": generate_coord(),
      "1,1": generate_coord(),
      "1,2": generate_coord(),
      "2,0": generate_coord(),
      "2,1": generate_coord(),
      "2,2": generate_coord()
    }
  end

  def generate_coord() do
    Enum.random(0..1)
  end

  def live_or_die(board) do
    Enum.each(board, fn {k, _v} ->
      # IO.inspect({k, v})
      find_neighbours(board, k)
    end)
  end

  def loop_through_life(board) do
    Enum.map(0..4, fn _ -> live_or_die(board) end)
  end

  def find_neighbours(_board, coord) do
    [x | y] = String.split(coord, ",") |> IO.inspect()
    first_list = [x - 1, x, x + 1]
    IO.inspect(first_list)
  end
end
