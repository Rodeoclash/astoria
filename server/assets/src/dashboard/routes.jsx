import React from "react";

import { makeRouteConfig, Route } from "found";

import AppPage, { AppPageQuery } from "dashboard/pages/AppPage.jsx";
import DashboardPage, {
  DashboardPageQuery,
  prepareVariables as dashboardPagePrepareVariables,
} from "dashboard/pages/DashboardPage.jsx";

const routeConfig = makeRouteConfig(
  <Route path="/" Component={AppPage} query={AppPageQuery}>
    <Route
      Component={DashboardPage}
      path="dashboard"
      query={DashboardPageQuery}
      prepareVariables={dashboardPagePrepareVariables}
    />
  </Route>
);

export default routeConfig;
