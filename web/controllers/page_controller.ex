defmodule Buzzfeed.PageController do
  use Buzzfeed.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
