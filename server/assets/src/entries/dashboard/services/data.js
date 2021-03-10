import { addYears, subYears } from "date-fns";

// we use a future date here so new PRs will be accepted
export const defaultDateRange = () => {
  return [subYears(new Date(), 1), addYears(new Date(), 1)];
};
