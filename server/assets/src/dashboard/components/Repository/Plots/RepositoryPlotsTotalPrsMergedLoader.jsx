import React from "react";
import { QueryRenderer, graphql } from "react-relay";
import environment from "dashboard/services/relay/environment.js";

import RepositoryPlotsTotalPrsMerged from "dashboard/components/Repository/Plots/RepositoryPlotsTotalPrsMerged.jsx";

const RepositoryPlotsTotalPrsMergedLoader = function ({
  repositoryId,
  period,
}) {
  const renderQuery = ({ error, props }) => {
    if (error) {
      return <div>{error.message}</div>;
    } else if (props) {
      return (
        <RepositoryPlotsTotalPrsMerged
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
        query RepositoryPlotsTotalPrsMergedLoaderQuery(
          $repositoryId: ID!
          $period: Period!
        ) {
          currentUser {
            repository(id: $repositoryId) {
              ...RepositoryPlotsTotalPrsMerged_repository
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

export default RepositoryPlotsTotalPrsMergedLoader;
