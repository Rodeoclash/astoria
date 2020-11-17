/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
type GithubInstallationNavigationItem_githubInstallation$ref = any;
import type { FragmentReference } from "relay-runtime";
declare export opaque type CurrentUserGithubInstallations_currentUser$ref: FragmentReference;
declare export opaque type CurrentUserGithubInstallations_currentUser$fragmentType: CurrentUserGithubInstallations_currentUser$ref;
export type CurrentUserGithubInstallations_currentUser = {|
  +githubInstallations: ?{|
    +edges: ?$ReadOnlyArray<?{|
      +node: ?{|
        +id: string,
        +$fragmentRefs: GithubInstallationNavigationItem_githubInstallation$ref,
      |}
    |}>
  |},
  +$refType: CurrentUserGithubInstallations_currentUser$ref,
|};
export type CurrentUserGithubInstallations_currentUser$data = CurrentUserGithubInstallations_currentUser;
export type CurrentUserGithubInstallations_currentUser$key = {
  +$data?: CurrentUserGithubInstallations_currentUser$data,
  +$fragmentRefs: CurrentUserGithubInstallations_currentUser$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "CurrentUserGithubInstallations_currentUser",
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
      "concreteType": "GithubInstallationConnection",
      "kind": "LinkedField",
      "name": "githubInstallations",
      "plural": false,
      "selections": [
        {
          "alias": null,
          "args": null,
          "concreteType": "GithubInstallationEdge",
          "kind": "LinkedField",
          "name": "edges",
          "plural": true,
          "selections": [
            {
              "alias": null,
              "args": null,
              "concreteType": "GithubInstallation",
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
                  "name": "GithubInstallationNavigationItem_githubInstallation"
                }
              ],
              "storageKey": null
            }
          ],
          "storageKey": null
        }
      ],
      "storageKey": "githubInstallations(first:100)"
    }
  ],
  "type": "CurrentUser",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = '9072f5a51778173341cb41b69cb95f20';

module.exports = node;
