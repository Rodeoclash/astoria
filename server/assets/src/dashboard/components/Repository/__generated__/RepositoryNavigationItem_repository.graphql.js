/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type RepositoryNavigationItem_repository$ref: FragmentReference;
declare export opaque type RepositoryNavigationItem_repository$fragmentType: RepositoryNavigationItem_repository$ref;
export type RepositoryNavigationItem_repository = {|
  +id: string,
  +name: string,
  +$refType: RepositoryNavigationItem_repository$ref,
|};
export type RepositoryNavigationItem_repository$data = RepositoryNavigationItem_repository;
export type RepositoryNavigationItem_repository$key = {
  +$data?: RepositoryNavigationItem_repository$data,
  +$fragmentRefs: RepositoryNavigationItem_repository$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "RepositoryNavigationItem_repository",
  "selections": [
    {
      "alias": null,
      "args": null,
      "kind": "ScalarField",
      "name": "id",
      "storageKey": null
    },
    {
      "alias": null,
      "args": null,
      "kind": "ScalarField",
      "name": "name",
      "storageKey": null
    }
  ],
  "type": "Repository",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = 'd810d4d54b03f2179003093c0c5741aa';

module.exports = node;
