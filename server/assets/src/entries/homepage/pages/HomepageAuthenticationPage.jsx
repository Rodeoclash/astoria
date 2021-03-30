import React from "react";
import { authRequest } from "services/phoenix-jsroutes.js";

const HomepageAuthenticationPage = function ({ currentUser, flashes }) {
  return <a href={authRequest("github")}>Login with Github</a>;
};

export const HomepageAuthenticationPageQuery = graphql`
  query HomepageAuthenticationPage_Query {
    currentUser {
      name
    }
  }
`;

export default HomepageAuthenticationPage;
