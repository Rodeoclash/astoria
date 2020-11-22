/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
type PlotDateIntegerShow_plotDateInteger$ref = any;
import type { FragmentReference } from "relay-runtime";
declare export opaque type GithubRepositoryPlotsTotalPrsMerged_githubRepository$ref: FragmentReference;
declare export opaque type GithubRepositoryPlotsTotalPrsMerged_githubRepository$fragmentType: GithubRepositoryPlotsTotalPrsMerged_githubRepository$ref;
export type GithubRepositoryPlotsTotalPrsMerged_githubRepository = {|
  +totalPrsMerged: {|
    +$fragmentRefs: PlotDateIntegerShow_plotDateInteger$ref
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


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [
    {
      "kind": "RootArgument",
      "name": "finish"
    },
    {
      "kind": "RootArgument",
      "name": "period"
    },
    {
      "kind": "RootArgument",
      "name": "start"
    }
  ],
  "kind": "Fragment",
  "metadata": null,
  "name": "GithubRepositoryPlotsTotalPrsMerged_githubRepository",
  "selections": [
    {
      "alias": null,
      "args": [
        {
          "kind": "Variable",
          "name": "finish",
          "variableName": "finish"
        },
        {
          "kind": "Variable",
          "name": "period",
          "variableName": "period"
        },
        {
          "kind": "Variable",
          "name": "start",
          "variableName": "start"
        }
      ],
      "concreteType": "PlotDateInteger",
      "kind": "LinkedField",
      "name": "totalPrsMerged",
      "plural": false,
      "selections": [
        {
          "args": null,
          "kind": "FragmentSpread",
          "name": "PlotDateIntegerShow_plotDateInteger"
        }
      ],
      "storageKey": null
    }
  ],
  "type": "GithubRepository",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = 'de9419cc95d683c58119e1c69f21c504';

module.exports = node;
