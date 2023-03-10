defmodule Solution do
  @spec climb_stairs(n :: integer) :: integer
  def climb_stairs(n) do
    climb_stairs(%{}, n) |> elem(1)
  end 
    
  def climb_stairs(cache, 1), do: {cache, 1}
  def climb_stairs(cache, 2), do: {cache, 2}
  def climb_stairs(cache, n) do
    case Map.has_key?(cache, n) do
      true -> {cache, cache[n]}
      _ -> 
        {cache, result_1} = climb_stairs(cache, n-1)
        {cache, result_2} = climb_stairs(cache, n-2)
        total = result_1 + result_2
        {Map.put(cache, n, total), total}
    end
  end
end
