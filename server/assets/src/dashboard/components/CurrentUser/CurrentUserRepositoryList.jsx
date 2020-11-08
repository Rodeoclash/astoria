import React from "react";
import { createFragmentContainer, graphql } from "react-relay";

import RepositoryNavigationItem from "dashboard/components/Repository/RepositoryNavigationItem.jsx";

export const CurrentUserRepositoryList = function ({ currentUser }) {
  const renderedRepositories = currentUser.repositories.edges.map(
    ({ node: repository }) => {
      return (
        <RepositoryNavigationItem key={repository.id} repository={repository} />
      );
    }
  );

  return <div>{renderedRepositories}</div>;
};

export default createFragmentContainer(CurrentUserRepositoryList, {
  currentUser: graphql`
    fragment CurrentUserRepositoryList_currentUser on CurrentUser {
      repositories(first: 100) {
        edges {
          node {
            ...RepositoryNavigationItem_repository
            id
          }
        }
      }
    }
  `,
});
