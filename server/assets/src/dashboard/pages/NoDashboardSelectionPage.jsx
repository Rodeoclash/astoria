import React from "react";
import { css } from "@emotion/core";

const rootStyles = css`
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  display: flex;
  align-items: center;
  justify-content: center;
`;

const NoDashboardSelectionPage = function () {
  return (
    <div css={rootStyles}>
      <p>Please select a repository from one on the left to get started</p>
    </div>
  );
};

export default NoDashboardSelectionPage;
