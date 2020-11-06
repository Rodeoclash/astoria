/**
 * @flow
 */

/* eslint-disable */

"use strict";

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type CurrentUserWelcome_currentUser$ref: FragmentReference;
declare export opaque type CurrentUserWelcome_currentUser$fragmentType: CurrentUserWelcome_currentUser$ref;
export type CurrentUserWelcome_currentUser = {|
  +name: string,
  +$refType: CurrentUserWelcome_currentUser$ref,
|};
export type CurrentUserWelcome_currentUser$data = CurrentUserWelcome_currentUser;
export type CurrentUserWelcome_currentUser$key = {
  +$data?: CurrentUserWelcome_currentUser$data,
  +$fragmentRefs: CurrentUserWelcome_currentUser$ref,
  ...
};
*/

const node /*: ReaderFragment*/ = {
  argumentDefinitions: [],
  kind: "Fragment",
  metadata: null,
  name: "CurrentUserWelcome_currentUser",
  selections: [
    {
      alias: null,
      args: null,
      kind: "ScalarField",
      name: "name",
      storageKey: null,
    },
  ],
  type: "CurrentUser",
  abstractKey: null,
};
// prettier-ignore
(node/*: any*/).hash = '8dc9a03a472cabdb30ccb7dcabeeae2d';

module.exports = node;
