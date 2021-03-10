import React, { useEffect } from "react";
import { QueryRenderer, graphql, requestSubscription } from "react-relay";
import environment from "services/relay/environment.js";
import { defaultDateRange } from "dashboard/services/data.js";

import PlotChart from "dashboard/components/PlotChart/PlotChart.jsx";

const subscription = graphql`
  subscription GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderSubscription(
    $id: ID!
    $start: DateTime!
    $finish: DateTime!
  ) {
    githubRepositoryUpdated(id: $id) {
      analysisMonthlyTotalChange(start: $start, finish: $finish) {
        ...PlotChart_plotChart
      }
    }
  }
`;

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

  const [start, finish] = defaultDateRange();

  const variables = {
    id: githubRepositoryId,
    start: start.toISOString(),
    finish: finish.toISOString(),
  };

  useEffect(() => {
    const disposable = requestSubscription(environment, {
      subscription,
      variables,
    });

    return function () {
      disposable.dispose();
    };
  });

  return (
    <QueryRenderer
      environment={environment}
      query={graphql`
        query GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQuery(
          $id: ID!
          $start: DateTime!
          $finish: DateTime!
        ) {
          currentUser {
            githubRepository(id: $id) {
              analysisMonthlyTotalChange(start: $start, finish: $finish) {
                ...PlotChart_plotChart
              }
            }
          }
        }
      `}
      variables={variables}
      render={renderQuery}
    />
  );
};

export default GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoader;
