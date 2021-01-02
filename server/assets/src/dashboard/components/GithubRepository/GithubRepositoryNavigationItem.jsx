import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";
import { Link, useRouter } from "found";
import GithubRepositoryNavigationItemActivity from "dashboard/components/GithubRepository/GithubRepositoryNavigationItemActivity.jsx";

const rootStyles = css`
  display: flex;
`;

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
      <GithubRepositoryNavigationItemActivity
        githubRepository={githubRepository}
      />
      <Link to={to}>{githubRepository.name}</Link>
    </div>
  );
};

export default createFragmentContainer(GithubRepositoryNavigationItem, {
  githubRepository: graphql`
    fragment GithubRepositoryNavigationItem_githubRepository on GithubRepository {
      ...GithubRepositoryNavigationItemActivity_githubRepository
      id
      name
    }
  `,
});
