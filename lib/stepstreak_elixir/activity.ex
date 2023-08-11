defmodule StepstreakElixir.Activity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "activities" do
    field :date, :date
    field :steps, :integer
    field :calories, :float
    field :distance, :float
    field :heart_rate, :float
    field :resting_heart_rate, :float
    field :max_heart_rate, :float

    timestamps()
  end

  @doc false
  def changeset(activity, attrs) do
    activity
    |> cast(attrs, [:date, :steps, :calories, :distance, :heart_rate, :resting_heart_rate, :max_heart_rate])
    |> validate_required([:date, :steps, :calories, :distance, :heart_rate, :resting_heart_rate, :max_heart_rate])
  end
end
