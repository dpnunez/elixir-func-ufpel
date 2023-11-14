defmodule Lista do
  def mult_dois_lista([]), do: []
  def mult_dois_lista([h|t]) do
    [h*h | mult_dois_lista(t)]
  end

  def tamanho([]), do: 0
  def tamanho([_|t]) do
    1 + tamanho(t)
  end

  def produto_lista([]), do: 1
  def produto_lista([h|t]) do
    h * produto_lista(t)
  end

  def and_lista([]), do: true
  def and_lista([h|t]) do
    h && and_lista(t) 
  end

  def insere_final(el, []), do: [el]
  def insere_final(el, [h|t]) do
    [h | insere_final(el, t)]
  end

  def neg_lista([]), do: []
  def neg_lista([h|t]) do
    [!h|neg_lista(t)] 
  end

  def join(arr, []), do: arr
  def join(arr, [h|t]) do
    join(insere_final(h, arr), t)
  end

  def concat_lista([]), do: []
  def concat_lista([h|t]) do
    join(h, concat_lista(t))
  end

  def inverte_lista([]), do: []
  def inverte_lista([h|t]) do
    insere_final(h, inverte_lista(t))
  end
end
