defmodule AstoriaWeb.LayoutView do
  use AstoriaWeb, :view

  def get_astoria_config_item(name) do
    Application.get_env(:astoria, name)
  end
end
