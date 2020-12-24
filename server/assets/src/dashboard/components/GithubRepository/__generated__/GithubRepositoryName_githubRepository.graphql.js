/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type GithubRepositoryName_githubRepository$ref: FragmentReference;
declare export opaque type GithubRepositoryName_githubRepository$fragmentType: GithubRepositoryName_githubRepository$ref;
export type GithubRepositoryName_githubRepository = {|
  +name: string,
  +$refType: GithubRepositoryName_githubRepository$ref,
|};
export type GithubRepositoryName_githubRepository$data = GithubRepositoryName_githubRepository;
export type GithubRepositoryName_githubRepository$key = {
  +$data?: GithubRepositoryName_githubRepository$data,
  +$fragmentRefs: GithubRepositoryName_githubRepository$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "GithubRepositoryName_githubRepository",
  "selections": [
    {
      "alias": null,
      "args": null,
      "kind": "ScalarField",
      "name": "name",
      "storageKey": null
    }
  ],
  "type": "GithubRepository",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = '5b9537c206514ce41c3d3b66e127f611';

module.exports = node;
