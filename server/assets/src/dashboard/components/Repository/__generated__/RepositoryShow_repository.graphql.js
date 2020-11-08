/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
type RepositoryMergedPRs_repository$ref = any;
import type { FragmentReference } from "relay-runtime";
declare export opaque type RepositoryShow_repository$ref: FragmentReference;
declare export opaque type RepositoryShow_repository$fragmentType: RepositoryShow_repository$ref;
export type RepositoryShow_repository = {|
  +name: string,
  +$fragmentRefs: RepositoryMergedPRs_repository$ref,
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
      "name": "RepositoryMergedPRs_repository"
    }
  ],
  "type": "Repository",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = 'a26e2391566e34065662e0fdcb8559d2';

module.exports = node;
