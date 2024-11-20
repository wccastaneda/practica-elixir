defmodule Example2 do
  @moduledoc """
  Documentation for `Example2`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Example2.hello()
      :world

  """

  def launch_message(%{"description": "Pinblock vencido" <> _} = response) do
    "time stamp"
  end

  def launch_message(response) do
    "otro error"
  end

  def init(0) do
    0
  end

  def init(1) do
    1
  end

  def init(x) do
    x
  end

  def hello do
    :world
  end

  def normalize_object([head | tail]) do
    Enum.into([head | tail], %{})
  end

  ## With pipe operator

  def validate(a) do
    String.equivalent?(a, "a")
    |>
    case do
      true -> {:ok, true}
      false -> {:error, :not_true}
    end
  end

  ## Without pipe operator

  def validate_2(a) do
    case String.equivalent?(a, "a") do
      true -> {:ok, true}
      false -> {:error, :not_true}
    end
  end


  ## PRUEBAS

  def required_fields_are_valid(%{} = request) do
    required_fields = [
      request.name,
      request.age
    ]
    if Enum.all?(required_fields, &(&1 != nil and &1 != "")) do
      {:ok, true}
      else
      {:error, :fields_are_empty}
    end
  end

  def required_fields_are_valid(%{} = to_validate)
      when to_validate.name != nil and to_validate.name != "" and
           to_validate.age != nil and to_validate.age != ""
    do
    {:ok, true}
  end

  def required_fields_are_valid(_) do
    {:error, :fields_are_empty}
  end

  first_map = %{a: "wiston", b: "castaneda"}
  second_map = %{a: "wiston", b: %{c: "yes", d: "no", e: "data"}}

  def delete_user_and_password() do
    Map.update!(%{a: "wiston", b: %{c: "yes", d: "no", e: "data"}}, :b, fn(user_detail) ->
      delete_values = [:c, :d]
      Map.drop(user_detail, delete_values)
    end)
  end

end
