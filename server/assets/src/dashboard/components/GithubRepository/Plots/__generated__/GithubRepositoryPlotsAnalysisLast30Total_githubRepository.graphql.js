/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
type PlotChangeShow_plotChange$ref = any;
import type { FragmentReference } from "relay-runtime";
declare export opaque type GithubRepositoryPlotsAnalysisLast30Total_githubRepository$ref: FragmentReference;
declare export opaque type GithubRepositoryPlotsAnalysisLast30Total_githubRepository$fragmentType: GithubRepositoryPlotsAnalysisLast30Total_githubRepository$ref;
export type GithubRepositoryPlotsAnalysisLast30Total_githubRepository = {|
  +analysisLast30Total: {|
    +$fragmentRefs: PlotChangeShow_plotChange$ref
  |},
  +$refType: GithubRepositoryPlotsAnalysisLast30Total_githubRepository$ref,
|};
export type GithubRepositoryPlotsAnalysisLast30Total_githubRepository$data = GithubRepositoryPlotsAnalysisLast30Total_githubRepository;
export type GithubRepositoryPlotsAnalysisLast30Total_githubRepository$key = {
  +$data?: GithubRepositoryPlotsAnalysisLast30Total_githubRepository$data,
  +$fragmentRefs: GithubRepositoryPlotsAnalysisLast30Total_githubRepository$ref,
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
  "name": "GithubRepositoryPlotsAnalysisLast30Total_githubRepository",
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
      "concreteType": "PlotChange",
      "kind": "LinkedField",
      "name": "analysisLast30Total",
      "plural": false,
      "selections": [
        {
          "args": null,
          "kind": "FragmentSpread",
          "name": "PlotChangeShow_plotChange"
        }
      ],
      "storageKey": null
    }
  ],
  "type": "GithubRepository",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = 'effa1cbfd89e5261cd272ed4da7e9960';

module.exports = node;
