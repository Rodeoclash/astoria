/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type RepositoryMergedPRs_repository$ref: FragmentReference;
declare export opaque type RepositoryMergedPRs_repository$fragmentType: RepositoryMergedPRs_repository$ref;
export type RepositoryMergedPRs_repository = {|
  +name: string,
  +mergedPrs: {|
    +traces: $ReadOnlyArray<?{|
      +name: string,
      +x: $ReadOnlyArray<?any>,
      +y: $ReadOnlyArray<?number>,
    |}>
  |},
  +$refType: RepositoryMergedPRs_repository$ref,
|};
export type RepositoryMergedPRs_repository$data = RepositoryMergedPRs_repository;
export type RepositoryMergedPRs_repository$key = {
  +$data?: RepositoryMergedPRs_repository$data,
  +$fragmentRefs: RepositoryMergedPRs_repository$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = (function(){
var v0 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "name",
  "storageKey": null
};
return {
  "argumentDefinitions": [
    {
      "kind": "RootArgument",
      "name": "period"
    }
  ],
  "kind": "Fragment",
  "metadata": null,
  "name": "RepositoryMergedPRs_repository",
  "selections": [
    (v0/*: any*/),
    {
      "alias": null,
      "args": [
        {
          "kind": "Variable",
          "name": "period",
          "variableName": "period"
        }
      ],
      "concreteType": "PlotDataMergedPr",
      "kind": "LinkedField",
      "name": "mergedPrs",
      "plural": false,
      "selections": [
        {
          "alias": null,
          "args": null,
          "concreteType": "PlotDataMergedPrTrace",
          "kind": "LinkedField",
          "name": "traces",
          "plural": true,
          "selections": [
            (v0/*: any*/),
            {
              "alias": null,
              "args": null,
              "kind": "ScalarField",
              "name": "x",
              "storageKey": null
            },
            {
              "alias": null,
              "args": null,
              "kind": "ScalarField",
              "name": "y",
              "storageKey": null
            }
          ],
          "storageKey": null
        }
      ],
      "storageKey": null
    }
  ],
  "type": "Repository",
  "abstractKey": null
};
})();
// prettier-ignore
(node/*: any*/).hash = 'b82fb6115d1442019079c4283c8d913f';

module.exports = node;
