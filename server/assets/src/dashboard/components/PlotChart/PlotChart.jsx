import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import Plot from "react-plotly.js";
import { config, layout, style } from "dashboard/services/charts.js";

export const PlotChart = function ({ plotChart }) {
  if (plotChart.traces === null) {
    return <p>No data</p>;
  }

  const traces = JSON.parse(plotChart.traces);

  const data = traces.map((trace) => {
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
    <div>
      <h3>{plotChart.name}</h3>
      <Plot
        config={config}
        data={data}
        layout={layout}
        style={style}
        useResizeHandler={true}
      />
      <p>{plotChart.description}</p>
    </div>
  );
};

export default createFragmentContainer(PlotChart, {
  plotChart: graphql`
    fragment PlotChart_plotChart on PlotChart {
      description
      name
      traces
    }
  `,
});
