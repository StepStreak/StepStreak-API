defmodule StepstreakElixir.Repo.Migrations.AddMaxHeartRateToActivitiesTable do
  use Ecto.Migration

  def change do
    alter table(:activities) do
      add :max_heart_rate, :float
    end
  end
end
