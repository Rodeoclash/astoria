import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";

import RepositoryPlotsMergedPrsPerPerson from "dashboard/components/Repository/Plots/RepositoryPlotsMergedPrsPerPerson.jsx";
import RepositoryPlotsTotalPrsMerged from "dashboard/components/Repository/Plots/RepositoryPlotsTotalPrsMerged.jsx";

const rootStyles = css``;

const chartStyles = css`
  display: grid;
  grid-template-columns: 50% 50%;
  grid-template-rows: repeat(1, 50vh);
`;

export const RepositoryShow = function ({ repository }) {
  return (
    <div css={rootStyles}>
      <div css={chartStyles}>
        <RepositoryPlotsMergedPrsPerPerson repository={repository} />
        <RepositoryPlotsTotalPrsMerged repository={repository} />
      </div>
    </div>
  );
};

export default createFragmentContainer(RepositoryShow, {
  repository: graphql`
    fragment RepositoryShow_repository on Repository {
      ...RepositoryPlotsMergedPrsPerPerson_repository
      ...RepositoryPlotsTotalPrsMerged_repository
      name
    }
  `,
});
