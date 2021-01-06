import React from "react";
import { Global, css } from "@emotion/core";
import { Link } from "found";
import { theme } from "dashboard/services/css.js";

import FlashList from "dashboard/components/Flash/FlashList.jsx";

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

const rootStyles = css``;

const AppPage = function ({ children, flashes }) {
  return (
    <>
      <Global styles={globalStyles} />
      <div css={rootStyles}>{children}</div>
      <FlashList flashes={flashes} />
    </>
  );
};

export const AppPageQuery = graphql`
  query AppPage_Query {
    currentUser {
      id
    }
    flashes {
      ...FlashList_flashes
    }
  }
`;

export default AppPage;
