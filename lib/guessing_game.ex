defmodule GuessingGame do
  @state %{
    correct: "Correct",
    so_close: "So close",
    too_high: "Too high",
    too_low: "Too low",
    make_a_guess: "Make a guess"
  }
  def compare(secret_number, guess \\ :no_guess) when guess == :no_guess, do: @state.make_a_guess
  def compare(secret_number, guess) when secret_number == guess, do: @state.correct
  def compare(x, y) when abs(x-y)==1, do: @state.so_close
  def compare(x, y) when x > y, do: @state.too_low
  def compare(x, y) when x < y, do: @state.too_high

end
