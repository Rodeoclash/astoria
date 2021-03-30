import React from "react";
import { css } from "@emotion/core";
import { ImMeter as Icon } from "react-icons/im";

const rootStyles = css`
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
`;

const badgeStyles = css`
  text-align: center;
`;

const iconStyles = css`
  font-size: 5rem;
`;

const NoRepositorySelected = function () {
  return (
    <div css={rootStyles}>
      <div css={badgeStyles}>
        <div css={iconStyles}>
          <Icon />
        </div>
        <h1>No repository selected</h1>
        <p>Please select a repository from the lefthand side to get started.</p>
      </div>
    </div>
  );
};

export default NoRepositorySelected;
