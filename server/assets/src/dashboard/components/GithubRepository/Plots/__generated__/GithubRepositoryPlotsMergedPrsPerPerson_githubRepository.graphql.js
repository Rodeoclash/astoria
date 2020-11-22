/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
type PlotDateIntegerShow_plotDateInteger$ref = any;
import type { FragmentReference } from "relay-runtime";
declare export opaque type GithubRepositoryPlotsMergedPrsPerPerson_githubRepository$ref: FragmentReference;
declare export opaque type GithubRepositoryPlotsMergedPrsPerPerson_githubRepository$fragmentType: GithubRepositoryPlotsMergedPrsPerPerson_githubRepository$ref;
export type GithubRepositoryPlotsMergedPrsPerPerson_githubRepository = {|
  +mergedPrsPerPerson: {|
    +$fragmentRefs: PlotDateIntegerShow_plotDateInteger$ref
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
  "name": "GithubRepositoryPlotsMergedPrsPerPerson_githubRepository",
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
      "name": "mergedPrsPerPerson",
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
(node/*: any*/).hash = '189406a03d1ed9114f122a9fc1199b20';

module.exports = node;
