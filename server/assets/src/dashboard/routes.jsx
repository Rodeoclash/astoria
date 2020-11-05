import React from "react";

import { makeRouteConfig, Route } from "found";

import AppPage, { AppPageQuery } from "dashboard/pages/AppPage.jsx";
import DashboardPage, { DashboardPageQuery } from "dashboard/pages/DashboardPage.jsx";

const routeConfig = makeRouteConfig(
  <Route path="/" Component={AppPage} query={AppPageQuery}>
    <Route Component={DashboardPage} path="dashboard" query={DashboardPageQuery} />
  </Route>
);

export default routeConfig;
