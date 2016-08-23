defmodule Buzzfeed.NavigationTiming do
  use Buzzfeed.Web, :model

  @required_fields ~w(appcacheTime connectEnd connectStart connectTime
   domComplete domContentLoadedEventEnd domContentLoadedEventStart
   domInteractive domLoading domReadyTime domainLookupEnd domainLookupStart
   fetchStart firstPaint firstPaintTime initDomTreeTime loadEventEnd
   loadEventStart loadEventTime loadTime lookupDomainTime navigationStart
   readyStart redirectEnd redirectStart redirectTime requestStart requestTime
   responseEnd responseStart secureConnectionStart unloadEventEnd
   unloadEventStart unloadEventTime)

  schema "navigation_timings" do
    field :appcacheTime, :float
    field :connectEnd, :float
    field :connectStart, :float
    field :connectTime, :float
    field :domComplete, :float
    field :domContentLoadedEventEnd, :float
    field :domContentLoadedEventStart, :float
    field :domInteractive, :float
    field :domLoading, :float
    field :domReadyTime, :float
    field :domainLookupEnd, :float
    field :domainLookupStart, :float
    field :fetchStart, :float
    field :firstPaint, :float
    field :firstPaintTime, :float
    field :initDomTreeTime, :float
    field :loadEventEnd, :float
    field :loadEventStart, :float
    field :loadEventTime, :float
    field :loadTime, :float
    field :lookupDomainTime, :float
    field :navigationStart, :float
    field :readyStart, :float
    field :redirectEnd, :float
    field :redirectStart, :float
    field :redirectTime, :float
    field :requestStart, :float
    field :requestTime, :float
    field :responseEnd, :float
    field :responseStart, :float
    field :secureConnectionStart, :float
    field :unloadEventEnd, :float
    field :unloadEventStart, :float
    field :unloadEventTime, :float
    belongs_to :project, Buzzfeed.Project

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end
end
