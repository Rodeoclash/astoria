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
  +dashboardSettings: {|
    +selectedGithubInstallationName: ?string,
    +selectedGithubRepositoryName: ?string,
  |},
  +currentUser: ?{|
    +id: string,
    +$fragmentRefs: CurrentUserGithubInstallations_currentUser$ref,
  |},
|};
export type DashboardPage_Query = {|
  variables: DashboardPage_QueryVariables,
  response: DashboardPage_QueryResponse,
|};
*/


/*
query DashboardPage_Query {
  currentUser {
    id
    ...CurrentUserGithubInstallations_currentUser
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
  id
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
var v0 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "id",
  "storageKey": null
},
v1 = {
  "kind": "ClientExtension",
  "selections": [
    {
      "alias": null,
      "args": null,
      "concreteType": "DashboardSettings",
      "kind": "LinkedField",
      "name": "dashboardSettings",
      "plural": false,
      "selections": [
        {
          "alias": null,
          "args": null,
          "kind": "ScalarField",
          "name": "selectedGithubInstallationName",
          "storageKey": null
        },
        {
          "alias": null,
          "args": null,
          "kind": "ScalarField",
          "name": "selectedGithubRepositoryName",
          "storageKey": null
        }
      ],
      "storageKey": null
    }
  ]
},
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
          (v0/*: any*/),
          {
            "args": null,
            "kind": "FragmentSpread",
            "name": "CurrentUserGithubInstallations_currentUser"
          }
        ],
        "storageKey": null
      },
      (v1/*: any*/)
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
          (v0/*: any*/),
          {
            "alias": null,
            "args": (v2/*: any*/),
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
                      (v0/*: any*/),
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
                                  (v0/*: any*/),
                                  {
                                    "alias": null,
                                    "args": null,
                                    "kind": "ScalarField",
                                    "name": "lastActivityAt",
                                    "storageKey": null
                                  },
                                  (v3/*: any*/)
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
                ],
                "storageKey": null
              }
            ],
            "storageKey": "githubInstallations(first:100)"
          }
        ],
        "storageKey": null
      },
      (v1/*: any*/)
    ]
  },
  "params": {
    "cacheID": "8acb2e114e6c0d443f2bf6352c56f338",
    "id": null,
    "metadata": {},
    "name": "DashboardPage_Query",
    "operationKind": "query",
    "text": "query DashboardPage_Query {\n  currentUser {\n    id\n    ...CurrentUserGithubInstallations_currentUser\n  }\n}\n\nfragment CurrentUserGithubInstallations_currentUser on CurrentUser {\n  githubInstallations(first: 100) {\n    edges {\n      node {\n        ...GithubInstallationNavigationItem_githubInstallation\n        id\n      }\n    }\n  }\n}\n\nfragment GithubInstallationGithubRepositories_githubInstallation on GithubInstallation {\n  id\n  githubRepositories(first: 100) {\n    edges {\n      node {\n        ...GithubRepositoryNavigationItem_githubRepository\n        id\n      }\n    }\n  }\n}\n\nfragment GithubInstallationNavigationItem_githubInstallation on GithubInstallation {\n  ...GithubInstallationGithubRepositories_githubInstallation\n  name\n}\n\nfragment GithubRepositoryNavigationItemActivity_githubRepository on GithubRepository {\n  id\n  lastActivityAt\n}\n\nfragment GithubRepositoryNavigationItem_githubRepository on GithubRepository {\n  ...GithubRepositoryNavigationItemActivity_githubRepository\n  id\n  name\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '02799b04498c01ce7c4d6c76e5c427a5';

module.exports = node;
