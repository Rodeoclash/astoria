/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
type PlotDateFloatShow_plotDateFloat$ref = any;
import type { FragmentReference } from "relay-runtime";
declare export opaque type GithubRepositoryPlotsAverageChangeInPr_githubRepository$ref: FragmentReference;
declare export opaque type GithubRepositoryPlotsAverageChangeInPr_githubRepository$fragmentType: GithubRepositoryPlotsAverageChangeInPr_githubRepository$ref;
export type GithubRepositoryPlotsAverageChangeInPr_githubRepository = {|
  +averageChangeInPr: {|
    +$fragmentRefs: PlotDateFloatShow_plotDateFloat$ref
  |},
  +$refType: GithubRepositoryPlotsAverageChangeInPr_githubRepository$ref,
|};
export type GithubRepositoryPlotsAverageChangeInPr_githubRepository$data = GithubRepositoryPlotsAverageChangeInPr_githubRepository;
export type GithubRepositoryPlotsAverageChangeInPr_githubRepository$key = {
  +$data?: GithubRepositoryPlotsAverageChangeInPr_githubRepository$data,
  +$fragmentRefs: GithubRepositoryPlotsAverageChangeInPr_githubRepository$ref,
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
  "name": "GithubRepositoryPlotsAverageChangeInPr_githubRepository",
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
      "name": "averageChangeInPr",
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
(node/*: any*/).hash = 'eee1a7c028b4eb31dbea7d396fd54a9b';

module.exports = node;
