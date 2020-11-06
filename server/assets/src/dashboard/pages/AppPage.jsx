import React from "react";
import { Global, css } from "@emotion/core";
import { Link } from "found";
import { theme } from "dashboard/services/css.js";

import FlashList from "dashboard/components/Flash/FlashList.jsx";
import { ThemeProvider } from "emotion-theming";

const globalStyles = css`
  body {
    font-family: "Lato", sans-serif;
    margin: 0;
    padding: 0;
  }
`;

const rootStyles = css``;

const AppPage = function ({ children, flashes }) {
  return (
    <ThemeProvider theme={theme}>
      <Global styles={globalStyles} />
      <main css={rootStyles}>{children}</main>

      <FlashList flashes={flashes} />
    </ThemeProvider>
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
