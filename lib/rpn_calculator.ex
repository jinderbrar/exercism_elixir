defmodule RPNCalculator do
  def calculate!(stack, operation) do
    operation.(stack)
  end

  def calculate(stack, operation) do
    r = calculate_verbose(stack, operation)
    if elem(r, 0) == :ok, do: r, else: :error
  end

  def calculate_verbose(stack, operation) do
    try do
      r = calculate!(stack, operation)
      {:ok, r}
    rescue
      e -> {:error, e.message}
    end
  end
end
