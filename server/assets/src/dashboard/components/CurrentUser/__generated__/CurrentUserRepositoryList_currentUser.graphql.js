/**
 * @flow
 */

/* eslint-disable */

"use strict";

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

const node /*: ReaderFragment*/ = {
  argumentDefinitions: [],
  kind: "Fragment",
  metadata: null,
  name: "CurrentUserRepositoryList_currentUser",
  selections: [
    {
      alias: null,
      args: [
        {
          kind: "Literal",
          name: "first",
          value: 10,
        },
      ],
      concreteType: "RepositoryConnection",
      kind: "LinkedField",
      name: "repositories",
      plural: false,
      selections: [
        {
          alias: null,
          args: null,
          concreteType: "RepositoryEdge",
          kind: "LinkedField",
          name: "edges",
          plural: true,
          selections: [
            {
              alias: null,
              args: null,
              concreteType: "Repository",
              kind: "LinkedField",
              name: "node",
              plural: false,
              selections: [
                {
                  alias: null,
                  args: null,
                  kind: "ScalarField",
                  name: "id",
                  storageKey: null,
                },
                {
                  args: null,
                  kind: "FragmentSpread",
                  name: "RepositoryNavigationItem_repository",
                },
              ],
              storageKey: null,
            },
          ],
          storageKey: null,
        },
      ],
      storageKey: "repositories(first:10)",
    },
  ],
  type: "CurrentUser",
  abstractKey: null,
};
// prettier-ignore
(node/*: any*/).hash = '7aa7666dac402b1a869e5a4729c4a48a';

module.exports = node;
