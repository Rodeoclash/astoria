import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import PlotChangeShow from "dashboard/components/PlotChange/PlotChangeShow.jsx";

export const GithubRepositoryPlotsAnalysisLast30Total = function ({
  githubRepository,
}) {
  return (
    <div>
      <h3>PRs this month vs last month</h3>
      <PlotChangeShow plotChange={githubRepository.analysisLast30Total} />
    </div>
  );
};

export default createFragmentContainer(
  GithubRepositoryPlotsAnalysisLast30Total,
  {
    githubRepository: graphql`
      fragment GithubRepositoryPlotsAnalysisLast30Total_githubRepository on GithubRepository {
        analysisLast30Total(period: $period, start: $start, finish: $finish) {
          ...PlotChangeShow_plotChange
        }
      }
    `,
  }
);
