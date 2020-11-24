/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
type PlotDateFloatShow_plotDateFloat$ref = any;
import type { FragmentReference } from "relay-runtime";
declare export opaque type GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository$ref: FragmentReference;
declare export opaque type GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository$fragmentType: GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository$ref;
export type GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository = {|
  +averageDaysPrOpenBeforeMerge: {|
    +$fragmentRefs: PlotDateFloatShow_plotDateFloat$ref
  |},
  +$refType: GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository$ref,
|};
export type GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository$data = GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository;
export type GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository$key = {
  +$data?: GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository$data,
  +$fragmentRefs: GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository$ref,
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
  "name": "GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository",
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
      "name": "averageDaysPrOpenBeforeMerge",
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
(node/*: any*/).hash = '8676f04333cf0c3d87b770747115260c';

module.exports = node;
