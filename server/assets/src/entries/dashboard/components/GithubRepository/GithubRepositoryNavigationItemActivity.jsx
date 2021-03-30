import React, { useEffect, useReducer } from "react";
import {
  createFragmentContainer,
  graphql,
  requestSubscription,
} from "react-relay";
import environment from "services/relay/environment.js";
import { css } from "@emotion/core";
import { ImSpinner2 } from "react-icons/im";

const subscription = graphql`
  subscription GithubRepositoryNavigationItemActivitySubscription($id: ID!) {
    githubRepositoryUpdated(id: $id) {
      lastActivityAt
    }
  }
`;

export const GithubRepositoryNavigationItemActivity = function ({
  githubRepository,
}) {
  const [_, forceUpdate] = useReducer((x) => x + 1, 0);

  useEffect(() => {
    const variables = {
      id: githubRepository.id,
    };

    const disposable = requestSubscription(environment, {
      subscription,
      variables,
    });

    return function () {
      disposable.dispose();
    };
  });

  useEffect(() => {
    const rerender = setInterval(() => {
      forceUpdate();
    }, 1000);

    return function () {
      window.clearInterval(rerender);
    };
  });

  const now = new Date().getTime();
  const lastActivityAt = new Date(githubRepository.lastActivityAt).getTime();
  const hasActivity = (now - lastActivityAt) / 1000 <= 10;

  if (hasActivity === false) {
    return null;
  }

  return <ImSpinner2 />;
};

export default createFragmentContainer(GithubRepositoryNavigationItemActivity, {
  githubRepository: graphql`
    fragment GithubRepositoryNavigationItemActivity_githubRepository on GithubRepository {
      id
      lastActivityAt
    }
  `,
});
