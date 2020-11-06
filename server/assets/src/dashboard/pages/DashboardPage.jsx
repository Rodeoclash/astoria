import React from "react";
import { css } from "@emotion/core";

import CurrentUserRepositoryList from "dashboard/components/CurrentUser/CurrentUserRepositoryList.jsx";

const rootStyles = css`
  background: #fcf;
`;

const DashboardPage = function ({ currentUser }) {
  return (
    <div css={rootStyles}>
      <CurrentUserRepositoryList currentUser={currentUser} />
    </div>
  );
};

export const DashboardPageQuery = graphql`
  query DashboardPage_Query {
    currentUser {
      ...CurrentUserRepositoryList_currentUser
    }
  }
`;

export default DashboardPage;
