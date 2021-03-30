import React from "react";

import { makeRouteConfig, Route } from "found";

import DashboardRootPage, {
  DashboardRootPageQuery,
} from "dashboard/pages/DashboardRootPage.jsx";
import DashboardPage, {
  DashboardPageQuery,
} from "dashboard/pages/DashboardPage.jsx";
import DashboardNoSelectionPage from "dashboard/components/UI/NoRepositorySelected.jsx";
import DashboardGithubRepositoryPage, {
  DashboardGithubRepositoryPageQuery,
  prepareVariables as dashboardGithubRepositoryPagePrepareVariables,
} from "dashboard/pages/DashboardGithubRepositoryPage.jsx";

const routeConfig = makeRouteConfig(
  <Route path="/" Component={DashboardRootPage} query={DashboardRootPageQuery}>
    <Route
      Component={DashboardPage}
      path="dashboard"
      query={DashboardPageQuery}
    >
      <Route Component={DashboardNoSelectionPage} />
      <Route path="githubRepositories">
        <Route
          Component={DashboardGithubRepositoryPage}
          path=":githubRepositoryId"
          prepareVariables={dashboardGithubRepositoryPagePrepareVariables}
          query={DashboardGithubRepositoryPageQuery}
        />
      </Route>
    </Route>
  </Route>
);

export default routeConfig;
