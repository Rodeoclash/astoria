import { subYears } from "date-fns";

export const defaultDateRange = () => {
  return [subYears(new Date(), 1), new Date()];
};
