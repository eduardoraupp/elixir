defmodule Issues.CLI do 

    @default_count 4

    @moduledoc """
    blablabla
    """

    def run(argv) do 
        #parse_args(argv)
        argv
        |> parse_args
        |> process
    end

    def process(:help) do
        IO.puts """
            usage: issues <user> <project> [ count | #{@default_count} ]
        """
        System.halt(0)
    end

    def process({user, project, _count}) do
        Issues.GithubIssues.fetch(user, project)
        |> decode_response()
    end

    def decode_response({:ok, body}), do: body

    def decode_response({:error, error}) do
        IO.puts "Error fetching from GIthub: #{error["message"]}"
        System.halt(2)
    end

    @doc """
        `argv` can be -h or --help, which returns :help.​
    """

    def parse_args(argv) do 
        OptionParser.parse(argv, switches: [ help: :boolean], aliases: [ h: :help])
        |> elem(1)
        |> args_to_internal_representation
    end

    defp args_to_internal_representation([user, project, count ]) do
        { user, project, String.to_integer(count)}
    end

    defp args_to_internal_representation([user, project]) do
        { user, project, @default_count}
    end

    defp args_to_internal_representation(_) do
        :help
    end
end