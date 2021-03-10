/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type GithubRepositoryNavigationItemActivity_githubRepository$ref: FragmentReference;
declare export opaque type GithubRepositoryNavigationItemActivity_githubRepository$fragmentType: GithubRepositoryNavigationItemActivity_githubRepository$ref;
export type GithubRepositoryNavigationItemActivity_githubRepository = {|
  +id: string,
  +lastActivityAt: ?any,
  +$refType: GithubRepositoryNavigationItemActivity_githubRepository$ref,
|};
export type GithubRepositoryNavigationItemActivity_githubRepository$data = GithubRepositoryNavigationItemActivity_githubRepository;
export type GithubRepositoryNavigationItemActivity_githubRepository$key = {
  +$data?: GithubRepositoryNavigationItemActivity_githubRepository$data,
  +$fragmentRefs: GithubRepositoryNavigationItemActivity_githubRepository$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "GithubRepositoryNavigationItemActivity_githubRepository",
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
      "name": "lastActivityAt",
      "storageKey": null
    }
  ],
  "type": "GithubRepository",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = '85a2af76559ccf7a98025268c52f904c';

module.exports = node;
