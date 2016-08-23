defmodule Buzzfeed.TrackerController do
  use Buzzfeed.Web, :controller

  def index(%{assigns: %{version: :v1}} = conn, %{"id" => id}) do
    json conn, %{message: "Success"}
  end
end
