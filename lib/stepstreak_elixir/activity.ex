defmodule StepstreakElixir.Activity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "activities" do
    field :date, :date
    field :steps, :integer
    field :calories, :float
    field :distance, :float

    timestamps()
  end

  @doc false
  def changeset(activity, attrs) do
    activity
    |> cast(attrs, [:date, :steps, :calories, :distance])
    |> validate_required([:date, :steps, :calories, :distance])
  end
end
