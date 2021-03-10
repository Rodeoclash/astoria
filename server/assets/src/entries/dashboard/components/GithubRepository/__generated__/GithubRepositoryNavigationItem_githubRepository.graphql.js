/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
type GithubRepositoryNavigationItemActivity_githubRepository$ref = any;
import type { FragmentReference } from "relay-runtime";
declare export opaque type GithubRepositoryNavigationItem_githubRepository$ref: FragmentReference;
declare export opaque type GithubRepositoryNavigationItem_githubRepository$fragmentType: GithubRepositoryNavigationItem_githubRepository$ref;
export type GithubRepositoryNavigationItem_githubRepository = {|
  +id: string,
  +name: string,
  +$fragmentRefs: GithubRepositoryNavigationItemActivity_githubRepository$ref,
  +$refType: GithubRepositoryNavigationItem_githubRepository$ref,
|};
export type GithubRepositoryNavigationItem_githubRepository$data = GithubRepositoryNavigationItem_githubRepository;
export type GithubRepositoryNavigationItem_githubRepository$key = {
  +$data?: GithubRepositoryNavigationItem_githubRepository$data,
  +$fragmentRefs: GithubRepositoryNavigationItem_githubRepository$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "GithubRepositoryNavigationItem_githubRepository",
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
    },
    {
      "args": null,
      "kind": "FragmentSpread",
      "name": "GithubRepositoryNavigationItemActivity_githubRepository"
    }
  ],
  "type": "GithubRepository",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = '822a5513ab104694e8ff6831dccdc964';

module.exports = node;
