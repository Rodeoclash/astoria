defmodule Astoria.Github.GraphQL.Request do
  def viewer_details do
    """
      query {
        viewer {
          email
          name
        }
      }
    """
  end

  def repositories do
    """
      query {
        viewer {
          name
        }
      }
    """
  end
end
