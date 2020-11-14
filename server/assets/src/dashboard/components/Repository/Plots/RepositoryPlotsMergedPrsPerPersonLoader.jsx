import React from "react";
import { QueryRenderer, graphql } from "react-relay";
import environment from "dashboard/services/relay/environment.js";

import RepositoryPlotsMergedPrsPerPerson from "dashboard/components/Repository/Plots/RepositoryPlotsMergedPrsPerPerson.jsx";

const RepositoryPlotsMergedPrsPerPersonLoader = function ({
  repositoryId,
  period,
}) {
  const renderQuery = ({ error, props }) => {
    if (error) {
      return <div>{error.message}</div>;
    } else if (props) {
      return (
        <RepositoryPlotsMergedPrsPerPerson
          repository={props.currentUser.repository}
        />
      );
    }
    return <div>Loading</div>;
  };

  return (
    <QueryRenderer
      environment={environment}
      query={graphql`
        query RepositoryPlotsMergedPrsPerPersonLoaderQuery(
          $repositoryId: ID!
          $period: Period!
        ) {
          currentUser {
            repository(id: $repositoryId) {
              ...RepositoryPlotsMergedPrsPerPerson_repository
            }
          }
        }
      `}
      variables={{
        repositoryId,
        period,
      }}
      render={renderQuery}
    />
  );
};

export default RepositoryPlotsMergedPrsPerPersonLoader;
