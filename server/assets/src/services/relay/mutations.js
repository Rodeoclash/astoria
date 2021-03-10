import { commitMutation } from "react-relay";
import { curry } from "lodash/fp";

export const baseCommitMutation = curry((mutation, environment, variables) => {
  return new Promise((resolve, reject) => {
    commitMutation(environment, {
      mutation,
      variables,
      onCompleted: (response, errors) => {
        resolve([response, errors]);
      },
      onError: (error) => {
        reject(error);
      },
    });
  });
});
