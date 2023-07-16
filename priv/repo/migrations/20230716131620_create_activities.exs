defmodule StepstreakElixir.Repo.Migrations.CreateActivities do
  use Ecto.Migration

  def change do
    create table(:activities) do
      add :date, :date
      add :steps, :integer
      add :calories, :float
      add :distance, :float

      timestamps()
    end
  end
end
