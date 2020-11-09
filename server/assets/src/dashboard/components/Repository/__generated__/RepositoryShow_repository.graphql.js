/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
type RepositoryPlotsMergedPrsPerPerson_repository$ref = any;
type RepositoryPlotsTotalPrsMerged_repository$ref = any;
import type { FragmentReference } from "relay-runtime";
declare export opaque type RepositoryShow_repository$ref: FragmentReference;
declare export opaque type RepositoryShow_repository$fragmentType: RepositoryShow_repository$ref;
export type RepositoryShow_repository = {|
  +name: string,
  +$fragmentRefs: RepositoryPlotsMergedPrsPerPerson_repository$ref & RepositoryPlotsTotalPrsMerged_repository$ref,
  +$refType: RepositoryShow_repository$ref,
|};
export type RepositoryShow_repository$data = RepositoryShow_repository;
export type RepositoryShow_repository$key = {
  +$data?: RepositoryShow_repository$data,
  +$fragmentRefs: RepositoryShow_repository$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "RepositoryShow_repository",
  "selections": [
    {
      "alias": null,
      "args": null,
      "kind": "ScalarField",
      "name": "name",
      "storageKey": null
    },
    {
      "args": null,
      "kind": "FragmentSpread",
      "name": "RepositoryPlotsMergedPrsPerPerson_repository"
    },
    {
      "args": null,
      "kind": "FragmentSpread",
      "name": "RepositoryPlotsTotalPrsMerged_repository"
    }
  ],
  "type": "Repository",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = '4f4cfe4f384b3caeeb5d9e2bb6343ee5';

module.exports = node;
