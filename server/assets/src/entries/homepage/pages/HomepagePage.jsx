import React from "react";
import { Link, useRouter } from "found";
import { dashboardRootShow } from "services/phoenix-jsroutes.js";

const HomepagePage = function ({ currentUser, flashes }) {
  const renderedAction = (() => {
    if (currentUser === null) {
      return <Link to="/authentication">Sign in / Sign up</Link>;
    } else {
      return (
        <>
          Welcome {currentUser.name}, go to your{" "}
          <a href={dashboardRootShow()}>dashboard</a>
        </>
      );
    }
  })();

  return <>{renderedAction}</>;
};

export const HomepagePageQuery = graphql`
  query HomepagePage_Query {
    currentUser {
      name
    }
  }
`;

export default HomepagePage;
