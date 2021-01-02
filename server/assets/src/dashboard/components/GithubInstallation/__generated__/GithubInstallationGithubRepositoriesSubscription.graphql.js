/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type GithubRepositoryNavigationItem_githubRepository$ref = any;
export type GithubInstallationGithubRepositoriesSubscriptionVariables = {|
  id: string
|};
export type GithubInstallationGithubRepositoriesSubscriptionResponse = {|
  +githubInstallationRepositoriesUpdated: ?{|
    +githubRepositories: ?{|
      +edges: ?$ReadOnlyArray<?{|
        +node: ?{|
          +id: string,
          +$fragmentRefs: GithubRepositoryNavigationItem_githubRepository$ref,
        |}
      |}>
    |}
  |}
|};
export type GithubInstallationGithubRepositoriesSubscription = {|
  variables: GithubInstallationGithubRepositoriesSubscriptionVariables,
  response: GithubInstallationGithubRepositoriesSubscriptionResponse,
|};
*/


/*
subscription GithubInstallationGithubRepositoriesSubscription(
  $id: ID!
) {
  githubInstallationRepositoriesUpdated(id: $id) {
    githubRepositories(first: 100) {
      edges {
        node {
          ...GithubRepositoryNavigationItem_githubRepository
          id
        }
      }
    }
    id
  }
}

fragment GithubRepositoryNavigationItemActivity_githubRepository on GithubRepository {
  id
  lastActivityAt
}

fragment GithubRepositoryNavigationItem_githubRepository on GithubRepository {
  ...GithubRepositoryNavigationItemActivity_githubRepository
  id
  name
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
v2 = [
  {
    "kind": "Literal",
    "name": "first",
    "value": 100
  }
],
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
    "name": "GithubInstallationGithubRepositoriesSubscription",
    "selections": [
      {
        "alias": null,
        "args": (v1/*: any*/),
        "concreteType": "GithubInstallation",
        "kind": "LinkedField",
        "name": "githubInstallationRepositoriesUpdated",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": (v2/*: any*/),
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
                      (v3/*: any*/),
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
    "name": "GithubInstallationGithubRepositoriesSubscription",
    "selections": [
      {
        "alias": null,
        "args": (v1/*: any*/),
        "concreteType": "GithubInstallation",
        "kind": "LinkedField",
        "name": "githubInstallationRepositoriesUpdated",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": (v2/*: any*/),
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
                      (v3/*: any*/),
                      {
                        "alias": null,
                        "args": null,
                        "kind": "ScalarField",
                        "name": "lastActivityAt",
                        "storageKey": null
                      },
                      {
                        "alias": null,
                        "args": null,
                        "kind": "ScalarField",
                        "name": "name",
                        "storageKey": null
                      }
                    ],
                    "storageKey": null
                  }
                ],
                "storageKey": null
              }
            ],
            "storageKey": "githubRepositories(first:100)"
          },
          (v3/*: any*/)
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "7b3925c4090080758ea7a51e6e6dd1e1",
    "id": null,
    "metadata": {},
    "name": "GithubInstallationGithubRepositoriesSubscription",
    "operationKind": "subscription",
    "text": "subscription GithubInstallationGithubRepositoriesSubscription(\n  $id: ID!\n) {\n  githubInstallationRepositoriesUpdated(id: $id) {\n    githubRepositories(first: 100) {\n      edges {\n        node {\n          ...GithubRepositoryNavigationItem_githubRepository\n          id\n        }\n      }\n    }\n    id\n  }\n}\n\nfragment GithubRepositoryNavigationItemActivity_githubRepository on GithubRepository {\n  id\n  lastActivityAt\n}\n\nfragment GithubRepositoryNavigationItem_githubRepository on GithubRepository {\n  ...GithubRepositoryNavigationItemActivity_githubRepository\n  id\n  name\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'b16dd64d4dfde55a61360d604862d6f5';

module.exports = node;
