import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import PlotDateFloatShow from "dashboard/components/PlotDateFloat/PlotDateFloatShow.jsx";

export const GithubRepositoryPlotsAverageChangeInPr = function ({
  githubRepository,
}) {
  return (
    <div>
      <h3>Average change in a PR</h3>
      <PlotDateFloatShow plotDateFloat={githubRepository.averageChangeInPr} />
      <p>How many additions plus subtractions in a PR</p>
    </div>
  );
};

export default createFragmentContainer(GithubRepositoryPlotsAverageChangeInPr, {
  githubRepository: graphql`
    fragment GithubRepositoryPlotsAverageChangeInPr_githubRepository on GithubRepository {
      averageChangeInPr(period: $period, start: $start, finish: $finish) {
        ...PlotDateFloatShow_plotDateFloat
      }
    }
  `,
});
