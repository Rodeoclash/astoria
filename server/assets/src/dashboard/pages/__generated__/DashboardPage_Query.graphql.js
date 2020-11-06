/**
 * @flow
 */

/* eslint-disable */

"use strict";

/*::
import type { ConcreteRequest } from 'relay-runtime';
type CurrentUserRepositoryList_currentUser$ref = any;
export type DashboardPage_QueryVariables = {||};
export type DashboardPage_QueryResponse = {|
  +currentUser: ?{|
    +$fragmentRefs: CurrentUserRepositoryList_currentUser$ref
  |}
|};
export type DashboardPage_Query = {|
  variables: DashboardPage_QueryVariables,
  response: DashboardPage_QueryResponse,
|};
*/

/*
query DashboardPage_Query {
  currentUser {
    ...CurrentUserRepositoryList_currentUser
    id
  }
}

fragment CurrentUserRepositoryList_currentUser on CurrentUser {
  repositories(first: 10) {
    edges {
      node {
        ...RepositoryNavigationItem_repository
        id
      }
    }
  }
}

fragment RepositoryNavigationItem_repository on Repository {
  id
  name
}
*/

const node /*: ConcreteRequest*/ = (function () {
  var v0 = {
    alias: null,
    args: null,
    kind: "ScalarField",
    name: "id",
    storageKey: null,
  };
  return {
    fragment: {
      argumentDefinitions: [],
      kind: "Fragment",
      metadata: null,
      name: "DashboardPage_Query",
      selections: [
        {
          alias: null,
          args: null,
          concreteType: "CurrentUser",
          kind: "LinkedField",
          name: "currentUser",
          plural: false,
          selections: [
            {
              args: null,
              kind: "FragmentSpread",
              name: "CurrentUserRepositoryList_currentUser",
            },
          ],
          storageKey: null,
        },
      ],
      type: "RootQueryType",
      abstractKey: null,
    },
    kind: "Request",
    operation: {
      argumentDefinitions: [],
      kind: "Operation",
      name: "DashboardPage_Query",
      selections: [
        {
          alias: null,
          args: null,
          concreteType: "CurrentUser",
          kind: "LinkedField",
          name: "currentUser",
          plural: false,
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
                        (v0 /*: any*/),
                        {
                          alias: null,
                          args: null,
                          kind: "ScalarField",
                          name: "name",
                          storageKey: null,
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
            (v0 /*: any*/),
          ],
          storageKey: null,
        },
      ],
    },
    params: {
      cacheID: "ef0cc1d903721c0e7600922b5efdd4f0",
      id: null,
      metadata: {},
      name: "DashboardPage_Query",
      operationKind: "query",
      text:
        "query DashboardPage_Query {\n  currentUser {\n    ...CurrentUserRepositoryList_currentUser\n    id\n  }\n}\n\nfragment CurrentUserRepositoryList_currentUser on CurrentUser {\n  repositories(first: 10) {\n    edges {\n      node {\n        ...RepositoryNavigationItem_repository\n        id\n      }\n    }\n  }\n}\n\nfragment RepositoryNavigationItem_repository on Repository {\n  id\n  name\n}\n",
    },
  };
})();
// prettier-ignore
(node/*: any*/).hash = '5f1c4dd6cea6f07968945d5c687a7357';

module.exports = node;
