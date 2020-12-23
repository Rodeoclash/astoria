/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type CurrentUserGithubInstallations_currentUser$ref = any;
export type DashboardPage_QueryVariables = {|
  githubRepositoryId: string
|};
export type DashboardPage_QueryResponse = {|
  +currentUser: ?{|
    +githubRepository: {|
      +name: string
    |},
    +$fragmentRefs: CurrentUserGithubInstallations_currentUser$ref,
  |}
|};
export type DashboardPage_Query = {|
  variables: DashboardPage_QueryVariables,
  response: DashboardPage_QueryResponse,
|};
*/


/*
query DashboardPage_Query(
  $githubRepositoryId: ID!
) {
  currentUser {
    githubRepository(id: $githubRepositoryId) {
      name
      id
    }
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
},
v4 = [
  {
    "kind": "Literal",
    "name": "first",
    "value": 100
  }
];
return {
  "fragment": {
    "argumentDefinitions": (v0/*: any*/),
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
            "alias": null,
            "args": (v1/*: any*/),
            "concreteType": "GithubRepository",
            "kind": "LinkedField",
            "name": "githubRepository",
            "plural": false,
            "selections": [
              (v2/*: any*/)
            ],
            "storageKey": null
          },
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
    "argumentDefinitions": (v0/*: any*/),
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
            "args": (v1/*: any*/),
            "concreteType": "GithubRepository",
            "kind": "LinkedField",
            "name": "githubRepository",
            "plural": false,
            "selections": [
              (v2/*: any*/),
              (v3/*: any*/)
            ],
            "storageKey": null
          },
          {
            "alias": null,
            "args": (v4/*: any*/),
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
                        "args": (v4/*: any*/),
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
                      (v3/*: any*/)
                    ],
                    "storageKey": null
                  }
                ],
                "storageKey": null
              }
            ],
            "storageKey": "githubInstallations(first:100)"
          },
          (v3/*: any*/)
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "b55e86f22340a357fce7588da5231891",
    "id": null,
    "metadata": {},
    "name": "DashboardPage_Query",
    "operationKind": "query",
    "text": "query DashboardPage_Query(\n  $githubRepositoryId: ID!\n) {\n  currentUser {\n    githubRepository(id: $githubRepositoryId) {\n      name\n      id\n    }\n    ...CurrentUserGithubInstallations_currentUser\n    id\n  }\n}\n\nfragment CurrentUserGithubInstallations_currentUser on CurrentUser {\n  githubInstallations(first: 100) {\n    edges {\n      node {\n        ...GithubInstallationNavigationItem_githubInstallation\n        id\n      }\n    }\n  }\n}\n\nfragment GithubInstallationGithubRepositories_githubInstallation on GithubInstallation {\n  githubRepositories(first: 100) {\n    edges {\n      node {\n        ...GithubRepositoryNavigationItem_githubRepository\n        id\n      }\n    }\n  }\n}\n\nfragment GithubInstallationNavigationItem_githubInstallation on GithubInstallation {\n  ...GithubInstallationGithubRepositories_githubInstallation\n  name\n}\n\nfragment GithubRepositoryNavigationItem_githubRepository on GithubRepository {\n  id\n  name\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '68ff62acfb8e1a75aa4e1c7c63bbd9cb';

module.exports = node;
