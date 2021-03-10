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
  +githubInstallation: {|
    +name: string
  |},
  +$refType: GithubRepositoryName_githubRepository$ref,
|};
export type GithubRepositoryName_githubRepository$data = GithubRepositoryName_githubRepository;
export type GithubRepositoryName_githubRepository$key = {
  +$data?: GithubRepositoryName_githubRepository$data,
  +$fragmentRefs: GithubRepositoryName_githubRepository$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = (function(){
var v0 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "name",
  "storageKey": null
};
return {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "GithubRepositoryName_githubRepository",
  "selections": [
    (v0/*: any*/),
    {
      "alias": null,
      "args": null,
      "concreteType": "GithubInstallation",
      "kind": "LinkedField",
      "name": "githubInstallation",
      "plural": false,
      "selections": [
        (v0/*: any*/)
      ],
      "storageKey": null
    }
  ],
  "type": "GithubRepository",
  "abstractKey": null
};
})();
// prettier-ignore
(node/*: any*/).hash = '9ac373d1fb667f124e72dea847730385';

module.exports = node;
