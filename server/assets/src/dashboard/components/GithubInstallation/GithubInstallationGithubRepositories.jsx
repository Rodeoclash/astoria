import React, { useEffect } from "react";
import {
  createFragmentContainer,
  graphql,
  requestSubscription,
} from "react-relay";
import environment from "dashboard/services/relay/environment.js";

import GithubRepositoryNavigationItem from "dashboard/components/GithubRepository/GithubRepositoryNavigationItem.jsx";

const subscription = graphql`
  subscription GithubInstallationGithubRepositoriesSubscription($id: ID!) {
    githubInstallationRepositoriesUpdated(id: $id) {
      githubRepositories(first: 100) {
        edges {
          node {
            ...GithubRepositoryNavigationItem_githubRepository
            id
          }
        }
      }
    }
  }
`;

export const GithubInstallationGithubRepositories = function ({
  githubInstallation,
}) {
  useEffect(() => {
    const variables = {
      id: githubInstallation.id,
    };

    const disposable = requestSubscription(environment, {
      subscription,
      variables,
    });

    return function () {
      disposable.dispose();
    };
  });

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
      id
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
