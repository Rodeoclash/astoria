import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";
import { Link, useRouter } from "found";

const rootStyles = css``;

export const RepositoryNavigationItem = function ({ repository }) {
  const { match } = useRouter();

  const to = {
    pathname: "/dashboard",
    query: {
      ...match.location.query,
      repositoryId: repository.id,
    },
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
