import React from "react";
import { css } from "@emotion/core";
import { PERIODS, defaultPeriod } from "dashboard/services/periods.js";

import CurrentUserRepositoryList from "dashboard/components/CurrentUser/CurrentUserRepositoryList.jsx";
import PeriodSelector from "dashboard/components/Period/PeriodSelector.jsx";
import RepositoryPlotsMergedPrsPerPersonLoader from "dashboard/components/Repository/Plots/RepositoryPlotsMergedPrsPerPersonLoader.jsx";
import RepositoryPlotsTotalPrsMergedLoader from "dashboard/components/Repository/Plots/RepositoryPlotsTotalPrsMergedLoader.jsx";

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

const chartStyles = css`
  display: grid;
  grid-template-columns: 50% 50%;
  grid-template-rows: repeat(1, 50vh);
`;

const DashboardPage = function ({ currentUser, match, router }) {
  const location = match.location;
  const selectedRepositoryId = location.query.repositoryId;
  const selectedPeriod = location.query.period || defaultPeriod;

  const handleChangePeriod = (period) => {
    router.push({
      ...location,
      query: {
        ...location.query,
        period,
      },
    });
  };

  const renderedNoCharts = (
    <div>
      <p>Please select a repository</p>
    </div>
  );

  const renderedCharts = (
    <div css={chartStyles}>
      <RepositoryPlotsMergedPrsPerPersonLoader
        repositoryId={selectedRepositoryId}
        period={selectedPeriod}
      />
      <RepositoryPlotsTotalPrsMergedLoader
        repositoryId={selectedRepositoryId}
        period={selectedPeriod}
      />
    </div>
  );

  return (
    <div css={rootStyles}>
      <nav css={navStyles}>
        <CurrentUserRepositoryList currentUser={currentUser} />
      </nav>
      <main css={mainStyles}>
        <PeriodSelector onChangePeriod={handleChangePeriod} />
        {selectedRepositoryId === undefined ? renderedNoCharts : renderedCharts}
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
