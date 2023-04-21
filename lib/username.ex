defmodule Username do
  def sanitize(username), do: sanitize(username, [])

  def sanitize([], acc), do: acc

  # sanitize the word recursively
  def sanitize([char | tail], acc), do: sanitize(tail, acc ++ sanitize_char(char))

  def sanitize_char(char) do
    # sanitizing single character based on the instruction
    case char do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      ch when (ch >= ?a and ch <= ?z) or (ch == ?_) -> [ch]
      _ -> []
    end
  end
end
