/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
type RepositoryNavigationItem_repository$ref = any;
import type { FragmentReference } from "relay-runtime";
declare export opaque type CurrentUserRepositoryList_currentUser$ref: FragmentReference;
declare export opaque type CurrentUserRepositoryList_currentUser$fragmentType: CurrentUserRepositoryList_currentUser$ref;
export type CurrentUserRepositoryList_currentUser = {|
  +repositories: ?{|
    +edges: ?$ReadOnlyArray<?{|
      +node: ?{|
        +id: string,
        +$fragmentRefs: RepositoryNavigationItem_repository$ref,
      |}
    |}>
  |},
  +$refType: CurrentUserRepositoryList_currentUser$ref,
|};
export type CurrentUserRepositoryList_currentUser$data = CurrentUserRepositoryList_currentUser;
export type CurrentUserRepositoryList_currentUser$key = {
  +$data?: CurrentUserRepositoryList_currentUser$data,
  +$fragmentRefs: CurrentUserRepositoryList_currentUser$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "CurrentUserRepositoryList_currentUser",
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
      "concreteType": "RepositoryConnection",
      "kind": "LinkedField",
      "name": "repositories",
      "plural": false,
      "selections": [
        {
          "alias": null,
          "args": null,
          "concreteType": "RepositoryEdge",
          "kind": "LinkedField",
          "name": "edges",
          "plural": true,
          "selections": [
            {
              "alias": null,
              "args": null,
              "concreteType": "Repository",
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
                  "name": "RepositoryNavigationItem_repository"
                }
              ],
              "storageKey": null
            }
          ],
          "storageKey": null
        }
      ],
      "storageKey": "repositories(first:100)"
    }
  ],
  "type": "CurrentUser",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = '491576a1a3c63263dfa2f74d2802af8d';

module.exports = node;
