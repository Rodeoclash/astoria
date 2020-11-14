import React from "react";
import { QueryRenderer, graphql } from "react-relay";
import { css } from "@emotion/core";
import environment from "dashboard/services/relay/environment.js";
import { useRouter } from "found";
import { PERIODS, defaultPeriod } from "dashboard/services/periods.js";

import RepositoryShow from "dashboard/components/Repository/RepositoryShow.jsx";

const rootStyles = css``;

const RepositoryLoad = function ({ repositoryId }) {
  const { match } = useRouter();
  const selectedPeriod = match.location.query.period;

  if (repositoryId === undefined) {
    return <p>Please select a repository</p>;
  }

  const renderQuery = ({ error, props }) => {
    if (error) {
      return <div>{error.message}</div>;
    } else if (props) {
      return <RepositoryShow repository={props.currentUser.repository} />;
    }
    return <div>Loading</div>;
  };

  return (
    <QueryRenderer
      environment={environment}
      query={graphql`
        query RepositoryLoadQuery($repositoryId: ID!, $period: Period!) {
          currentUser {
            repository(id: $repositoryId) {
              ...RepositoryShow_repository
            }
          }
        }
      `}
      variables={{
        repositoryId,
        period: selectedPeriod === undefined ? defaultPeriod : selectedPeriod,
      }}
      render={renderQuery}
    />
  );
};

export default RepositoryLoad;
