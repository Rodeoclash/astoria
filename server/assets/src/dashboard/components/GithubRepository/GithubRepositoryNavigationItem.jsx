import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";
import { Link, useRouter } from "found";

const rootStyles = css``;

export const GithubRepositoryNavigationItem = function ({ githubRepository }) {
  const { match } = useRouter();

  const to = {
    pathname: `/dashboard/githubRepositories/${githubRepository.id}`,
    query: {
      ...match.location.query,
    },
  };

  return (
    <div css={rootStyles}>
      <Link to={to}>{githubRepository.name}</Link>
    </div>
  );
};

export default createFragmentContainer(GithubRepositoryNavigationItem, {
  githubRepository: graphql`
    fragment GithubRepositoryNavigationItem_githubRepository on GithubRepository {
      id
      name
    }
  `,
});
