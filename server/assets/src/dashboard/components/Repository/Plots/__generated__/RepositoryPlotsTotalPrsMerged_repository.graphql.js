/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type RepositoryPlotsTotalPrsMerged_repository$ref: FragmentReference;
declare export opaque type RepositoryPlotsTotalPrsMerged_repository$fragmentType: RepositoryPlotsTotalPrsMerged_repository$ref;
export type RepositoryPlotsTotalPrsMerged_repository = {|
  +name: string,
  +totalPrsMerged: {|
    +traces: $ReadOnlyArray<?{|
      +name: string,
      +x: $ReadOnlyArray<?any>,
      +y: $ReadOnlyArray<?number>,
    |}>
  |},
  +$refType: RepositoryPlotsTotalPrsMerged_repository$ref,
|};
export type RepositoryPlotsTotalPrsMerged_repository$data = RepositoryPlotsTotalPrsMerged_repository;
export type RepositoryPlotsTotalPrsMerged_repository$key = {
  +$data?: RepositoryPlotsTotalPrsMerged_repository$data,
  +$fragmentRefs: RepositoryPlotsTotalPrsMerged_repository$ref,
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
  "name": "RepositoryPlotsTotalPrsMerged_repository",
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
      "name": "totalPrsMerged",
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
(node/*: any*/).hash = '7d9549efff80d83b206f5eb3de89f344';

module.exports = node;
