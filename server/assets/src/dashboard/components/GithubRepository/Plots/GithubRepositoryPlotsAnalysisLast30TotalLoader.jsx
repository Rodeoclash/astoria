import React from "react";
import { QueryRenderer, graphql } from "react-relay";
import environment from "dashboard/services/relay/environment.js";

import GithubRepositoryPlotsAnalysisLast30Total from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAnalysisLast30Total.jsx";

const GithubRepositoryPlotsAnalysisLast30TotalLoader = function ({
  githubRepositoryId,
  period,
}) {
  const renderQuery = ({ error, props }) => {
    if (error) {
      return <div>{error.message}</div>;
    } else if (props) {
      return (
        <GithubRepositoryPlotsAnalysisLast30Total
          githubRepository={props.currentUser.githubRepository}
        />
      );
    }
    return <div>Loading</div>;
  };

  return (
    <QueryRenderer
      environment={environment}
      query={graphql`
        query GithubRepositoryPlotsAnalysisLast30TotalLoaderQuery(
          $githubRepositoryId: ID!
          $period: Period!
          $start: DateTime!
          $finish: DateTime!
        ) {
          currentUser {
            githubRepository(id: $githubRepositoryId) {
              ...GithubRepositoryPlotsAnalysisLast30Total_githubRepository
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

export default GithubRepositoryPlotsAnalysisLast30TotalLoader;
