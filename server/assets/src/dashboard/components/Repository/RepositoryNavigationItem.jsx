import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";
import { Link } from "found";

const rootStyles = css``;

export const RepositoryNavigationItem = function ({ repository }) {
  const to = {
    pathname: "/dashboard",
    query: { repositoryId: repository.id },
  };

  return (
    <div css={rootStyles}>
      <Link to={to}>{repository.name}</Link>
    </div>
  );
};

export default createFragmentContainer(RepositoryNavigationItem, {
  repository: graphql`
    fragment RepositoryNavigationItem_repository on Repository {
      id
      name
    }
  `,
});
