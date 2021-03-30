/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
export type GithubRepositoryNavigationItemActivitySubscriptionVariables = {|
  id: string
|};
export type GithubRepositoryNavigationItemActivitySubscriptionResponse = {|
  +githubRepositoryUpdated: ?{|
    +lastActivityAt: ?any
  |}
|};
export type GithubRepositoryNavigationItemActivitySubscription = {|
  variables: GithubRepositoryNavigationItemActivitySubscriptionVariables,
  response: GithubRepositoryNavigationItemActivitySubscriptionResponse,
|};
*/


/*
subscription GithubRepositoryNavigationItemActivitySubscription(
  $id: ID!
) {
  githubRepositoryUpdated(id: $id) {
    lastActivityAt
    id
  }
}
*/

const node/*: ConcreteRequest*/ = (function(){
var v0 = [
  {
    "defaultValue": null,
    "kind": "LocalArgument",
    "name": "id"
  }
],
v1 = [
  {
    "kind": "Variable",
    "name": "id",
    "variableName": "id"
  }
],
v2 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "lastActivityAt",
  "storageKey": null
};
return {
  "fragment": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Fragment",
    "metadata": null,
    "name": "GithubRepositoryNavigationItemActivitySubscription",
    "selections": [
      {
        "alias": null,
        "args": (v1/*: any*/),
        "concreteType": "GithubRepository",
        "kind": "LinkedField",
        "name": "githubRepositoryUpdated",
        "plural": false,
        "selections": [
          (v2/*: any*/)
        ],
        "storageKey": null
      }
    ],
    "type": "RootSubscriptionType",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Operation",
    "name": "GithubRepositoryNavigationItemActivitySubscription",
    "selections": [
      {
        "alias": null,
        "args": (v1/*: any*/),
        "concreteType": "GithubRepository",
        "kind": "LinkedField",
        "name": "githubRepositoryUpdated",
        "plural": false,
        "selections": [
          (v2/*: any*/),
          {
            "alias": null,
            "args": null,
            "kind": "ScalarField",
            "name": "id",
            "storageKey": null
          }
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "8a5e1c82aafb610522ccfdd341adf45d",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryNavigationItemActivitySubscription",
    "operationKind": "subscription",
    "text": "subscription GithubRepositoryNavigationItemActivitySubscription(\n  $id: ID!\n) {\n  githubRepositoryUpdated(id: $id) {\n    lastActivityAt\n    id\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'ff7f9db139fbf23de9b55c445fb104ea';

module.exports = node;
