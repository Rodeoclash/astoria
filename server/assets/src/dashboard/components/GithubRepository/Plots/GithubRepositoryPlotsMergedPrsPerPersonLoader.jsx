import React from "react";
import { QueryRenderer, graphql } from "react-relay";
import environment from "dashboard/services/relay/environment.js";

import GithubRepositoryPlotsMergedPrsPerPerson from "dashboard/components/GithubRepository/Plots/GithubRepositoryPlotsMergedPrsPerPerson.jsx";

const GithubRepositoryPlotsMergedPrsPerPersonLoader = function ({
  githubRepositoryId,
  period,
}) {
  const renderQuery = ({ error, props }) => {
    if (error) {
      return <div>{error.message}</div>;
    } else if (props) {
      return (
        <GithubRepositoryPlotsMergedPrsPerPerson
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
        query GithubRepositoryPlotsMergedPrsPerPersonLoaderQuery(
          $githubRepositoryId: ID!
          $period: Period!
        ) {
          currentUser {
            githubRepository(id: $githubRepositoryId) {
              ...GithubRepositoryPlotsMergedPrsPerPerson_githubRepository
            }
          }
        }
      `}
      variables={{
        githubRepositoryId,
        period,
      }}
      render={renderQuery}
    />
  );
};

export default GithubRepositoryPlotsMergedPrsPerPersonLoader;
