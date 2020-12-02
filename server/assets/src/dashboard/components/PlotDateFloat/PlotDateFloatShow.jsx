import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import Plot from "react-plotly.js";
import { config, layout, style } from "dashboard/services/charts.js";

export const PlotDateFloatShow = function ({ plotDateFloat }) {
  const data = plotDateFloat.traces.map((trace) => {
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

export default createFragmentContainer(PlotDateFloatShow, {
  plotDateFloat: graphql`
    fragment PlotDateFloatShow_plotDateFloat on PlotDateFloat {
      traces {
        name
        x
        y
      }
    }
  `,
});
