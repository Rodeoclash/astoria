/**
 * @flow
 */

/* eslint-disable */

"use strict";

/*::
import type { ConcreteRequest } from 'relay-runtime';
export type routes_QueryVariables = {||};
export type routes_QueryResponse = {|
  +currentUser: {|
    +id: string
  |}
|};
export type routes_Query = {|
  variables: routes_QueryVariables,
  response: routes_QueryResponse,
|};
*/

/*
query routes_Query {
  currentUser {
    id
  }
}
*/

const node /*: ConcreteRequest*/ = (function () {
  var v0 = [
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
          args: null,
          kind: "ScalarField",
          name: "id",
          storageKey: null,
        },
      ],
      storageKey: null,
    },
  ];
  return {
    fragment: {
      argumentDefinitions: [],
      kind: "Fragment",
      metadata: null,
      name: "routes_Query",
      selections: (v0 /*: any*/),
      type: "RootQueryType",
      abstractKey: null,
    },
    kind: "Request",
    operation: {
      argumentDefinitions: [],
      kind: "Operation",
      name: "routes_Query",
      selections: (v0 /*: any*/),
    },
    params: {
      cacheID: "5f4135318d8d6875e937e82470ff3bc1",
      id: null,
      metadata: {},
      name: "routes_Query",
      operationKind: "query",
      text: "query routes_Query {\n  currentUser {\n    id\n  }\n}\n",
    },
  };
})();
// prettier-ignore
(node/*: any*/).hash = 'c3c6370882252bf306cb480bb6f145d9';

module.exports = node;
