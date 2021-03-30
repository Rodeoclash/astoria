import React from "react";
import { Global, css } from "@emotion/core";
import { Link } from "found";

import FlashList from "components/Flash/FlashList.jsx";

const globalStyles = css`
  body {
    font-family: "Raleway", sans-serif;
    font-weight: 400;
    margin: 0;
    padding: 0;
  }
`;

const HomepageRootPage = function ({ children, flashes }) {
  return (
    <>
      <Global styles={globalStyles} />
      <h1>{window.SPA_CONFIG.publicName}</h1>
      {children}
      <FlashList flashes={flashes} />
    </>
  );
};

export const HomepageRootPageQuery = graphql`
  query HomepageRootPage_Query {
    currentUser {
      id
    }
    flashes {
      ...FlashList_flashes
    }
  }
`;

export default HomepageRootPage;
