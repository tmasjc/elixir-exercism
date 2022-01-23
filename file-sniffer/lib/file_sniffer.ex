defmodule FileSniffer do
  def type_from_extension(extension) do
    case extension do
      "exe" -> "application/octet-stream"
      "bmp" -> "image/bmp"
      "png" -> "image/png"
      "jpg" -> "image/jpg"
      "gif" -> "image/gif"
      _     -> "extension not found"
    end
  end

  def type_from_binary(file_binary) do
    case file_binary do
      x when x in [<<0x7F>>, <<0x45>>, <<0x4c>>, <<0x46>>] -> type_from_extension("exe")
      x when x in [<<0x42>>, <<0x4D>>] -> type_from_extension("bmp")
    end
  end

  def verify(file_binary, extension) do
    # Please implement the verify/2 function
  end
end
