import React from "react";
import { css } from "@emotion/core";

const rootStyles = css`
  font-family: "Lato", sans-serif;
  font-size: 1.8rem;
`;

const Logo = function () {
  return <div css={rootStyles}>{window.SPA_CONFIG.publicName}</div>;
};

export default Logo;
