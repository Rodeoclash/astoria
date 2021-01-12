import React from "react";
import { QueryRenderer, graphql } from "react-relay";
import environment from "dashboard/services/relay/environment.js";
import { defaultDateRange } from "dashboard/services/data.js";

import PlotHero from "dashboard/components/PlotHero/PlotHero.jsx";

const GithubRepositoryPlotsAnalysisMergedAgeLoader = function ({
  githubRepositoryId,
}) {
  const renderQuery = ({ error, props }) => {
    if (error) {
      return <div>{error.message}</div>;
    } else if (props) {
      return (
        <PlotHero
          plotHero={props.currentUser.githubRepository.analysisMergedAge}
        />
      );
    }
    return <div>Loading</div>;
  };

  const [start, finish] = defaultDateRange();

  return (
    <QueryRenderer
      environment={environment}
      query={graphql`
        query GithubRepositoryPlotsAnalysisMergedAgeLoaderQuery(
          $githubRepositoryId: ID!
          $start: DateTime!
          $finish: DateTime!
        ) {
          currentUser {
            githubRepository(id: $githubRepositoryId) {
              analysisMergedAge(start: $start, finish: $finish) {
                ...PlotHero_plotHero
              }
            }
          }
        }
      `}
      variables={{
        githubRepositoryId,
        start: start.toISOString(),
        finish: finish.toISOString(),
      }}
      render={renderQuery}
    />
  );
};

export default GithubRepositoryPlotsAnalysisMergedAgeLoader;
