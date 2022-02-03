defmodule BoutiqueSuggestions do
  @opts_default maximum_price: 100

  @spec get_combinations([map], [map], keyword) :: list
  def get_combinations(tops, bottoms, options \\ []) do

    options = Keyword.merge(@opts_default, options)

    for x <- tops,
        y <- bottoms,
        x.base_color != y.base_color,
        x.price + y.price <= options[:maximum_price] do
      {x, y}
    end
  end
end
