import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";

import Plot from "react-plotly.js";

const rootStyles = css``;

export const RepositoryPlotsTotalPrsMerged = function ({ repository }) {
  const data = repository.totalPrsMerged.traces.map((trace) => {
    return {
      ...trace,
      connectgaps: false,
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
        layout={{ title: "Total merged pull requests", autosize: true }}
        style={{ width: "100%", height: "100%" }}
        useResizeHandler={true}
      />
      <p>Total number of PRs created for this repo</p>
    </div>
  );
};

export default createFragmentContainer(RepositoryPlotsTotalPrsMerged, {
  repository: graphql`
    fragment RepositoryPlotsTotalPrsMerged_repository on Repository {
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