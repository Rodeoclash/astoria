import React from "react";
import { QueryRenderer, graphql } from "react-relay";
import environment from "dashboard/services/relay/environment.js";

import PlotChart from "dashboard/components/PlotChart/PlotChart.jsx";

const GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoader = function ({
  githubRepositoryId,
}) {
  const renderQuery = ({ error, props }) => {
    if (error) {
      return <div>{error.message}</div>;
    } else if (props) {
      return (
        <PlotChart
          plotChart={
            props.currentUser.githubRepository.analysisMonthlyTotalChange
          }
        />
      );
    }
    return <div>Loading</div>;
  };

  return (
    <QueryRenderer
      environment={environment}
      query={graphql`
        query GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQuery(
          $githubRepositoryId: ID!
          $start: DateTime!
          $finish: DateTime!
        ) {
          currentUser {
            githubRepository(id: $githubRepositoryId) {
              analysisMonthlyTotalChange(start: $start, finish: $finish) {
                ...PlotChart_plotChart
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

export default GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoader;
