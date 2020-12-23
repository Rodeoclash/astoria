import React from "react";
import { QueryRenderer, graphql } from "react-relay";
import environment from "dashboard/services/relay/environment.js";

import PlotHero from "dashboard/components/PlotHero/PlotHero.jsx";

const GithubRepositoryPlotsAnalysisOpenedAgeLoader = function ({
  githubRepositoryId,
  period,
}) {
  const renderQuery = ({ error, props }) => {
    if (error) {
      return <div>{error.message}</div>;
    } else if (props) {
      return (
        <PlotHero
          plotHero={props.currentUser.githubRepository.analysisOpenedAge}
        />
      );
    }
    return <div>Loading</div>;
  };

  return (
    <QueryRenderer
      environment={environment}
      query={graphql`
        query GithubRepositoryPlotsAnalysisOpenedAgeLoaderQuery(
          $githubRepositoryId: ID!
          $period: Period!
          $start: DateTime!
          $finish: DateTime!
        ) {
          currentUser {
            githubRepository(id: $githubRepositoryId) {
              analysisOpenedAge(
                period: $period
                start: $start
                finish: $finish
              ) {
                ...PlotHero_plotHero
              }
            }
          }
        }
      `}
      variables={{
        githubRepositoryId,
        period,
        start: new Date(2020, 0, 1).toISOString(),
        finish: new Date().toISOString(),
      }}
      render={renderQuery}
    />
  );
};

export default GithubRepositoryPlotsAnalysisOpenedAgeLoader;
