import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import Plot from "react-plotly.js";

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

  const config = {};

  const layout = {
    autosize: true,
    yaxis: {
      rangemode: "tozero",
      autorange: true,
    },
  };

  const style = { width: "100%", height: "100%" };

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
