/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type PeriodSelector_currentUser$ref: FragmentReference;
declare export opaque type PeriodSelector_currentUser$fragmentType: PeriodSelector_currentUser$ref;
export type PeriodSelector_currentUser = {|
  +name: string,
  +$refType: PeriodSelector_currentUser$ref,
|};
export type PeriodSelector_currentUser$data = PeriodSelector_currentUser;
export type PeriodSelector_currentUser$key = {
  +$data?: PeriodSelector_currentUser$data,
  +$fragmentRefs: PeriodSelector_currentUser$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "PeriodSelector_currentUser",
  "selections": [
    {
      "alias": null,
      "args": null,
      "kind": "ScalarField",
      "name": "name",
      "storageKey": null
    }
  ],
  "type": "CurrentUser",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = 'b4fb9f50f0fc72d0cbf5ce4e7c0a0525';

module.exports = node;
