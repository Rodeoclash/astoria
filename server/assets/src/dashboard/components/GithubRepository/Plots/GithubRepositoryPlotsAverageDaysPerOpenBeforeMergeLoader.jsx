import React from "react";
import { QueryRenderer, graphql } from "react-relay";
import environment from "dashboard/services/relay/environment.js";

import GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge.jsx";

const GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoader = function ({
  githubRepositoryId,
  period,
}) {
  const renderQuery = ({ error, props }) => {
    if (error) {
      return <div>{error.message}</div>;
    } else if (props) {
      return (
        <GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge
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
        query GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoaderQuery(
          $githubRepositoryId: ID!
          $period: Period!
          $start: DateTime!
          $finish: DateTime!
        ) {
          currentUser {
            githubRepository(id: $githubRepositoryId) {
              ...GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository
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

export default GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoader;
