defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  def frequency(words) do
  # update(map, key, initial, fun)
  # Updates the key in map with the given function.
    words |> Enum.reduce(%{}, fn(word, accum) ->
      Map.update(accum, word, 1, fn(x) -> x + 1 end )
    end)
  end

  def normalize(sentence) do
    sentence |> String.downcase |> String.replace(~r/[,:"@$%^&!]/, " ") |> String.replace(~r/[ _]+/, " ") |> String.split
  end

  @spec count(String.t()) :: map
  def count(sentence) do
    sentence |> normalize |> frequency
  end
end
