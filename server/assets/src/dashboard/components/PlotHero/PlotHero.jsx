import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";

export const PlotHero = function ({ plotHero }) {
  if (plotHero.currentTotal === null) {
    return <p>No data</p>;
  }
  const rootStyles = css``;

  const mainStyles = css`
    font-size: 3rem;
    display: block;
  `;

  const changeStyles =
    plotHero.changeDirection === "negative"
      ? css`
          color: red;
        `
      : css`
          color: green;
        `;

  const icon = plotHero.changeDirection === "negative" ? "↓" : "↑";

  return (
    <div css={rootStyles}>
      <h3>{plotHero.name}</h3>
      <span css={[mainStyles, changeStyles]}>
        {plotHero.currentTotal} {icon}
      </span>
      {plotHero.previousTotal} last month (
      {Math.round(plotHero.change * 100, 0)}% change)
      <p>{plotHero.description}</p>
    </div>
  );
};

export default createFragmentContainer(PlotHero, {
  plotHero: graphql`
    fragment PlotHero_plotHero on PlotHero {
      change
      changeDirection
      currentTotal
      description
      name
      previousTotal
    }
  `,
});
