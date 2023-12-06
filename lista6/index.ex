defmodule Lista6 do
  def soma_tuplas(x) when is_integer(x), do: x
  def soma_tuplas({x, y}), do: soma_tuplas(x) + soma_tuplas(y)

  def shift({{x,y},z}), do: {x,{y,z}}

  def minEmax(a, b, c) do
    order = quick_sort([a, b, c])
    [menor|t] = order
    [maior|_] = Enum.reverse(t)

    {menor, maior}
  end

  def soma_lista_tuplas([]), do: 0
  def soma_lista_tuplas([h|t]), do: soma_tuplas(h) + soma_lista_tuplas(t)



  def zip(_, []), do: []
  def zip([], _), do: []
  def zip(a, b) do
    [ha|ta] = a
    [hb|tb] = b

    [{ha, hb}|zip(ta, tb)]
  end


  def zip_tres(_, [], _), do: []
  def zip_tres([], _, _), do: []
  def zip_tres(_, _, []), do: []
  def zip_tres(a, b, c) do
    [ha|ta] = a
    [hb|tb] = b
    [hc|tc] = c

    [{ha, hb, hc}|zip_tres(ta, tb, tc)]
  end

  def group_pos([], _), do: []
  def group_pos([h|t], pos), do: [elem(h, pos)|group_pos(t, pos)]
  # ToDo: transformar em dinamico
  def unzip(a) do
    [group_pos(a, 0), group_pos(a,1)]
  end





  def quick_sort([]), do: []
  def quick_sort([h|t]) do
    quick_sort(menores(h, t)) ++ [h] ++ quick_sort(maiores(h, t))
  end

  # Ou iguais (ToDo: implementar 3-way partition)
  def menores(h, t), do: Enum.filter(t, fn x -> x <= h end)
  def maiores(h, t), do: Enum.filter(t, fn x -> x > h end)
end
