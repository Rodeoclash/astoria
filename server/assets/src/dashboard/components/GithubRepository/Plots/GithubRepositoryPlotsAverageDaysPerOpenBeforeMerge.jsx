import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import PlotDateFloatShow from "dashboard/components/PlotDateFloat/PlotDateFloatShow.jsx";

export const GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge = function ({
  githubRepository,
}) {
  return (
    <div>
      <h3>Average time taken to merge a PR in days</h3>
      <PlotDateFloatShow
        plotDateFloat={githubRepository.averageDaysPrOpenBeforeMerge}
      />
      <p>Lower the better</p>
    </div>
  );
};

export default createFragmentContainer(
  GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge,
  {
    githubRepository: graphql`
      fragment GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository on GithubRepository {
        averageDaysPrOpenBeforeMerge(
          period: $period
          start: $start
          finish: $finish
        ) {
          ...PlotDateFloatShow_plotDateFloat
        }
      }
    `,
  }
);
