import React from "react";
import { createFragmentContainer, graphql } from "react-relay";

import GithubInstallationNavigationItem from "dashboard/components/GithubInstallation/GithubInstallationNavigationItem.jsx";

export const CurrentUserGithubInstallations = function ({ currentUser }) {
  const renderedList = currentUser.githubInstallations.edges.map(
    ({ node: githubInstallation }) => {
      return (
        <GithubInstallationNavigationItem
          key={githubInstallation.id}
          githubInstallation={githubInstallation}
        />
      );
    }
  );

  return <div>{renderedList}</div>;
};

export default createFragmentContainer(CurrentUserGithubInstallations, {
  currentUser: graphql`
    fragment CurrentUserGithubInstallations_currentUser on CurrentUser {
      githubInstallations(first: 100) {
        edges {
          node {
            ...GithubInstallationNavigationItem_githubInstallation
            id
          }
        }
      }
    }
  `,
});
