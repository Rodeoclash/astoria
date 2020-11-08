import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";

import Plot from "react-plotly.js";

const rootStyles = css``;

export const RepositoryMergedPRs = function ({ repository }) {
  console.log(repository);

  const data = repository.mergedPrs.traces.map((trace) => {
    return {
      ...trace,
      x: trace.x.map((x) => {
        return new Date(x);
      }),
    };
  });

  return (
    <div css={rootStyles}>
      <Plot
        config={{ staticPlot: true }}
        data={data}
        layout={{ title: "Merged PRs", autosize: true }}
        style={{ width: "100%", height: "100%" }}
        useResizeHandler={true}
      />
      <p>Shows the number of merged pull requests in the specified period</p>
    </div>
  );
};

export default createFragmentContainer(RepositoryMergedPRs, {
  repository: graphql`
    fragment RepositoryMergedPRs_repository on Repository {
      name
      mergedPrs(period: $period) {
        traces {
          name
          x
          y
        }
      }
    }
  `,
});
