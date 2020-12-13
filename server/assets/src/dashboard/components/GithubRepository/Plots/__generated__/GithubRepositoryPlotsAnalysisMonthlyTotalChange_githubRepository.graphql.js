/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
type PlotChangeShow_plotChange$ref = any;
import type { FragmentReference } from "relay-runtime";
declare export opaque type GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository$ref: FragmentReference;
declare export opaque type GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository$fragmentType: GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository$ref;
export type GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository = {|
  +analysisMonthlyTotalChange: {|
    +$fragmentRefs: PlotChangeShow_plotChange$ref
  |},
  +$refType: GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository$ref,
|};
export type GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository$data = GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository;
export type GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository$key = {
  +$data?: GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository$data,
  +$fragmentRefs: GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository$ref,
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
  "name": "GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository",
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
      "name": "analysisMonthlyTotalChange",
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
(node/*: any*/).hash = 'e93a66957cd4d016d5cc6b4ae9ea0867';

module.exports = node;
