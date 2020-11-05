import React from "react";
import { createFragmentContainer, graphql } from "react-relay";

export const CurrentUserWelcome = function ({ currentUser }) {
  return (
    <p>
      Welcome, {currentUser.name !== null ? currentUser.name : "Unknown person"}
    </p>
  );
};

export default createFragmentContainer(CurrentUserWelcome, {
  currentUser: graphql`
    fragment CurrentUserWelcome_currentUser on CurrentUser {
      name
    }
  `,
});
