import React from "react";
import { css } from "@emotion/core";

import GithubRepositoryName from "dashboard/components/GithubRepository/GithubRepositoryName.jsx";

import GithubRepositoryPlotsAnalysisChangedLinesLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisChangedLinesLoader.jsx";
import GithubRepositoryPlotsAnalysisClosedAgeLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisClosedAgeLoader.jsx";
import GithubRepositoryPlotsAnalysisLast30TotalLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisLast30TotalLoader.jsx";
import GithubRepositoryPlotsAnalysisMergedAgeLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisMergedAgeLoader.jsx";
import GithubRepositoryPlotsAnalysisMergedClosedRatioLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisMergedClosedRatioLoader.jsx";
import GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoader.jsx";
import GithubRepositoryPlotsAnalysisOpenedAgeLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisOpenedAgeLoader.jsx";
import GithubRepositoryPlotsAnalysisOpenedTotalLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisOpenedTotalLoader.jsx";

const heroStyles = css`
  align-items: stretch;
  display: flex;
  justify-content: center;
  margin-bottom: 1rem;
  padding-bottom: 2rem;
  flex-wrap: wrap;

  & > * {
    margin: 0 1rem;
    width: 20rem;
    padding: 1rem;
  }
`;

const chartStyles = css`
  & > * {
    margin: 1rem;
    padding: 1rem;
  }
`;

const GithubRepositoryPage = function ({
  currentUser,
  match,
  router,
  path,
} = props) {
  const githubRepositoryId = match.params.githubRepositoryId;

  return (
    <>
      <GithubRepositoryName githubRepository={currentUser.githubRepository} />
      <div>
        <div css={heroStyles}>
          <GithubRepositoryPlotsAnalysisLast30TotalLoader
            githubRepositoryId={githubRepositoryId}
          />
          <GithubRepositoryPlotsAnalysisMergedAgeLoader
            githubRepositoryId={githubRepositoryId}
          />
          <GithubRepositoryPlotsAnalysisClosedAgeLoader
            githubRepositoryId={githubRepositoryId}
          />
          <GithubRepositoryPlotsAnalysisOpenedAgeLoader
            githubRepositoryId={githubRepositoryId}
          />
          <GithubRepositoryPlotsAnalysisOpenedTotalLoader
            githubRepositoryId={githubRepositoryId}
          />
          <GithubRepositoryPlotsAnalysisChangedLinesLoader
            githubRepositoryId={githubRepositoryId}
          />
          <GithubRepositoryPlotsAnalysisMergedClosedRatioLoader
            githubRepositoryId={githubRepositoryId}
          />
        </div>
        <div css={chartStyles}>
          <GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoader
            githubRepositoryId={githubRepositoryId}
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
