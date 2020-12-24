import React from "react";
import { css } from "@emotion/core";
import { PERIODS, defaultPeriod } from "dashboard/services/periods.js";

import GithubRepositoryName from "dashboard/components/GithubRepository/GithubRepositoryName.jsx";
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

const GithubRepositoryPage = function ({
  currentUser,
  match,
  router,
  path,
} = props) {
  const location = match.location;
  const selectedPeriod = location.query.period || defaultPeriod;
  const githubRepositoryId = match.params.githubRepositoryId;

  const handleChangePeriod = (period) => {
    router.push({
      ...location,
      query: {
        ...location.query,
        period,
      },
    });
  };

  return (
    <>
      <header css={headerStyles}>
        <GithubRepositoryName githubRepository={currentUser.githubRepository} />
        <div>
          Period: <PeriodSelector onChangePeriod={handleChangePeriod} />
        </div>
      </header>
      <div>
        <div css={heroStyles}>
          <GithubRepositoryPlotsAnalysisLast30TotalLoader
            githubRepositoryId={githubRepositoryId}
            period={selectedPeriod}
          />
          <GithubRepositoryPlotsAnalysisMergedAgeLoader
            githubRepositoryId={githubRepositoryId}
            period={selectedPeriod}
          />
          <GithubRepositoryPlotsAnalysisClosedAgeLoader
            githubRepositoryId={githubRepositoryId}
            period={selectedPeriod}
          />
          <GithubRepositoryPlotsAnalysisOpenedAgeLoader
            githubRepositoryId={githubRepositoryId}
            period={selectedPeriod}
          />
        </div>
        <div css={chartStyles}>
          <GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoader
            githubRepositoryId={githubRepositoryId}
            period={selectedPeriod}
          />
          <GithubRepositoryPlotsMergedPrsPerPersonLoader
            githubRepositoryId={githubRepositoryId}
            period={selectedPeriod}
          />
          <GithubRepositoryPlotsMergedPrsLoader
            githubRepositoryId={githubRepositoryId}
            period={selectedPeriod}
          />
          <GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoader
            githubRepositoryId={githubRepositoryId}
            period={selectedPeriod}
          />
          <GithubRepositoryPlotsAverageChangeInPrLoader
            githubRepositoryId={githubRepositoryId}
            period={selectedPeriod}
          />
        </div>
      </div>
    </>
  );
};

export const prepareVariables = (params) => {
  return {
    githubRepositoryId: params.githubRepositoryId,
  };
};

export const GithubRepositoryPageQuery = graphql`
  query GithubRepositoryPage_Query($githubRepositoryId: ID!) {
    currentUser {
      githubRepository(id: $githubRepositoryId) {
        ...GithubRepositoryName_githubRepository
      }
    }
  }
`;

export default GithubRepositoryPage;
