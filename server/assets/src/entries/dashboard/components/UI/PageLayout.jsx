import React, { useState } from "react";
import { theme } from "services/css.js";
import { css } from "@emotion/core";
import Logo from "dashboard/components/UI/Logo.jsx";
import {
  ImCircleRight as IconExpand,
  ImCircleLeft as IconCollapse,
} from "react-icons/im";

const rootStyles = css`
  grid-template-rows: 5rem calc(100vh - 5rem);
  grid-template-columns: 20rem;
  display: grid;
  grid-template-areas:
    "logo title"
    "sidebar content";

  position: relative;

  @media screen and (max-width: 960px) {
    transform: translate(-75vw, 0);
    grid-template-columns: 75vw 100vw;
    transition: transform 0.5s;
  }
`;

const rootOpenStyles = css`
  @media screen and (max-width: 960px) {
    transform: translate(0, 0);
  }
`;

const logoStyles = css`
  align-items: center;
  display: flex;
  grid-area: logo;
  justify-content: center;
  border-right: 1px solid rgba(255, 255, 255, 0.25);
  border-bottom: 1px solid rgba(255, 255, 255, 0.25);
`;

const titleStyles = css`
  align-items: center;
  border-bottom: 1px solid rgba(255, 255, 255, 0.25);
  display: flex;
  grid-area: title;
  justify-content: center;
  position: relative;
`;

const toggleExpandStyles = css`
  display: none;

  @media screen and (max-width: 960px) {
    display: block;
    position: absolute;
    left: 1rem;
    font-size: 1.5rem;
    margin-top: 5px;
  }
`;

const titleContentStyles = css`
  font-size: 1.4rem;
`;

const sidebarStyles = css`
  grid-area: sidebar;
  border-right: 1px solid rgba(255, 255, 255, 0.25);
  overflow-y: auto;
  overflow-x: hidden;
`;

const contentStyles = css`
  grid-area: content;
  overflow-x: hidden;
`;

const PageLayout = function ({ title, aside, children }) {
  const [expanded, setExpanded] = useState(false);

  const handleToggleExpand = () => {
    setExpanded(!expanded);
  };

  const calculatedRootstyles =
    expanded === true ? [rootStyles, rootOpenStyles] : [rootStyles];

  const expander = (function () {
    if (expanded === true) {
      return (
        <a css={toggleExpandStyles} onClick={handleToggleExpand}>
          <IconCollapse />
        </a>
      );
    } else {
      return (
        <a css={toggleExpandStyles} onClick={handleToggleExpand}>
          <IconExpand />
        </a>
      );
    }
  })();

  return (
    <div css={calculatedRootstyles}>
      <div css={logoStyles}>
        <Logo />
      </div>
      <header css={titleStyles}>
        {expander}
        <div css={titleContentStyles}>{title}</div>
      </header>
      <aside css={sidebarStyles}>{aside}</aside>
      <main css={contentStyles}>{children}</main>
    </div>
  );
};

export default PageLayout;
