defmodule RecordsWeb.PageController do
  use RecordsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
