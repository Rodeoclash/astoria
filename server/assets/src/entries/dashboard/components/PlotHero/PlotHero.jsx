import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";
import ReactMarkdown from "react-markdown";

export const PlotHero = function ({ plotHero }) {
  if (plotHero === null) {
    return <p>No data</p>;
  }

  const rootStyles = css`
    & > h3 {
      margin-top: 0;
      height: 2rem;
    }
  `;

  const mainStyles = css`
    font-size: 3.5rem;
    margin: 1rem 0;
  `;

  const headerStyles = css`
    align-items: flex-end;
    display: flex;
    height: 4rem;
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

  const descriptionStyles = css`
    font-size: 0.9rem;

    & li {
      margin-bottom: 0.5rem;
      opacity: 0.75;
    }

    & p {
      opacity: 0.75;
    }
  `;

  const bylineStyles = css`
    font-size: 1.3rem;
  `;

  return (
    <div css={rootStyles}>
      <h2 css={headerStyles}>{plotHero.name}</h2>
      <div css={[mainStyles, sentimentStyles]}>
        {plotHero.value} {plotHero.unitType} {icon}
      </div>
      <div css={bylineStyles}>
        <ReactMarkdown>{plotHero.byline}</ReactMarkdown>
      </div>
      <div css={descriptionStyles}>
        <ReactMarkdown>{plotHero.description}</ReactMarkdown>
      </div>
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
      unitType
      value
    }
  `,
});
