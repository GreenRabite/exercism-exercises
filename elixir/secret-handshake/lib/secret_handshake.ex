defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do

    digits = Integer.digits(code, 2) |> Enum.reverse

    digits |> Enum.with_index 
           |> Enum.reduce([], fn({x, idx}, acc) -> 
              if idx != 4 do 
                acc ++ [word(x, idx)] 
              else 
                acc |> Enum.reverse 
              end 
            end
           )
           |> Enum.filter(& !is_nil(&1))
  end

  def word(ele,idx) do
    # index of command will tell us what word in the list it is
    # instead of finding the modulus. Would prefer modulus but still
    # working but still learning elixir syntax
    dictionary = %{
      0 => "wink",
      1 => "double blink",
      2 => "close your eyes",
      3 => "jump"
    }

    if ele == 1 do
      dictionary[idx]
    else
      nil
    end
  end
end
