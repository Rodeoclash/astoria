/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
type GithubRepositoryNavigationItem_githubRepository$ref = any;
import type { FragmentReference } from "relay-runtime";
declare export opaque type GithubInstallationGithubRepositories_githubInstallation$ref: FragmentReference;
declare export opaque type GithubInstallationGithubRepositories_githubInstallation$fragmentType: GithubInstallationGithubRepositories_githubInstallation$ref;
export type GithubInstallationGithubRepositories_githubInstallation = {|
  +id: string,
  +githubRepositories: ?{|
    +edges: ?$ReadOnlyArray<?{|
      +node: ?{|
        +id: string,
        +$fragmentRefs: GithubRepositoryNavigationItem_githubRepository$ref,
      |}
    |}>
  |},
  +$refType: GithubInstallationGithubRepositories_githubInstallation$ref,
|};
export type GithubInstallationGithubRepositories_githubInstallation$data = GithubInstallationGithubRepositories_githubInstallation;
export type GithubInstallationGithubRepositories_githubInstallation$key = {
  +$data?: GithubInstallationGithubRepositories_githubInstallation$data,
  +$fragmentRefs: GithubInstallationGithubRepositories_githubInstallation$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = (function(){
var v0 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "id",
  "storageKey": null
};
return {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "GithubInstallationGithubRepositories_githubInstallation",
  "selections": [
    (v0/*: any*/),
    {
      "alias": null,
      "args": [
        {
          "kind": "Literal",
          "name": "first",
          "value": 100
        }
      ],
      "concreteType": "GithubRepositoryConnection",
      "kind": "LinkedField",
      "name": "githubRepositories",
      "plural": false,
      "selections": [
        {
          "alias": null,
          "args": null,
          "concreteType": "GithubRepositoryEdge",
          "kind": "LinkedField",
          "name": "edges",
          "plural": true,
          "selections": [
            {
              "alias": null,
              "args": null,
              "concreteType": "GithubRepository",
              "kind": "LinkedField",
              "name": "node",
              "plural": false,
              "selections": [
                (v0/*: any*/),
                {
                  "args": null,
                  "kind": "FragmentSpread",
                  "name": "GithubRepositoryNavigationItem_githubRepository"
                }
              ],
              "storageKey": null
            }
          ],
          "storageKey": null
        }
      ],
      "storageKey": "githubRepositories(first:100)"
    }
  ],
  "type": "GithubInstallation",
  "abstractKey": null
};
})();
// prettier-ignore
(node/*: any*/).hash = '35ed77a178b1450f92e15458afeff69f';

module.exports = node;
