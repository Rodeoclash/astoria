import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import Plot from "react-plotly.js";

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

  const config = {};

  const layout = {
    autosize: true,
    yaxis: {
      rangemode: "tozero",
      autorange: true,
    },
  };

  const style = { width: "100%", height: "80%" };

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
