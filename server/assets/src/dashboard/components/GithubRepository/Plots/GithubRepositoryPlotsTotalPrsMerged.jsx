import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import PlotDateIntegerShow from "dashboard/components/PlotDateInteger/PlotDateIntegerShow.jsx";

export const GithubRepositoryPlotsTotalPrsMerged = function ({
  githubRepository,
}) {
  return (
    <div>
      <h3>Total PRs</h3>
      <PlotDateIntegerShow plotDateInteger={githubRepository.mergedPrs} />
      <p>Total number of PRs created for this repo</p>
    </div>
  );
};

export default createFragmentContainer(GithubRepositoryPlotsTotalPrsMerged, {
  githubRepository: graphql`
    fragment GithubRepositoryPlotsTotalPrsMerged_githubRepository on GithubRepository {
      mergedPrs(period: $period, start: $start, finish: $finish) {
        ...PlotDateIntegerShow_plotDateInteger
      }
    }
  `,
});
