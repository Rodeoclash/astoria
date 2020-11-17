/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type GithubRepositoryPlotsMergedPrsPerPerson_githubRepository$ref: FragmentReference;
declare export opaque type GithubRepositoryPlotsMergedPrsPerPerson_githubRepository$fragmentType: GithubRepositoryPlotsMergedPrsPerPerson_githubRepository$ref;
export type GithubRepositoryPlotsMergedPrsPerPerson_githubRepository = {|
  +name: string,
  +mergedPrsPerPerson: {|
    +traces: $ReadOnlyArray<?{|
      +name: string,
      +x: $ReadOnlyArray<?any>,
      +y: $ReadOnlyArray<?number>,
    |}>
  |},
  +$refType: GithubRepositoryPlotsMergedPrsPerPerson_githubRepository$ref,
|};
export type GithubRepositoryPlotsMergedPrsPerPerson_githubRepository$data = GithubRepositoryPlotsMergedPrsPerPerson_githubRepository;
export type GithubRepositoryPlotsMergedPrsPerPerson_githubRepository$key = {
  +$data?: GithubRepositoryPlotsMergedPrsPerPerson_githubRepository$data,
  +$fragmentRefs: GithubRepositoryPlotsMergedPrsPerPerson_githubRepository$ref,
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
  "name": "GithubRepositoryPlotsMergedPrsPerPerson_githubRepository",
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
  "type": "GithubRepository",
  "abstractKey": null
};
})();
// prettier-ignore
(node/*: any*/).hash = '9b583b82e4e37d73941693f65f1e2b72';

module.exports = node;
