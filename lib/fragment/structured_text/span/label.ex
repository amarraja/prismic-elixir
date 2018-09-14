alias Prismic.Fragment.StructuredText.Span

defmodule Span.Label do
  defstruct [:label]

  @type t :: %__MODULE__{label: String.t()}
end

defimpl Span, for: Span.Label do
  # TODO
  def serialize(_, _link_resolver), do: ""
  def open_tag(_span), do: "<label>"
  def close_tag(_span), do: "</label>"
end
