import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { css } from "@emotion/core";

const rootStyles = css``;

export const GithubRepositoryName = function ({ githubRepository }) {
  return <h2 css={rootStyles}>{githubRepository.name}</h2>;
};

export default createFragmentContainer(GithubRepositoryName, {
  githubRepository: graphql`
    fragment GithubRepositoryName_githubRepository on GithubRepository {
      name
    }
  `,
});
