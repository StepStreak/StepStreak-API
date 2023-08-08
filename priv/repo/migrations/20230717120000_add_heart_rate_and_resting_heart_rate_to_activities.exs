defmodule StepstreakElixir.Repo.Migrations.AddHeartRateAndRestingHeartRateToActivities do
  use Ecto.Migration

  def change do
    alter table(:activities) do
      add :heart_rate, :float
      add :resting_heart_rate, :float
    end
  end
end