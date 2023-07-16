defmodule StepstreakElixir.Services.ProducerService do
  require Logger

  alias AMQP.Connection
  alias AMQP.Channel
  alias AMQP.Basic

  def send_to_rabbitmq(results) do
    case Connection.open() do
      {:ok, connection} ->
        send_messages(connection, results)
        Connection.close(connection)

      {:error, error} ->
        Logger.error("Failed to open a connection to RabbitMQ: #{inspect(error)}")
    end
  end

  defp send_messages(connection, results) do
    {:ok, channel} = Channel.open(connection)

    exchange = ""
    routing_key = "activities"

    Enum.each(results, fn {_operation_name, activity} ->
      activity = Ecto.Changeset.change(activity) |> Ecto.Changeset.apply_changes()

      activity = Map.drop(activity, [:id, :__meta__, :__struct__, :inserted_at, :updated_at])

      message = Jason.encode!(activity)
      Basic.publish(channel, exchange, routing_key, message)
    end)

  end
end
