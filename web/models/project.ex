defmodule Buzzfeed.Project do
  use Buzzfeed.Web, :model

  schema "projects" do
    field :name, :string
    field :client_key, :string
    has_many :performance_entries, Buzzfeed.PerformanceEntry
    has_many :navigation_timings, Buzzfeed.NavigationTiming
    belongs_to :user, Buzzfeed.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :client_key])
    |> validate_required([:name, :client_key])
  end
end
