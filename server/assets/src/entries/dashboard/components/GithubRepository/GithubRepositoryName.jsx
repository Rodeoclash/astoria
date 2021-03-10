import React, { useEffect } from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";
import environment from "services/relay/environment.js";
import updateHeaderTitle from "services/relay/mutations/update_header_title.js";

const rootStyles = css``;

export const GithubRepositoryName = function ({ githubRepository }) {
  useEffect(() => {
    updateHeaderTitle(environment, {
      selectedGithubInstallationName: githubRepository.githubInstallation.name,
      selectedGithubRepositoryName: githubRepository.name,
    });

    return function () {
      updateHeaderTitle(environment, {
        selectedGithubInstallationName: null,
        selectedGithubRepositoryName: null,
      });
    };
  });

  return null;
};

export default createFragmentContainer(GithubRepositoryName, {
  githubRepository: graphql`
    fragment GithubRepositoryName_githubRepository on GithubRepository {
      name
      githubInstallation {
        name
      }
    }
  `,
});
