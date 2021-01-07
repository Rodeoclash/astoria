import React from "react";
import CurrentUserGithubInstallations from "dashboard/components/CurrentUser/CurrentUserGithubInstallations.jsx";
import { theme } from "dashboard/services/css.js";
import { css } from "@emotion/core";

const rootStyles = css`
  position: relative;
`;

const headerStyles = css`
  align-items: stretch;
  background: ${theme.panelBackground};
  display: flex;
  font-weight: 700;
  height: 5rem;
  position: fixed;
  top: 0;
  right: 0;
  left: 0;
  z-index: 2;
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

const titleStyles = css`
  align-items: center;
  justify-content: center;
  display: flex;
  flex-grow: 1;
  font-size: 1.4rem;
  font-weight: 200;
  padding: 0 1rem;
`;

const contentStyles = css``;

const navStyles = css`
  background: ${theme.panelBackground};
  overflow-y: auto;
  padding: 0 1rem;
  position: fixed;
  top: calc(5rem + 2px);
  left: 0;
  width: 18rem;
  height: calc(100vh - (5rem -2px));
  z-index: 2;
`;

const mainStyles = css`
  padding-left: 20rem;
  padding-top: calc(5rem + 2px);
`;

const DashboardPage = function ({ children, currentUser, dashboardSettings }) {
  const title = (() => {
    if (
      dashboardSettings.selectedGithubInstallationName &&
      dashboardSettings.selectedGithubRepositoryName
    ) {
      return (
        <>
          {dashboardSettings.selectedGithubInstallationName} /{" "}
          {dashboardSettings.selectedGithubRepositoryName}
        </>
      );
    }
  })();
  return (
    <div css={rootStyles}>
      <header css={headerStyles}>
        <div css={logoStyles}>{window.SPA_CONFIG.publicName}</div>
        <div css={titleStyles}>{title}</div>
      </header>
      <div css={contentStyles}>
        <nav css={navStyles}>
          <CurrentUserGithubInstallations currentUser={currentUser} />
        </nav>
        <main css={mainStyles}>{children}</main>
      </div>
    </div>
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
