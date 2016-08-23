defmodule Buzzfeed.Repo.Migrations.CreateNavigationTiming do
  use Ecto.Migration

  def change do
    create table(:navigation_timings) do
      add :appcacheTime, :float
      add :connectEnd, :float
      add :connectStart, :float
      add :connectTime, :float
      add :domComplete, :float
      add :domContentLoadedEventEnd, :float
      add :domContentLoadedEventStart, :float
      add :domInteractive, :float
      add :domLoading, :float
      add :domReadyTime, :float
      add :domainLookupEnd, :float
      add :domainLookupStart, :float
      add :fetchStart, :float
      add :firstPaint, :float
      add :firstPaintTime, :float
      add :initDomTreeTime, :float
      add :loadEventEnd, :float
      add :loadEventStart, :float
      add :loadEventTime, :float
      add :loadTime, :float
      add :lookupDomainTime, :float
      add :navigationStart, :float
      add :readyStart, :float
      add :redirectEnd, :float
      add :redirectStart, :float
      add :redirectTime, :float
      add :requestStart, :float
      add :requestTime, :float
      add :responseEnd, :float
      add :responseStart, :float
      add :secureConnectionStart, :float
      add :unloadEventEnd, :float
      add :unloadEventStart, :float
      add :unloadEventTime, :float
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end
  end
end
