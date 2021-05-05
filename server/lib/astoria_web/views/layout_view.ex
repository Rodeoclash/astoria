defmodule AstoriaWeb.LayoutView do
  use AstoriaWeb, :view

  def public_name do
    Application.get_env(:astoria, :public_name)
  end
end
