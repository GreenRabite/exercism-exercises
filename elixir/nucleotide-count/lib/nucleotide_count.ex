defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    length = String.length(strand)
    case length do
      0 -> 0
      n when n > 0 -> strand |> String.codepoints |> Enum.map(fn(x) -> String.to_charlist(x) end) |> Enum.count(fn(x) -> (x |> hd ) == nucleotide end)
    end

    # strand |> String.codepoints |> Enum.map(fn(x) -> String.to_charlist(x) end) |> Enum.count(fn(x) -> (x |> hd ) == nucleotide end)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    strand |> String.codepoints |> Enum.reduce(%{}, fn(char, accum) ->
      Map.update(accum, char, 1, fn(x) -> x + 1 end
    )end)
  end
end
