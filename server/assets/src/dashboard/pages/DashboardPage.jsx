import React from "react";
import { css } from "@emotion/core";

import CurrentUserRepositoryList from "dashboard/components/CurrentUser/CurrentUserRepositoryList.jsx";
import PeriodSelector from "dashboard/components/Period/PeriodSelector.jsx";
import RepositoryLoad from "dashboard/components/Repository/RepositoryLoad.jsx";

const rootStyles = css`
  display: flex;
`;

const navStyles = css`
  background: #eee;
  padding: 1rem;
  width: 20vw;
`;

const mainStyles = css`
  flex-grow: 1;
  padding: 1rem;
`;

const DashboardPage = function ({ currentUser, match, router }) {
  const location = match.location;
  const repositoryId = location.query.repositoryId;
  const period = location.query.period;

  const handleChangePeriod = (newPeriod) => {
    router.push({
      ...location,
      query: {
        ...location.query,
        period: newPeriod,
      },
    });
  };

  return (
    <div css={rootStyles}>
      <nav css={navStyles}>
        <CurrentUserRepositoryList currentUser={currentUser} />
      </nav>
      <main css={mainStyles}>
        <PeriodSelector onChangePeriod={handleChangePeriod} />
        <RepositoryLoad repositoryId={repositoryId} />
      </main>
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
