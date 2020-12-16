import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";

export const PlotChangeShow = function ({ plotChange }) {
  const rootStyles = css`
    color: ${plotChange.trace.change < 0 ? "red" : "green"};
  `;

  const mainStyles = css`
    font-size: 3rem;
    display: block;
  `;

  const icon = plotChange.trace.change < 0 ? "↓" : "↑";

  return (
    <p css={rootStyles}>
      <span css={mainStyles}>
        {plotChange.trace.currentTotal} {icon}
      </span>
      {plotChange.trace.previousTotal} last month (
      {Math.round(plotChange.trace.change * 100, 0)}% change)
    </p>
  );
};

export default createFragmentContainer(PlotChangeShow, {
  plotChange: graphql`
    fragment PlotChangeShow_plotChange on PlotChange {
      trace {
        change
        currentTotal
        previousTotal
      }
    }
  `,
});
