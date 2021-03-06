defmodule Dialyxir.Warnings.ExactEquality do
  @behaviour Dialyxir.Warning

  @impl Dialyxir.Warning
  @spec warning() :: :exact_eq
  def warning(), do: :exact_eq

  @impl Dialyxir.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short(_) do
    "Expression can never evaluate to true."
  end

  @impl Dialyxir.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([type1, op, type2]) do
    pretty_type1 = Dialyxir.PrettyPrint.pretty_print_type(type1)
    pretty_type2 = Dialyxir.PrettyPrint.pretty_print_type(type2)

    "The test #{pretty_type1} #{op} #{pretty_type2} can never evaluate to 'true'."
  end

  @impl Dialyxir.Warning
  @spec explain() :: String.t()
  def explain() do
    """
    Expression can never evaluate to true.

    Example:

    defmodule Example do
      def ok() do
        :ok == :error
      end
    end
    """
  end
end
