defmodule Rectangle do
  def area({a, b}) do
    a * b
  end
end

defmodule Geometry do
  def area({:rectangle, a, b}) do
    a * b
  end

  def area({:square, a}) do
    a * a
  end

  def area({:trinagle, a, b}) do
    a * b / 2
  end

  def area({:circle, r}) do
    r * r * 3.14
  end

  # El patter matich en funciones va en orden, por eso es importante poner la default al final
  def area(unknow) do
    {:error, unknow}
  end
end

defmodule Geometry2 do
  def area(values) do
    case values do
      {:rectangle, a, b} -> a * b
      {:square, a} -> a * a
      {:trinagle, a, b} -> a * b / 2
      {:circle, r} -> r * r * 3.14
    end
  end
end

defmodule TestNum do
  def test(x) when is_number(x) and x < 0 do # ⚔ Esto es un guard  o precondición
    :negative
  end

  def test(0) do
    :zero
  end

  def test(x) when is_number(x) and x > 0 do
    :positive
  end

  # def test(x) when  x > 0 do aqui se cumplirá el mayor que si se le pasa un string por la relación entre tipos de datos
  #   :positive
  # end

  number < atom < reference < fun < port < pid < tuple <map < list < bistring (binary)
end

# tupla, mapa , lista por valor y por head | tail, binario
# no existen las cadenas para la BEAM son binarios en realidad solo que
