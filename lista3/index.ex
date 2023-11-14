defmodule Lista do
  def vendas(0), do: 33
  def vendas(1), do: 22
  def vendas(2), do: 18
  def vendas(3), do: 0
  def vendas(4), do: 66
  def vendas(_n), do: 22

  def maxi(a, b) do
    cond do
      a > b -> a
      true -> b
    end
  end

  def maior_venda(0), do: vendas(0)
  def maior_venda(n) do
    maxi(vendas(n), maior_venda(n-1))
  end


  def semana_max_venda(0), do: 0
  def semana_max_venda(n) do
    if maior_venda(n) == vendas(n) do
      n
    else
      semana_max_venda(n-1)
    end
  end


  def zero_vendas(n) when n < 0 do
    -1
  end
  def zero_vendas(n) do
    if vendas(n) == 0 do
      n
    else
      zero_vendas(n - 1)
    end
  end

  def acha_semana(value, n) when n < 0 do
    -1
  end
  def acha_semana(value, n) do
    if value == vendas(n) do
      n
    else
      acha_semana(value, n-1)
    end
  end


  # 6: zero_vendas(n), do: acha_semana(0, n)
  # 7: a ideia e trocar o caso base de 0 para m
  def fatorial_intervalo(m, n) do
    if (n < m) do
      1
    else 
      n * fatorial_intervalo(m, n-1)
    end
  end

  def potencia(_, exp) when exp < 1 do
    1
  end
  def potencia(base, exp) do
    base * potencia(base, exp-1)
  end


  def fib(n) when n <= 1 do
    n
  end
  def fib(n) do
    fib(n-1) + fib(n-2)
  end

  def fib_iterative(n) when n < 2 do
    fib(n)
  end
  def fib_iterative(n) do
    Enum.at(Enum.reduce(2..n, [0, 1], fn i, acc ->
      acc ++ [Enum.at(acc, i-1) + Enum.at(acc, i-2)]
    end), n)
  end
end
