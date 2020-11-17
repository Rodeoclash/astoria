import React from "react";
import { createFragmentContainer, graphql } from "react-relay";

import GithubRepositoryNavigationItem from "dashboard/components/GithubRepository/GithubRepositoryNavigationItem.jsx";

export const GithubInstallationGithubRepositories = function ({
  githubInstallation,
}) {
  const renderedList = githubInstallation.githubRepositories.edges.map(
    ({ node: githubRepository }) => {
      return (
        <GithubRepositoryNavigationItem
          key={githubRepository.id}
          githubRepository={githubRepository}
        />
      );
    }
  );

  return <div>{renderedList}</div>;
};

export default createFragmentContainer(GithubInstallationGithubRepositories, {
  githubInstallation: graphql`
    fragment GithubInstallationGithubRepositories_githubInstallation on GithubInstallation {
      githubRepositories(first: 100) {
        edges {
          node {
            ...GithubRepositoryNavigationItem_githubRepository
            id
          }
        }
      }
    }
  `,
});
