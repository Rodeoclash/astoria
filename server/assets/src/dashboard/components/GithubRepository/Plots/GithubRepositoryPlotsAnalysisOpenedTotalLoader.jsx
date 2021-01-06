import React from "react";
import { QueryRenderer, graphql } from "react-relay";
import environment from "dashboard/services/relay/environment.js";

import PlotHero from "dashboard/components/PlotHero/PlotHero.jsx";

const GithubRepositoryPlotsAnalysisOpenedTotalLoader = function ({
  githubRepositoryId,
}) {
  const renderQuery = ({ error, props }) => {
    if (error) {
      return <div>{error.message}</div>;
    } else if (props) {
      return (
        <PlotHero
          plotHero={props.currentUser.githubRepository.analysisOpenedTotal}
        />
      );
    }
    return <div>Loading</div>;
  };

  return (
    <QueryRenderer
      environment={environment}
      query={graphql`
        query GithubRepositoryPlotsAnalysisOpenedTotalLoaderQuery(
          $githubRepositoryId: ID!
          $start: DateTime!
          $finish: DateTime!
        ) {
          currentUser {
            githubRepository(id: $githubRepositoryId) {
              analysisOpenedTotal(start: $start, finish: $finish) {
                ...PlotHero_plotHero
              }
            }
          }
        }
      `}
      variables={{
        githubRepositoryId,
        start: new Date(2020, 0, 1).toISOString(),
        finish: new Date().toISOString(),
      }}
      render={renderQuery}
    />
  );
};

export default GithubRepositoryPlotsAnalysisOpenedTotalLoader;
