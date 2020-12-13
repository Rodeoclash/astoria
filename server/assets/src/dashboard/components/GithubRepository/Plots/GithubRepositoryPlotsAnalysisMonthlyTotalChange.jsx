import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import PlotChangeShow from "dashboard/components/PlotChange/PlotChangeShow.jsx";

export const GithubRepositoryPlotsAnalysisMonthlyTotalChange = function ({
  githubRepository,
}) {
  return (
    <div>
      <h3>PRs created this month</h3>
      <PlotChangeShow
        plotChange={githubRepository.analysisMonthlyTotalChange}
      />
      The amount of PRs created this month vs. last month
    </div>
  );
};

export default createFragmentContainer(
  GithubRepositoryPlotsAnalysisMonthlyTotalChange,
  {
    githubRepository: graphql`
      fragment GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository on GithubRepository {
        analysisMonthlyTotalChange(
          period: $period
          start: $start
          finish: $finish
        ) {
          ...PlotChangeShow_plotChange
        }
      }
    `,
  }
);
