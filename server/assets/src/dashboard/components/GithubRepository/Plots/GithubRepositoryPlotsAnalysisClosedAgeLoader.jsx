import React from "react";
import { QueryRenderer, graphql } from "react-relay";
import environment from "dashboard/services/relay/environment.js";

import PlotHero from "dashboard/components/PlotHero/PlotHero.jsx";

const GithubRepositoryPlotsAnalysisClosedAgeLoader = function ({
  githubRepositoryId,
}) {
  const renderQuery = ({ error, props }) => {
    if (error) {
      return <div>{error.message}</div>;
    } else if (props) {
      return (
        <PlotHero
          plotHero={props.currentUser.githubRepository.analysisClosedAge}
        />
      );
    }
    return <div>Loading</div>;
  };

  return (
    <QueryRenderer
      environment={environment}
      query={graphql`
        query GithubRepositoryPlotsAnalysisClosedAgeLoaderQuery(
          $githubRepositoryId: ID!
          $start: DateTime!
          $finish: DateTime!
        ) {
          currentUser {
            githubRepository(id: $githubRepositoryId) {
              analysisClosedAge(start: $start, finish: $finish) {
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

export default GithubRepositoryPlotsAnalysisClosedAgeLoader;
