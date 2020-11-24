import React from "react";
import { css } from "@emotion/core";
import { PERIODS, defaultPeriod } from "dashboard/services/periods.js";

import CurrentUserGithubInstallations from "dashboard/components/CurrentUser/CurrentUserGithubInstallations.jsx";
import GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoader.jsx";
import GithubRepositoryPlotsMergedPrsPerPersonLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsMergedPrsPerPersonLoader.jsx";
import GithubRepositoryPlotsTotalPrsMergedLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsTotalPrsMergedLoader.jsx";
import PeriodSelector from "dashboard/components/Period/PeriodSelector.jsx";

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
  grid-template-rows: repeat(2, 50vh);
`;

const DashboardPage = function ({ currentUser, match, router }) {
  const location = match.location;
  const selectedGithubRepositoryId = location.query.githubRepositoryId;
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
      <GithubRepositoryPlotsMergedPrsPerPersonLoader
        githubRepositoryId={selectedGithubRepositoryId}
        period={selectedPeriod}
      />
      <GithubRepositoryPlotsTotalPrsMergedLoader
        githubRepositoryId={selectedGithubRepositoryId}
        period={selectedPeriod}
      />
      <GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoader
        githubRepositoryId={selectedGithubRepositoryId}
        period={selectedPeriod}
      />
    </div>
  );

  return (
    <div css={rootStyles}>
      <nav css={navStyles}>
        <CurrentUserGithubInstallations currentUser={currentUser} />
      </nav>
      <main css={mainStyles}>
        <PeriodSelector onChangePeriod={handleChangePeriod} />
        {selectedGithubRepositoryId === undefined
          ? renderedNoCharts
          : renderedCharts}
      </main>
    </div>
  );
};

export const DashboardPageQuery = graphql`
  query DashboardPage_Query {
    currentUser {
      ...CurrentUserGithubInstallations_currentUser
    }
  }
`;

export default DashboardPage;
