import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";

export const PlotChangeShow = function ({ plotChange }) {
  const latest = plotChange.traces[plotChange.traces.length - 1];

  if (latest === undefined) {
    return (
      <p>
        <em>No data</em>
      </p>
    );
  }

  const rootStyles = css`
    color: ${latest.change < 0 ? "red" : "green"};
  `;

  const mainStyles = css`
    font-size: 3rem;
    display: block;
  `;

  const icon = latest.change < 0 ? "↓" : "↑";

  return (
    <p css={rootStyles}>
      <span css={mainStyles}>
        {latest.total} {icon}
      </span>
      Change was: {Math.round(latest.change * 100, 0)}%
    </p>
  );
};

export default createFragmentContainer(PlotChangeShow, {
  plotChange: graphql`
    fragment PlotChangeShow_plotChange on PlotChange {
      traces {
        change
        datetime
        total
      }
    }
  `,
});
