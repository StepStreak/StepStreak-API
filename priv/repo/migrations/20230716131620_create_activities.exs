defmodule StepstreakElixir.Repo.Migrations.CreateActivities do
  use Ecto.Migration

  def change do
    create table(:activities) do
      add :date, :date
      add :steps, :integer
      add :calories, :float
      add :distance, :float
      add :heart_rate, :float
      add :resting_heart_rate, :float

      timestamps()
    end
  end
end