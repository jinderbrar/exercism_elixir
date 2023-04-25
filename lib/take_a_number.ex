defmodule TakeANumber do
  def start() do
    spawn(__MODULE__, :run, [0])
  end

  def run(state\\0) do
    receive do
      {:report_state, sender} -> send(sender, state) |> run
      {:take_a_number, sender} -> send(sender, state + 1) |> run
      :stop -> nil
      _ -> run(state)
    end
  end
end
