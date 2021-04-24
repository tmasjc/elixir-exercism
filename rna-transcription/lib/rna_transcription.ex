defmodule RnaTranscription do
  @guanine "G"
  @adenine "A"
  @cystosine "C"
  @uracil "U"
  @thymine "T"

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    s = String.split(to_string(dna), "", trim: true)
    rna = Enum.map(s, fn(x) ->
      case x do
        @guanine -> @cystosine
        @cystosine -> @guanine
        @thymine -> @adenine
        @adenine -> @uracil
        _ -> "Error"
      end
    end)
    rna
    |> to_string
    |> to_charlist
  end
end
