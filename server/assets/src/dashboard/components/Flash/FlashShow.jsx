import React, { useEffect, useState } from "react";
import { createFragmentContainer, graphql } from "react-relay";

export const FlashShow = function ({ flash }) {
  const [visible, setVisible] = useState(true);

  useEffect(() => {
    const interval = setInterval(() => {
      const finishesAt =
        new Date(flash.createdAt).getTime() + flash.secondsVisible * 1000;
      const now = new Date().getTime();

      if (now >= finishesAt) {
        setVisible(false);
        clearInterval(interval);
      }
    }, 1000);
    return () => clearInterval(interval);
  }, []);

  if (visible === false) {
    return null;
  }

  return (
    <>
      <h4>{flash.kind}</h4>
      <p>{flash.body}</p>
    </>
  );
};

export default createFragmentContainer(FlashShow, {
  flash: graphql`
    fragment FlashShow_flash on Flash {
      body
      createdAt
      kind
      secondsVisible
    }
  `,
});
