import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";

import Plot from "react-plotly.js";

const rootStyles = css``;

export const RepositoryPlotsMergedPrsPerPerson = function ({ repository }) {
  const data = repository.mergedPrsPerPerson.traces.map((trace) => {
    return {
      ...trace,
      mode: "lines",
      line: { shape: "spline" },
      x: trace.x.map((x) => {
        return new Date(x);
      }),
    };
  });

  console.log(data);

  const config = {};

  const layout = {
    autosize: true,
    title: "Merged pull requests per person",
    yaxis: {
      rangemode: "tozero",
      autorange: true,
    },
  };

  const style = { width: "100%", height: "100%" };

  return (
    <div css={rootStyles}>
      <Plot
        config={config}
        data={data}
        layout={layout}
        style={style}
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
