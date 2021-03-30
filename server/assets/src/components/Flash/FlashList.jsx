import React from "react";
import { createFragmentContainer, graphql } from "react-relay";

import FlashShow from "components/Flash/FlashShow.jsx";

export const FlashList = function ({ flashes }) {
  return flashes.map((flash) => {
    return <FlashShow key={flash.id} flash={flash} />;
  });
};

export default createFragmentContainer(FlashList, {
  flashes: graphql`
    fragment FlashList_flashes on Flash @relay(plural: true) {
      ...FlashShow_flash
      id
    }
  `,
});
