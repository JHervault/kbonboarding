#defmodule Server.Creator do
#    @doc false
#    defmacro __using__(_opts) do
#      quote do
#        import Server.Creator
#
#        # Initialize @tests to an empty list
#        @paths []
#
#        # Invoke TestCase.__before_compile__/1 before the module is compiled
#        @before_compile Server.Creator
#      end
#    end
#
#    @doc """
#    Defines a test case with the given description.
#
#    ## Examples
#
#        test "arithmetic operations" do
#          4 = 2 + 2
#        end
#
#    """
#    defmacro my_get(path, do: block) do
#      function_name = String.to_atom("my_get " <> path)
#      quote do
#        # Prepend the newly defined test to the list of tests
#        @paths [unquote(path) | @paths]
#        def unquote(function_name)(), do: unquote(block)
#      end
#    end
#
#    # This will be invoked right before the target module is compiled
#    # giving us the perfect opportunity to inject the `run/0` function
#    @doc false
#    defmacro __before_compile__(_env) do
#      quote do
#        def init(opts) do
#          import Plug.Conn
#          opts
#        end
#
#        def call(conn, _opts) do
#          :ok
#        end
#
#      end
#    end
#end
