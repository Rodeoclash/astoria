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
    +hasGithubInstallations: boolean,
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
    ...CurrentUserGithubInstallations_currentUser
    hasGithubInstallations
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
  "name": "hasGithubInstallations",
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
  "name": "id",
  "storageKey": null
},
v4 = {
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
                      (v3/*: any*/),
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
                                  (v4/*: any*/)
                                ],
                                "storageKey": null
                              }
                            ],
                            "storageKey": null
                          }
                        ],
                        "storageKey": "githubRepositories(first:100)"
                      },
                      (v4/*: any*/)
                    ],
                    "storageKey": null
                  }
                ],
                "storageKey": null
              }
            ],
            "storageKey": "githubInstallations(first:100)"
          },
          (v0/*: any*/),
          (v3/*: any*/)
        ],
        "storageKey": null
      },
      (v1/*: any*/)
    ]
  },
  "params": {
    "cacheID": "6cdcfbff57493a69d63f7b84d6ccf5bd",
    "id": null,
    "metadata": {},
    "name": "DashboardPage_Query",
    "operationKind": "query",
    "text": "query DashboardPage_Query {\n  currentUser {\n    ...CurrentUserGithubInstallations_currentUser\n    hasGithubInstallations\n    id\n  }\n}\n\nfragment CurrentUserGithubInstallations_currentUser on CurrentUser {\n  githubInstallations(first: 100) {\n    edges {\n      node {\n        ...GithubInstallationNavigationItem_githubInstallation\n        id\n      }\n    }\n  }\n}\n\nfragment GithubInstallationGithubRepositories_githubInstallation on GithubInstallation {\n  id\n  githubRepositories(first: 100) {\n    edges {\n      node {\n        ...GithubRepositoryNavigationItem_githubRepository\n        id\n      }\n    }\n  }\n}\n\nfragment GithubInstallationNavigationItem_githubInstallation on GithubInstallation {\n  ...GithubInstallationGithubRepositories_githubInstallation\n  name\n}\n\nfragment GithubRepositoryNavigationItemActivity_githubRepository on GithubRepository {\n  id\n  lastActivityAt\n}\n\nfragment GithubRepositoryNavigationItem_githubRepository on GithubRepository {\n  ...GithubRepositoryNavigationItemActivity_githubRepository\n  id\n  name\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'dfbae587d4253155381c1e881bb2d0ec';

module.exports = node;
