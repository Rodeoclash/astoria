import React from "react";
import CurrentUserGithubInstallations from "dashboard/components/CurrentUser/CurrentUserGithubInstallations.jsx";
import { theme } from "dashboard/services/css.js";
import { css } from "@emotion/core";

const rootStyles = css``;

const headerStyles = css`
  align-items: stretch;
  background: ${theme.panelBackground};
  display: flex;
  font-weight: 700;
  height: 5rem;
  margin-bottom: 2px;
`;

const logoStyles = css`
  align-items: center;
  background: ${theme.panelBackground};
  border-right: 2px solid ${theme.background};
  display: flex;
  font-family: "Lato", sans-serif;
  font-size: 1.8rem;
  justify-content: center;
  padding: 0 1rem;
  width: 18rem;
`;

const selectedGithubRepositoryNameStyles = css`
  align-items: center;
  justify-content: center;
  display: flex;
  flex-grow: 1;
  font-size: 1.4rem;
  font-weight: 200;
  padding: 0 1rem;
`;

const contentStyles = css`
  display: flex;
`;

const navStyles = css`
  background: ${theme.panelBackground};
  width: 18rem;
  padding: 0 1rem;
  overflow-y: auto;
  height: calc(100vh - 5rem - 1px);
`;

const mainStyles = css`
  flex-grow: 1;
  padding: 1rem;
`;

const DashboardPage = function ({ children, currentUser, dashboardSettings }) {
  return (
    <main css={rootStyles}>
      <header css={headerStyles}>
        <div css={logoStyles}>{window.SPA_CONFIG.publicName}</div>
        <div css={selectedGithubRepositoryNameStyles}>
          {dashboardSettings.selectedGithubInstallationName} /{" "}
          {dashboardSettings.selectedGithubRepositoryName}
        </div>
      </header>
      <div css={contentStyles}>
        <nav css={navStyles}>
          <CurrentUserGithubInstallations currentUser={currentUser} />
        </nav>
        <main css={mainStyles}>{children}</main>
      </div>
    </main>
  );
  return children;
};

export const DashboardPageQuery = graphql`
  query DashboardPage_Query {
    dashboardSettings {
      selectedGithubInstallationName
      selectedGithubRepositoryName
    }
    currentUser {
      id
      ...CurrentUserGithubInstallations_currentUser
    }
  }
`;

export default DashboardPage;
