import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css, keyframes } from "@emotion/core";
import { Link, useRouter } from "found";
import { theme } from "dashboard/services/css.js";
import GithubRepositoryNavigationItemActivity from "dashboard/components/GithubRepository/GithubRepositoryNavigationItemActivity.jsx";

const spin = keyframes`
  from {transform:rotate(0deg);}
  to {transform:rotate(360deg);}
`;

const rootStyles = css`
  align-items: center;
  color: #fff;
  display: flex;
  margin: 0 -1rem;
  opacity: 0.66;
  padding: 0.5rem 1rem;
  text-decoration: none;

  &:hover {
    color: ${theme.link};
    opacity: 1;
  }

  & > svg {
    margin-right: 0.5rem;
    position: relative;
    top: 3px;
    animation: ${spin} 1s linear infinite;
    display: block;
  }
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
    <Link to={to} css={rootStyles}>
      <GithubRepositoryNavigationItemActivity
        githubRepository={githubRepository}
      />
      {githubRepository.name}
    </Link>
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
