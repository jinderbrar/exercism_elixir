defmodule NameBadge do
  def print(id, name, d) do
    (if id, do: "[#{id}] - ", else: "") <> "#{name} - #{if d, do: String.upcase(d), else: "OWNER"}"
  end
end
