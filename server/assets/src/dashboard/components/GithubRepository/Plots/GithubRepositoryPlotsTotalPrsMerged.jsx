import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";

import Plot from "react-plotly.js";

const rootStyles = css``;

export const GithubRepositoryPlotsTotalPrsMerged = function ({
  githubRepository,
}) {
  const data = githubRepository.totalPrsMerged.traces.map((trace) => {
    return {
      ...trace,
      mode: "lines",
      line: { shape: "spline" },
      x: trace.x.map((x) => {
        return new Date(x);
      }),
    };
  });

  return (
    <div css={rootStyles}>
      <Plot
        config={{}}
        data={data}
        layout={{ title: "Total merged pull requests", autosize: true }}
        style={{ width: "100%", height: "100%" }}
        useResizeHandler={true}
      />
      <p>Total number of PRs created for this repo</p>
    </div>
  );
};

export default createFragmentContainer(GithubRepositoryPlotsTotalPrsMerged, {
  githubRepository: graphql`
    fragment GithubRepositoryPlotsTotalPrsMerged_githubRepository on GithubRepository {
      name
      totalPrsMerged(period: $period) {
        traces {
          name
          x
          y
        }
      }
    }
  `,
});
