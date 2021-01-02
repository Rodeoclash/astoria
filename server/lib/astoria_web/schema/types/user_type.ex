defmodule AstoriaWeb.Schema.Types.UserType do
  use Absinthe.Schema.Notation

  object :user do
    interface(:actor)
    interface(:node)
    interface(:timestamp)

    import_fields(:actor)
    import_fields(:node)
    import_fields(:timestamp)
  end
end
