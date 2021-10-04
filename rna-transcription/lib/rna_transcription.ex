defmodule RnaTranscription do
  # module attribute
  @guanine "G"
  @adenine "A"
  @cystosine "C"
  @uracil "U"
  @thymine "T"

  # define a private function
  defp transcribe_dna(nucleotide) do
    case nucleotide do
      @guanine -> @cystosine
      @cystosine -> @guanine
      @thymine -> @adenine
      @adenine -> @uracil
      _ -> "Error"
    end
  end

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    ## '' represents List, "" represents BitString
    |> to_string
    |> String.split("", trim: true)
    |> Enum.map(&transcribe_dna/1)
    |> to_string
    |> to_charlist
  end
end
