import React from "react";
import { css } from "@emotion/core";
import { PERIODS, defaultPeriod } from "dashboard/services/periods.js";

import CurrentUserGithubInstallations from "dashboard/components/CurrentUser/CurrentUserGithubInstallations.jsx";
import GithubRepositoryPlotsAnalysisClosedAgeLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisClosedAgeLoader.jsx";
import GithubRepositoryPlotsAnalysisLast30TotalLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisLast30TotalLoader.jsx";
import GithubRepositoryPlotsAnalysisMergedAgeLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisMergedAgeLoader.jsx";
import GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoader.jsx";
import GithubRepositoryPlotsAnalysisOpenedAgeLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisOpenedAgeLoader.jsx";
import GithubRepositoryPlotsAverageChangeInPrLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAverageChangeInPrLoader.jsx";
import GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoader.jsx";
import GithubRepositoryPlotsMergedPrsLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsMergedPrsLoader.jsx";
import GithubRepositoryPlotsMergedPrsPerPersonLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsMergedPrsPerPersonLoader.jsx";
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

const headerStyles = css`
  align-items: center;
  border-bottom: 1px solid #ccc;
  display: flex;
  justify-content: space-between;
  margin-bottom: 1rem;
  margin-top: 0;
  padding-bottom: 1rem;
`;

const heroStyles = css`
  align-items: stretch;
  border-bottom: 1px solid #ccc;
  display: flex;
  justify-content: center;
  margin-bottom: 1rem;
  padding-bottom: 2rem;

  & > * {
    margin: 0 1rem;
    width: 20rem;
    padding: 1rem;
    background: #eee;
  }
`;

const chartStyles = css`
  display: grid;
  grid-template-columns: 50% 50%;
  grid-template-rows: repeat(3, 50vh);

  & > * {
    margin: 1rem;
    padding: 1rem;
    border: 1px solid #ccc;
  }
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
    <div>
      <div css={heroStyles}>
        <GithubRepositoryPlotsAnalysisLast30TotalLoader
          githubRepositoryId={selectedGithubRepositoryId}
          period={selectedPeriod}
        />
        <GithubRepositoryPlotsAnalysisMergedAgeLoader
          githubRepositoryId={selectedGithubRepositoryId}
          period={selectedPeriod}
        />
        <GithubRepositoryPlotsAnalysisClosedAgeLoader
          githubRepositoryId={selectedGithubRepositoryId}
          period={selectedPeriod}
        />
        <GithubRepositoryPlotsAnalysisOpenedAgeLoader
          githubRepositoryId={selectedGithubRepositoryId}
          period={selectedPeriod}
        />
      </div>
      <div css={chartStyles}>
        <GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoader
          githubRepositoryId={selectedGithubRepositoryId}
          period={selectedPeriod}
        />
        <GithubRepositoryPlotsMergedPrsPerPersonLoader
          githubRepositoryId={selectedGithubRepositoryId}
          period={selectedPeriod}
        />
        <GithubRepositoryPlotsMergedPrsLoader
          githubRepositoryId={selectedGithubRepositoryId}
          period={selectedPeriod}
        />
        <GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoader
          githubRepositoryId={selectedGithubRepositoryId}
          period={selectedPeriod}
        />
        <GithubRepositoryPlotsAverageChangeInPrLoader
          githubRepositoryId={selectedGithubRepositoryId}
          period={selectedPeriod}
        />
      </div>
    </div>
  );

  return (
    <div css={rootStyles}>
      <nav css={navStyles}>
        <CurrentUserGithubInstallations currentUser={currentUser} />
      </nav>
      <main css={mainStyles}>
        <header css={headerStyles}>
          {/*<h2>{currentUser.githubRepository.name}</h2>*/}
          <div>
            Period: <PeriodSelector onChangePeriod={handleChangePeriod} />
          </div>
        </header>
        {selectedGithubRepositoryId === undefined
          ? renderedNoCharts
          : renderedCharts}
      </main>
    </div>
  );
};

export const prepareVariables = (params, { location }) => {
  return {
    githubRepositoryId: location.query.githubRepositoryId,
  };
};

export const DashboardPageQuery = graphql`
  query DashboardPage_Query {
    currentUser {
      ...CurrentUserGithubInstallations_currentUser
    }
  }
`;

export default DashboardPage;
