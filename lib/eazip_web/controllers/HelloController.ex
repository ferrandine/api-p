defmodule EazipWeb.HelloController do
  use EazipWeb, :controller

  def index(conn, _opts) do
    json(conn, %{ hello: "world" })
  end
end
