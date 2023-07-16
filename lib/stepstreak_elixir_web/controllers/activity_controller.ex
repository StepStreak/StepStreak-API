defmodule StepstreakElixirWeb.ActivityController do
  use StepstreakElixirWeb, :controller

  alias StepstreakElixir.Activity
  alias StepstreakElixir.Repo
  alias Ecto.Multi

  def create(conn, %{"data" => activities_params}) do
    multi =
      activities_params
      |> Enum.with_index()
      |> Enum.reduce(Multi.new(), fn {activity_params, index}, multi ->
        Multi.insert(multi, :"activity_#{index}", Activity.changeset(%Activity{}, activity_params))
      end)

    case Repo.transaction(multi) do
      {:ok, _} ->
        conn
        |> put_status(:created)
        |> json(%{message: "Activities created successfully"})

      {:error, failed_operation, failed_value, _changes_so_far} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{message: "There was an error creating activities", details: inspect({failed_operation, failed_value})})
    end
  end
end
