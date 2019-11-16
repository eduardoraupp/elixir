defmodule Issues.CLI do 

    @default_count 4

    @moduledoc """
    blablabla
    """

    def run(argv) do 
        parse_args(argv)
    end

    @doc """
        `argv` can be -h or --help, which returns :help.​
    """

    def parse_args(argv) do 
        OptionParser.parse(argv, switches: [ help: :boolean], aliases: [ h: :help])
        |> elem(1)
        |> args_to_internal_representation
    end

    def args_to_internal_representation([user, project, count ]) do
        { user, project, String.to_integer(count)}
    end

    def args_to_internal_representation([user, project]) do
        { user, project, @default_count}
    end

    def args_to_internal_representation(_) do
        :help
    end
end