import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { useRouter } from "found";
import { PERIODS } from "dashboard/services/periods.js";

export const PeriodSelector = function ({ onChangePeriod }) {
  const { match } = useRouter();

  const handleChange = (event) => {
    onChangePeriod(event.target.value);
  };

  const renderedOptions = PERIODS.map(([period, name]) => {
    return (
      <option key={period} value={period}>
        {name}
      </option>
    );
  });

  return (
    <select onChange={handleChange} value={match.location.query.period}>
      {renderedOptions}
    </select>
  );
};

export default PeriodSelector;
