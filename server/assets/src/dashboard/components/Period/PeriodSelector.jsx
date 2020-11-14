import React from "react";
import { createFragmentContainer, graphql } from "react-relay";
import { useRouter } from "found";
import { PERIODS, defaultPeriod } from "dashboard/services/periods.js";

export const PeriodSelector = function ({ onChangePeriod }) {
  const { match } = useRouter();
  const selectedPeriod = match.location.query.period;

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
    <select
      onChange={handleChange}
      value={selectedPeriod === undefined ? defaultPeriod : selectedPeriod}
    >
      {renderedOptions}
    </select>
  );
};

export default PeriodSelector;
