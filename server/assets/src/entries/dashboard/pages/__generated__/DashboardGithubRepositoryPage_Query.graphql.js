/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type GithubRepositoryName_githubRepository$ref = any;
export type DashboardGithubRepositoryPage_QueryVariables = {|
  githubRepositoryId: string
|};
export type DashboardGithubRepositoryPage_QueryResponse = {|
  +currentUser: ?{|
    +githubRepository: {|
      +$fragmentRefs: GithubRepositoryName_githubRepository$ref
    |}
  |}
|};
export type DashboardGithubRepositoryPage_Query = {|
  variables: DashboardGithubRepositoryPage_QueryVariables,
  response: DashboardGithubRepositoryPage_QueryResponse,
|};
*/


/*
query DashboardGithubRepositoryPage_Query(
  $githubRepositoryId: ID!
) {
  currentUser {
    githubRepository(id: $githubRepositoryId) {
      ...GithubRepositoryName_githubRepository
      id
    }
    id
  }
}

fragment GithubRepositoryName_githubRepository on GithubRepository {
  name
  githubInstallation {
    name
    id
  }
}
*/

const node/*: ConcreteRequest*/ = (function(){
var v0 = [
  {
    "defaultValue": null,
    "kind": "LocalArgument",
    "name": "githubRepositoryId"
  }
],
v1 = [
  {
    "kind": "Variable",
    "name": "id",
    "variableName": "githubRepositoryId"
  }
],
v2 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "name",
  "storageKey": null
},
v3 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "id",
  "storageKey": null
};
return {
  "fragment": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Fragment",
    "metadata": null,
    "name": "DashboardGithubRepositoryPage_Query",
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "CurrentUser",
        "kind": "LinkedField",
        "name": "currentUser",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": (v1/*: any*/),
            "concreteType": "GithubRepository",
            "kind": "LinkedField",
            "name": "githubRepository",
            "plural": false,
            "selections": [
              {
                "args": null,
                "kind": "FragmentSpread",
                "name": "GithubRepositoryName_githubRepository"
              }
            ],
            "storageKey": null
          }
        ],
        "storageKey": null
      }
    ],
    "type": "RootQueryType",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Operation",
    "name": "DashboardGithubRepositoryPage_Query",
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "CurrentUser",
        "kind": "LinkedField",
        "name": "currentUser",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": (v1/*: any*/),
            "concreteType": "GithubRepository",
            "kind": "LinkedField",
            "name": "githubRepository",
            "plural": false,
            "selections": [
              (v2/*: any*/),
              {
                "alias": null,
                "args": null,
                "concreteType": "GithubInstallation",
                "kind": "LinkedField",
                "name": "githubInstallation",
                "plural": false,
                "selections": [
                  (v2/*: any*/),
                  (v3/*: any*/)
                ],
                "storageKey": null
              },
              (v3/*: any*/)
            ],
            "storageKey": null
          },
          (v3/*: any*/)
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "42fac614a3dc8132c68d66bf739e3b96",
    "id": null,
    "metadata": {},
    "name": "DashboardGithubRepositoryPage_Query",
    "operationKind": "query",
    "text": "query DashboardGithubRepositoryPage_Query(\n  $githubRepositoryId: ID!\n) {\n  currentUser {\n    githubRepository(id: $githubRepositoryId) {\n      ...GithubRepositoryName_githubRepository\n      id\n    }\n    id\n  }\n}\n\nfragment GithubRepositoryName_githubRepository on GithubRepository {\n  name\n  githubInstallation {\n    name\n    id\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '36af5be8d46ab3f6ad43c9e937d37786';

module.exports = node;
