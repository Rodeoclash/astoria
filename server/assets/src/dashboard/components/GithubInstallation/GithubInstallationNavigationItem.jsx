import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";

import GithubInstallationGithubRepositories from "dashboard/components/GithubInstallation/GithubInstallationGithubRepositories.jsx";

const rootStyles = css``;

export const GithubInstallationNavigationItem = function ({
  githubInstallation,
}) {
  return (
    <div css={rootStyles}>
      <h3>{githubInstallation.name}</h3>
      <GithubInstallationGithubRepositories
        githubInstallation={githubInstallation}
      />
    </div>
  );
};

export default createFragmentContainer(GithubInstallationNavigationItem, {
  githubInstallation: graphql`
    fragment GithubInstallationNavigationItem_githubInstallation on GithubInstallation {
      ...GithubInstallationGithubRepositories_githubInstallation
      name
    }
  `,
});
