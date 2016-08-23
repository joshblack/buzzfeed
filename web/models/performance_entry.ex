defmodule Buzzfeed.PerformanceEntry do
  use Buzzfeed.Web, :model

  @required_fields ~w(connectEnd, connectStart, domainLookupEnd,
   domainLookupStart, duration, entryType, fetchStart, initiatorType, name,
   redirectEnd, redirectStart, requestStart, responseEnd, responseStart,
   secureConnectionStart, startTime, workerStart)

  schema "performance_entries" do
    field :connectEnd, :float
    field :connectStart, :float
    field :domainLookupEnd, :float
    field :domainLookupStart, :float
    field :duration, :float
    field :entryType, :string
    field :fetchStart, :float
    field :initiatorType, :string
    field :name, :string
    field :redirectEnd, :float
    field :redirectStart, :float
    field :requestStart, :float
    field :responseEnd, :float
    field :responseStart, :float
    field :secureConnectionStart, :float
    field :startTime, :float
    field :workerStart, :float
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
