/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type GithubRepositoryPlotsTotalPrsMerged_githubRepository$ref: FragmentReference;
declare export opaque type GithubRepositoryPlotsTotalPrsMerged_githubRepository$fragmentType: GithubRepositoryPlotsTotalPrsMerged_githubRepository$ref;
export type GithubRepositoryPlotsTotalPrsMerged_githubRepository = {|
  +name: string,
  +totalPrsMerged: {|
    +traces: $ReadOnlyArray<?{|
      +name: string,
      +x: $ReadOnlyArray<?any>,
      +y: $ReadOnlyArray<?number>,
    |}>
  |},
  +$refType: GithubRepositoryPlotsTotalPrsMerged_githubRepository$ref,
|};
export type GithubRepositoryPlotsTotalPrsMerged_githubRepository$data = GithubRepositoryPlotsTotalPrsMerged_githubRepository;
export type GithubRepositoryPlotsTotalPrsMerged_githubRepository$key = {
  +$data?: GithubRepositoryPlotsTotalPrsMerged_githubRepository$data,
  +$fragmentRefs: GithubRepositoryPlotsTotalPrsMerged_githubRepository$ref,
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
  "name": "GithubRepositoryPlotsTotalPrsMerged_githubRepository",
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
  "type": "GithubRepository",
  "abstractKey": null
};
})();
// prettier-ignore
(node/*: any*/).hash = 'aa185f943a02cdd0c974f21a185b569d';

module.exports = node;
