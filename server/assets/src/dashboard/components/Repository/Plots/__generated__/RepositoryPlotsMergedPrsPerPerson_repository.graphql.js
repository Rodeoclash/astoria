/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type RepositoryPlotsMergedPrsPerPerson_repository$ref: FragmentReference;
declare export opaque type RepositoryPlotsMergedPrsPerPerson_repository$fragmentType: RepositoryPlotsMergedPrsPerPerson_repository$ref;
export type RepositoryPlotsMergedPrsPerPerson_repository = {|
  +name: string,
  +mergedPrsPerPerson: {|
    +traces: $ReadOnlyArray<?{|
      +name: string,
      +x: $ReadOnlyArray<?any>,
      +y: $ReadOnlyArray<?number>,
    |}>
  |},
  +$refType: RepositoryPlotsMergedPrsPerPerson_repository$ref,
|};
export type RepositoryPlotsMergedPrsPerPerson_repository$data = RepositoryPlotsMergedPrsPerPerson_repository;
export type RepositoryPlotsMergedPrsPerPerson_repository$key = {
  +$data?: RepositoryPlotsMergedPrsPerPerson_repository$data,
  +$fragmentRefs: RepositoryPlotsMergedPrsPerPerson_repository$ref,
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
  "name": "RepositoryPlotsMergedPrsPerPerson_repository",
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
      "name": "mergedPrsPerPerson",
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
(node/*: any*/).hash = '91242f7bb124c2581f5808f03354b222';

module.exports = node;
