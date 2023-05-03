defmodule DNA do

  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0
      ?A -> 1
      ?C -> 2
      ?G -> 4
      ?T -> 8
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0 -> ?\s
      1 -> ?A
      2 -> ?C
      4 -> ?G
      8 -> ?T
    end
  end

  def encode(dna) do
    do_encode(dna, <<0::0>>)
  end

  defp do_encode([], so_far), do: so_far
  defp do_encode([curr | rest], so_far) do
    do_encode(rest, <<so_far::bitstring, encode_nucleotide(curr)::size(4)>>)
  end

  def decode(dna) do
    do_decode(dna, '')
  end

  defp do_decode(<<0::0>>, so_far), do: so_far
  defp do_decode(<<curr::4, rest::bitstring>>, so_far) do
    do_decode(rest, so_far ++ [decode_nucleotide(curr)])
  end
end
