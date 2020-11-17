/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type CurrentUserGithubInstallations_currentUser$ref = any;
export type DashboardPage_QueryVariables = {||};
export type DashboardPage_QueryResponse = {|
  +currentUser: ?{|
    +$fragmentRefs: CurrentUserGithubInstallations_currentUser$ref
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
    ...CurrentUserGithubInstallations_currentUser
    id
  }
}

fragment CurrentUserGithubInstallations_currentUser on CurrentUser {
  githubInstallations(first: 100) {
    edges {
      node {
        ...GithubInstallationNavigationItem_githubInstallation
        id
      }
    }
  }
}

fragment GithubInstallationGithubRepositories_githubInstallation on GithubInstallation {
  githubRepositories(first: 100) {
    edges {
      node {
        ...GithubRepositoryNavigationItem_githubRepository
        id
      }
    }
  }
}

fragment GithubInstallationNavigationItem_githubInstallation on GithubInstallation {
  ...GithubInstallationGithubRepositories_githubInstallation
  name
}

fragment GithubRepositoryNavigationItem_githubRepository on GithubRepository {
  id
  name
}
*/

const node/*: ConcreteRequest*/ = (function(){
var v0 = [
  {
    "kind": "Literal",
    "name": "first",
    "value": 100
  }
],
v1 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "id",
  "storageKey": null
},
v2 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "name",
  "storageKey": null
};
return {
  "fragment": {
    "argumentDefinitions": [],
    "kind": "Fragment",
    "metadata": null,
    "name": "DashboardPage_Query",
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
            "args": null,
            "kind": "FragmentSpread",
            "name": "CurrentUserGithubInstallations_currentUser"
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
    "argumentDefinitions": [],
    "kind": "Operation",
    "name": "DashboardPage_Query",
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
            "args": (v0/*: any*/),
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
                        "args": (v0/*: any*/),
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
                                  (v1/*: any*/),
                                  (v2/*: any*/)
                                ],
                                "storageKey": null
                              }
                            ],
                            "storageKey": null
                          }
                        ],
                        "storageKey": "githubRepositories(first:100)"
                      },
                      (v2/*: any*/),
                      (v1/*: any*/)
                    ],
                    "storageKey": null
                  }
                ],
                "storageKey": null
              }
            ],
            "storageKey": "githubInstallations(first:100)"
          },
          (v1/*: any*/)
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "bce2ee2b052d6ba0ea441ecdf6934bcc",
    "id": null,
    "metadata": {},
    "name": "DashboardPage_Query",
    "operationKind": "query",
    "text": "query DashboardPage_Query {\n  currentUser {\n    ...CurrentUserGithubInstallations_currentUser\n    id\n  }\n}\n\nfragment CurrentUserGithubInstallations_currentUser on CurrentUser {\n  githubInstallations(first: 100) {\n    edges {\n      node {\n        ...GithubInstallationNavigationItem_githubInstallation\n        id\n      }\n    }\n  }\n}\n\nfragment GithubInstallationGithubRepositories_githubInstallation on GithubInstallation {\n  githubRepositories(first: 100) {\n    edges {\n      node {\n        ...GithubRepositoryNavigationItem_githubRepository\n        id\n      }\n    }\n  }\n}\n\nfragment GithubInstallationNavigationItem_githubInstallation on GithubInstallation {\n  ...GithubInstallationGithubRepositories_githubInstallation\n  name\n}\n\nfragment GithubRepositoryNavigationItem_githubRepository on GithubRepository {\n  id\n  name\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '72d605ac9529d278f68ccc74f9267a14';

module.exports = node;
