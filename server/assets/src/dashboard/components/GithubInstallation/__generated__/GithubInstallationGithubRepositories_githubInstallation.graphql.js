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


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "GithubInstallationGithubRepositories_githubInstallation",
  "selections": [
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
                {
                  "alias": null,
                  "args": null,
                  "kind": "ScalarField",
                  "name": "id",
                  "storageKey": null
                },
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
// prettier-ignore
(node/*: any*/).hash = '4bda382255732459f02733006aac25c7';

module.exports = node;
