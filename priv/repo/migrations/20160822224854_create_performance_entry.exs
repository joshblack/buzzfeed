defmodule Buzzfeed.Repo.Migrations.CreatePerformanceEntry do
  use Ecto.Migration

  def change do
    create table(:performance_entries) do
      add :connectEnd, :float
      add :connectStart, :float
      add :domainLookupEnd, :float
      add :domainLookupStart, :float
      add :duration, :float
      add :entryType, :string
      add :fetchStart, :float
      add :initiatorType, :string
      add :name, :string
      add :redirectEnd, :float
      add :redirectStart, :float
      add :requestStart, :float
      add :responseEnd, :float
      add :responseStart, :float
      add :secureConnectionStart, :float
      add :startTime, :float
      add :workerStart, :float
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end
    create index(:performance_entries, [:project_id])
  end
end
