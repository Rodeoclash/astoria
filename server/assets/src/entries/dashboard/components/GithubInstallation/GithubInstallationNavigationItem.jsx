import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";
import { FaCaretRight } from "react-icons/fa";
import { FaCaretDown } from "react-icons/fa";

import GithubInstallationGithubRepositories from "dashboard/components/GithubInstallation/GithubInstallationGithubRepositories.jsx";

const rootStyles = css`
  & > h3 {
    align-items: center;
    display: flex;
    font-weight: 200;
  }
`;

const iconStyles = css`
  width: 1.5rem;
  position: relative;
  top: 2px;
`;

const nameStyles = css``;

const listStyles = css`
  margin-left: 1.5rem;
`;

export const GithubInstallationNavigationItem = function ({
  githubInstallation,
}) {
  return (
    <div css={rootStyles}>
      <h3>
        <div css={iconStyles}>
          <FaCaretRight />
        </div>
        <div css={nameStyles}>{githubInstallation.name}</div>
      </h3>
      <div css={listStyles}>
        <GithubInstallationGithubRepositories
          githubInstallation={githubInstallation}
        />
      </div>
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
