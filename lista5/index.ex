defmodule Lista5 do
  # Exercicios slides
  #
  #
  #
  def insertion_sort([]), do: insertion_sort([], &Lista5.cresc_ins/2)
  def insertion_sort([], comp), do: []

  def insertion_sort(arr), do: insertion_sort(arr, &Lista5.cresc_ins/2)

  def insertion_sort([h | t], comp), do: ins(h, insertion_sort(t, comp), comp)

  def menor([]), do: false

  def menor(arr) do
    [h | t] = insertion_sort(arr)
    h
  end

  def maior(arr) do
    [h | t] = insertion_sort(arr, &Lista5.desc_ins/2)
    h
  end

  def ins(x, [], comp), do: [x]

  def ins(x, [h | t], comp) do
    cond do
      comp.(x, h) -> [x | [h | t]]
      true -> [h | ins(x, t, comp)]
    end
  end

  def desc_ins(a, b), do: a >= b
  def cresc_ins(a, b), do: a <= b

  # Exercicios Lista5
  #
  #
  #

  def membro_using_find(lista, item) do
    Enum.find_index(lista, fn x -> x == item end) != nil
  end

  def quantas_vezes(lista, item), do: _quantas_vezes(0, lista, item)
  def _quantas_vezes(acc, [], item), do: acc

  def _quantas_vezes(acc, [h | t], item) do
    if h == item do
      _quantas_vezes(acc + 1, t, item)
    else
      _quantas_vezes(acc, t, item)
    end
  end


  def membro(lista, item), do: quantas_vezes(lista, item) > 0


  def unicos(lista), do: Enum.filter(lista, fn x -> quantas_vezes(lista, x) == 1 end)

  def quick_sort([]), do: []
  def quick_sort([h|t]) do
    quick_sort(menores(h, t)) ++ [h] ++ quick_sort(maiores(h, t))
  end

  # Ou iguais (ToDo: implementar 3-way partition)
  def menores(h, t), do: Enum.filter(t, fn x -> x <= h end)
  def maiores(h, t), do: Enum.filter(t, fn x -> x > h end)
end
