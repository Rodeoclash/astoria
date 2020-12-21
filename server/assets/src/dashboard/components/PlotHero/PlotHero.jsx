import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";

export const PlotHero = function ({ plotHero }) {
  if (plotHero.value === null) {
    return <p>No data</p>;
  }

  const rootStyles = css``;

  const mainStyles = css`
    font-size: 3rem;
    display: block;
  `;

  const [changeStyles, icon] = (() => {
    switch (plotHero.changeDirection) {
      case null:
        return [
          css`
            color: grey;
          `,
          "",
        ];
      case "POSITIVE":
        return [
          css`
            color: green;
          `,
          "↑",
        ];
      case "NEGATIVE":
        return [
          css`
            color: red;
          `,
          "↓",
        ];
      default:
        throw new Error("Unknown change direction");
    }
  })();

  return (
    <div css={rootStyles}>
      <h3>{plotHero.name}</h3>
      <span css={[mainStyles, changeStyles]}>
        {plotHero.value} {icon}
      </span>
      {plotHero.byline ? <p>{plotHero.byline}</p> : null}
      <p>{plotHero.description}</p>
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
      value
    }
  `,
});
