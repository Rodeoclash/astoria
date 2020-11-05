import React from "react";
import { css } from "@emotion/core";

const rootStyles = css`
  background: #fcf;
`;

const DashboardPage = function ({ currentUser }) {
  return (
    <div css={rootStyles}>
      <p>Hello {currentUser.name}</p>
    </div>
  );
};

export const DashboardPageQuery = graphql`
  query DashboardPage_Query {
    currentUser {
      name
    }
  }
`;

export default DashboardPage;
