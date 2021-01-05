import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";

export const PlotHero = function ({ plotHero }) {
  if (plotHero === null) {
    return <p>No data</p>;
  }

  const rootStyles = css``;

  const mainStyles = css`
    font-size: 3rem;
    display: block;
  `;

  const icon = (() => {
    switch (plotHero.changeDirection) {
      case null:
        return null;
      case "INCREASE":
        return "↑";
      case "DECREASE":
        return "↓";
      default:
        throw new Error(
          `Unknown change direction: ${plotHero.changeDirection}`
        );
    }
  })();

  const sentimentStyles = (() => {
    switch (plotHero.sentiment) {
      case null:
        return null;
      case "POSITIVE":
        return css`
          color: green;
        `;
      case "NEGATIVE":
        return css`
          color: red;
        `;
      default:
        throw new Error(`Unknown sentiment: ${plotHero.sentiment}`);
    }
  })();

  return (
    <div css={rootStyles}>
      <h3>{plotHero.name}</h3>
      <span css={[mainStyles, sentimentStyles]}>
        {plotHero.value} {icon}
      </span>
      {plotHero.byline ? <p>{plotHero.byline}</p> : null}
      <p>
        <em>{plotHero.description}</em>
      </p>
    </div>
  );
};

export default createFragmentContainer(PlotHero, {
  plotHero: graphql`
    fragment PlotHero_plotHero on PlotHero {
      byline
      changeDirection
      description
      name
      sentiment
      value
    }
  `,
});
