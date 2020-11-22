import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import PlotDateIntegerShow from "dashboard/components/PlotDateInteger/PlotDateIntegerShow.jsx";

export const GithubRepositoryPlotsMergedPrsPerPerson = function ({
  githubRepository,
}) {
  return (
    <div>
      <h3>Merged pull requests per person</h3>
      <PlotDateIntegerShow
        plotDateInteger={githubRepository.mergedPrsPerPerson}
      />
      <p>Shows the number of merged pull requests in the specified period</p>
    </div>
  );
};

export default createFragmentContainer(
  GithubRepositoryPlotsMergedPrsPerPerson,
  {
    githubRepository: graphql`
      fragment GithubRepositoryPlotsMergedPrsPerPerson_githubRepository on GithubRepository {
        mergedPrsPerPerson(period: $period, start: $start, finish: $finish) {
          ...PlotDateIntegerShow_plotDateInteger
        }
      }
    `,
  }
);
