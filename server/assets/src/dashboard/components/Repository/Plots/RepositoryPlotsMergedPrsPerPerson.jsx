import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";

import Plot from "react-plotly.js";

const rootStyles = css``;

export const RepositoryPlotsMergedPrsPerPerson = function ({ repository }) {
  const data = repository.mergedPrsPerPerson.traces.map((trace) => {
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
        layout={{ title: "Merged pull requests per person", autosize: true }}
        style={{ width: "100%", height: "100%" }}
        useResizeHandler={true}
      />
      <p>Shows the number of merged pull requests in the specified period</p>
    </div>
  );
};

export default createFragmentContainer(RepositoryPlotsMergedPrsPerPerson, {
  repository: graphql`
    fragment RepositoryPlotsMergedPrsPerPerson_repository on Repository {
      name
      mergedPrsPerPerson(period: $period) {
        traces {
          name
          x
          y
        }
      }
    }
  `,
});
