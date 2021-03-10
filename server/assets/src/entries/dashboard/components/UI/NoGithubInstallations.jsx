import React from "react";
import { css } from "@emotion/core";
import { ImWrench as Icon } from "react-icons/im";

const rootStyles = css`
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
`;

const badgeStyles = css`
  text-align: center;
`;

const iconStyles = css`
  font-size: 5rem;
`;

const NoGithubInstallations = function () {
  return (
    <div css={rootStyles}>
      <div css={badgeStyles}>
        <div css={iconStyles}>
          <Icon />
        </div>
        <h1>Almost there!</h1>
        <p>
          {window.SPA_CONFIG.publicName} needs to be installed into your GitHub
          repositories
          <br />
          Visit the{" "}
          <a href={window.SPA_CONFIG.githubAppPage}>
            GitHub application homepage
          </a>{" "}
          to complete the installation.
        </p>
      </div>
    </div>
  );
};

export default NoGithubInstallations;
