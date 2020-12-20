import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import Plot from "react-plotly.js";
import { config, layout, style } from "dashboard/services/charts.js";

export const PlotDateIntegerShow = function ({ plotDateInteger }) {
  const data = plotDateInteger.traces.map((trace) => {
    return {
      ...trace,
      mode: "lines",
      connectgaps: true,
      x: trace.x.map((x) => {
        return new Date(x);
      }),
    };
  });

  return (
    <Plot
      config={config}
      data={data}
      layout={layout}
      style={style}
      useResizeHandler={true}
    />
  );
};

export default createFragmentContainer(PlotDateIntegerShow, {
  plotDateInteger: graphql`
    fragment PlotDateIntegerShow_plotDateInteger on PlotDateInteger {
      traces {
        name
        x
        y
      }
    }
  `,
});
