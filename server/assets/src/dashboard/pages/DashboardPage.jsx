import React from "react";
import CurrentUserGithubInstallations from "dashboard/components/CurrentUser/CurrentUserGithubInstallations.jsx";

import { css } from "@emotion/core";

const rootStyles = css`
  display: flex;
`;

const navStyles = css`
  background: #eee;
  padding: 1rem;
  width: 20vw;
`;

const mainStyles = css`
  flex-grow: 1;
  padding: 1rem;
`;

const DashboardPage = function ({ children, currentUser }) {
  return (
    <div css={rootStyles}>
      <nav css={navStyles}>
        <CurrentUserGithubInstallations currentUser={currentUser} />
      </nav>
      <main css={mainStyles}>{children}</main>
    </div>
  );
  return children;
};

export const DashboardPageQuery = graphql`
  query DashboardPage_Query {
    currentUser {
      id
      ...CurrentUserGithubInstallations_currentUser
    }
  }
`;

export default DashboardPage;
