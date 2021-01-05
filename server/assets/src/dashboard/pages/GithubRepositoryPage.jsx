import React from "react";
import { css } from "@emotion/core";

import GithubRepositoryName from "dashboard/components/GithubRepository/GithubRepositoryName.jsx";
import GithubRepositoryPlotsAnalysisClosedAgeLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisClosedAgeLoader.jsx";
import GithubRepositoryPlotsAnalysisLast30TotalLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisLast30TotalLoader.jsx";
import GithubRepositoryPlotsAnalysisMergedAgeLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisMergedAgeLoader.jsx";
import GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoader.jsx";
import GithubRepositoryPlotsAnalysisOpenedAgeLoader from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisOpenedAgeLoader.jsx";

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
  const githubRepositoryId = match.params.githubRepositoryId;

  return (
    <>
      <header css={headerStyles}>
        <GithubRepositoryName githubRepository={currentUser.githubRepository} />
      </header>
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
