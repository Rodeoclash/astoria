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

const rootStyles = css`
  display: grid;
  gap: 1rem;
  grid-template-columns: 20rem auto 20rem;
  grid-template-rows: 3rem auto 3rem;
`;

const navStyles = css`
  grid-column-end: -1;
  grid-column-start: 1;
  grid-row-end: 1;
  grid-row-start: 1;
`;

const AppPage = function ({ children, flashes }) {
  return (
    <ThemeProvider theme={theme}>
      <Global styles={globalStyles} />
      <main css={rootStyles}>
        {children}
      </main>

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
