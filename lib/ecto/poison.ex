if Code.ensure_loaded?(Poison) do
  defimpl Poison.Encoder, for: Decimal do
    def encode(decimal, _opts), do: <<?", Decimal.to_string(decimal, :normal)::binary, ?">>
  end

  defimpl Poison.Encoder, for: Ecto.Association.NotLoaded do
    def encode(struct, options) do
      case struct.__cardinality__ do
        :many -> "[]"
        _ -> "{}"
      end
    end
  end

end
