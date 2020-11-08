import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";

import RepositoryMergedPRs from "dashboard/components/Repository/RepositoryMergedPRs.jsx";

const rootStyles = css``;

export const RepositoryShow = function ({ repository }) {
  return (
    <div css={rootStyles}>
      <p>Showing {repository.name}</p>
      <RepositoryMergedPRs repository={repository} />
    </div>
  );
};

export default createFragmentContainer(RepositoryShow, {
  repository: graphql`
    fragment RepositoryShow_repository on Repository {
      ...RepositoryMergedPRs_repository
      name
    }
  `,
});
