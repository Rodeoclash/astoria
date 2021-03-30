import React from "react";
import { css } from "@emotion/core";
import CurrentUserGithubInstallations from "dashboard/components/CurrentUser/CurrentUserGithubInstallations.jsx";
import NoGithubInstallations from "dashboard/components/UI/NoGithubInstallations.jsx";
import PageLayout from "dashboard/components/UI/PageLayout.jsx";

const rootStyles = css`
  width: 100vw;
  height: 100vh;
`;

const DashboardPage = function ({ children, currentUser, dashboardSettings }) {
  const content = (function () {
    if (currentUser.hasGithubInstallations === false) {
      return <NoGithubInstallations />;
    } else {
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

      const aside = (
        <CurrentUserGithubInstallations currentUser={currentUser} />
      );

      return (
        <PageLayout title={title} aside={aside}>
          {children}
        </PageLayout>
      );
    }
  })();

  return <div css={rootStyles}>{content}</div>;
};

export const DashboardPageQuery = graphql`
  query DashboardPage_Query {
    dashboardSettings {
      selectedGithubInstallationName
      selectedGithubRepositoryName
    }
    currentUser {
      ...CurrentUserGithubInstallations_currentUser
      hasGithubInstallations
    }
  }
`;

export default DashboardPage;
