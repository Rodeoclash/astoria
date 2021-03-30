import React from "react";

import { makeRouteConfig, Route } from "found";

import HomepageRootPage, {
  HomepageRootPageQuery,
} from "homepage/pages/HomepageRootPage.jsx";

import HomepagePage, {
  HomepagePageQuery,
} from "homepage/pages/HomepagePage.jsx";

import HomepageAuthenticationPage, {
  HomepageAuthenticationPageQuery,
} from "homepage/pages/HomepageAuthenticationPage.jsx";

const routeConfig = makeRouteConfig(
  <Route path="/" Component={HomepageRootPage} query={HomepageRootPageQuery}>
    <Route path="/" Component={HomepagePage} query={HomepagePageQuery} />
    <Route
      path="/authentication"
      Component={HomepageAuthenticationPage}
      query={HomepageAuthenticationPageQuery}
    />
  </Route>
);

export default routeConfig;
