import React, { useEffect, useReducer } from "react";
import {
  createFragmentContainer,
  graphql,
  requestSubscription,
} from "react-relay";
import environment from "dashboard/services/relay/environment.js";
import BounceLoader from "react-spinners/BounceLoader";
import { css } from "@emotion/core";

const rootStyles = css`
  margin-right: 1.25rem;
`;

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
  const hasActivity = (now - lastActivityAt) / 1000 <= 5;

  if (hasActivity === false) {
    return null;
  }

  return (
    <div css={rootStyles} title="Currently syncing data">
      <BounceLoader size={15} />
    </div>
  );
};

export default createFragmentContainer(GithubRepositoryNavigationItemActivity, {
  githubRepository: graphql`
    fragment GithubRepositoryNavigationItemActivity_githubRepository on GithubRepository {
      id
      lastActivityAt
    }
  `,
});
