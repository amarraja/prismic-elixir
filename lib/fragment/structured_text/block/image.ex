defmodule Prismic.Fragment.StructuredText.Block.Image do
  alias Prismic.Fragment

  defstruct [:view, :label]

  @type t :: %__MODULE__{view: any(), label: String.t()}

  def url(%{view: %Fragment.View{url: url}}), do: url

  def width(%{view: %Fragment.View{width: width}}), do: width

  def height(%{view: %Fragment.View{height: height}}), do: height

  def alt(%{view: %Fragment.View{alt: alt}}), do: alt

  def copyright(%{view: %Fragment.View{copyright: copyright}}), do: copyright

  def link_to(%{view: %Fragment.View{link_to: link_to}}), do: link_to
end

# Not sure if this is needed? The next one definitely is, so just delegated
defimpl Prismic.Fragment, for: Prismic.Fragment.StructuredText.Block.Image do
  def as_html(image, link_resolver, html_serializer) do
    Prismic.Fragment.StructuredText.Block.as_html(image, link_resolver, html_serializer)
  end
end

defimpl Prismic.Fragment.StructuredText.Block, for: Prismic.Fragment.StructuredText.Block.Image do
  alias Prismic.Fragment.StructuredText.Block.Image

  def as_html(image, _link_resolver, _html_serializer) do
    url = Image.url(image)
    width = Image.width(image)
    height = Image.height(image)

    classes =
      ["block-img", image.label]
      |> Enum.reject(&is_nil/1)
      |> Enum.join(" ")

    ~s(<p class="#{classes}"><img src="#{url}" width="#{width}" height="#{height}" /></p>)
  end
end
