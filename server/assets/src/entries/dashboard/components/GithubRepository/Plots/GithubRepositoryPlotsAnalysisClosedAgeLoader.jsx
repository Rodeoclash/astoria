import React, { useEffect } from "react";
import { QueryRenderer, graphql, requestSubscription } from "react-relay";
import environment from "services/relay/environment.js";
import { defaultDateRange } from "dashboard/services/data.js";

import PlotHero from "dashboard/components/PlotHero/PlotHero.jsx";

const subscription = graphql`
  subscription GithubRepositoryPlotsAnalysisClosedAgeLoaderSubscription(
    $id: ID!
    $start: DateTime!
    $finish: DateTime!
  ) {
    githubRepositoryUpdated(id: $id) {
      analysisClosedAge(start: $start, finish: $finish) {
        ...PlotHero_plotHero
      }
    }
  }
`;

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
        query GithubRepositoryPlotsAnalysisClosedAgeLoaderQuery(
          $id: ID!
          $start: DateTime!
          $finish: DateTime!
        ) {
          currentUser {
            githubRepository(id: $id) {
              analysisClosedAge(start: $start, finish: $finish) {
                ...PlotHero_plotHero
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

export default GithubRepositoryPlotsAnalysisClosedAgeLoader;
