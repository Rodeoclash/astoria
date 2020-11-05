defmodule AstoriaWeb.Schema.Types.CurrentUserType do
  use Absinthe.Schema.Notation

  object :current_user do
    interface(:actor)
    interface(:node)
    interface(:timestamp)

    import_fields(:actor)
    import_fields(:node)
    import_fields(:timestamp)

    field :email, non_null(:string)
    field :name, non_null(:string)
  end
end
