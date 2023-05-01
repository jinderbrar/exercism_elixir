defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, fn item -> item.price end)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn item -> !item.price end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item -> %{ item | name: String.replace(item.name, old_word, new_word)} end)
  end


  def increase_quantity(item, count) do
    %{item | quantity_by_size: Enum.into(item.quantity_by_size, %{} ,fn {q, v} -> {q, v + count} end)}
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {t, v}, acc -> acc + v end)
  end
end
