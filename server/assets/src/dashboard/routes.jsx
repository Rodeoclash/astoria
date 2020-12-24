import React from "react";

import { makeRouteConfig, Route } from "found";

import AppPage, { AppPageQuery } from "dashboard/pages/AppPage.jsx";
import DashboardPage, {
  DashboardPageQuery,
} from "dashboard/pages/DashboardPage.jsx";
import NoDashboardSelectionPage from "dashboard/pages/NoDashboardSelectionPage.jsx";
import GithubRepositoryPage, {
  GithubRepositoryPageQuery,
  prepareVariables as dashboardPagePrepareVariables,
} from "dashboard/pages/GithubRepositoryPage.jsx";

const routeConfig = makeRouteConfig(
  <Route path="/" Component={AppPage} query={AppPageQuery}>
    <Route
      Component={DashboardPage}
      path="dashboard"
      query={DashboardPageQuery}
    >
      <Route Component={NoDashboardSelectionPage} />
      <Route path="githubRepositories">
        <Route
          Component={GithubRepositoryPage}
          path=":githubRepositoryId"
          prepareVariables={dashboardPagePrepareVariables}
          query={GithubRepositoryPageQuery}
        />
      </Route>
    </Route>
  </Route>
);

export default routeConfig;
