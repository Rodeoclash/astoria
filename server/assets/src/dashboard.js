import React from "react";
import ReactDOM from "react-dom";

import BrowserProtocol from "farce/BrowserProtocol";
import createFarceRouter from "found/createFarceRouter";
import queryMiddleware from "farce/queryMiddleware";
import { Resolver } from "found-relay";

import routes from "dashboard/routes.jsx";
import environment from "dashboard/services/relay/environment.js";

const Router = createFarceRouter({
  historyProtocol: new BrowserProtocol(),
  historyMiddlewares: [queryMiddleware],
  routeConfig: routes,
});

const mountElement = document.createElement("div");

if (window.SPA_FLASHES.info) {
  alert(`INFO: ${window.SPA_FLASHES.info}`);
}

if (window.SPA_FLASHES.error) {
  alert(`ERROR: ${window.SPA_FLASHES.error}`);
}

ReactDOM.render(
  <Router resolver={new Resolver(environment)} />,
  document.body.appendChild(mountElement)
);
