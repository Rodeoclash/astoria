import React from "react";
import { Global, css } from "@emotion/core";
import { Link } from "found";
import { theme } from "services/css.js";

import FlashList from "components/Flash/FlashList.jsx";

const globalStyles = css`
  body {
    background: ${theme.background};
    color: ${theme.text};
    font-family: "Raleway", sans-serif;
    font-weight: 400;
    margin: 0;
    padding: 0;
  }
`;

const DashboardRootPage = function ({ children, flashes }) {
  return (
    <>
      <Global styles={globalStyles} />
      {children}
      <FlashList flashes={flashes} />
    </>
  );
};

export const DashboardRootPageQuery = graphql`
  query DashboardRootPage_Query {
    currentUser {
      id
    }
    flashes {
      ...FlashList_flashes
    }
  }
`;

export default DashboardRootPage;
