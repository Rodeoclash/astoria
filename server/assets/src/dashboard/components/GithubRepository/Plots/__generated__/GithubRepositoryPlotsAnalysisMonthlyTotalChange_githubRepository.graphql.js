/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
type PlotDateFloatShow_plotDateFloat$ref = any;
import type { FragmentReference } from "relay-runtime";
declare export opaque type GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository$ref: FragmentReference;
declare export opaque type GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository$fragmentType: GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository$ref;
export type GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository = {|
  +analysisMonthlyTotalChange: {|
    +$fragmentRefs: PlotDateFloatShow_plotDateFloat$ref
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
      "concreteType": "PlotDateFloat",
      "kind": "LinkedField",
      "name": "analysisMonthlyTotalChange",
      "plural": false,
      "selections": [
        {
          "args": null,
          "kind": "FragmentSpread",
          "name": "PlotDateFloatShow_plotDateFloat"
        }
      ],
      "storageKey": null
    }
  ],
  "type": "GithubRepository",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = '70c2ea3afcdffbf128daa09d035f46d1';

module.exports = node;
