/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type RepositoryShow_repository$ref = any;
export type Period = "DAY" | "MONTH" | "WEEK" | "YEAR" | "%future added value";
export type RepositoryLoadQueryVariables = {|
  repositoryId: string,
  period: Period,
|};
export type RepositoryLoadQueryResponse = {|
  +currentUser: ?{|
    +repository: {|
      +$fragmentRefs: RepositoryShow_repository$ref
    |}
  |}
|};
export type RepositoryLoadQuery = {|
  variables: RepositoryLoadQueryVariables,
  response: RepositoryLoadQueryResponse,
|};
*/


/*
query RepositoryLoadQuery(
  $repositoryId: ID!
  $period: Period!
) {
  currentUser {
    repository(id: $repositoryId) {
      ...RepositoryShow_repository
      id
    }
    id
  }
}

fragment RepositoryMergedPRs_repository on Repository {
  name
  mergedPrs(period: $period) {
    traces {
      name
      x
      y
    }
  }
}

fragment RepositoryShow_repository on Repository {
  ...RepositoryMergedPRs_repository
  name
}
*/

const node/*: ConcreteRequest*/ = (function(){
var v0 = {
  "defaultValue": null,
  "kind": "LocalArgument",
  "name": "period"
},
v1 = {
  "defaultValue": null,
  "kind": "LocalArgument",
  "name": "repositoryId"
},
v2 = [
  {
    "kind": "Variable",
    "name": "id",
    "variableName": "repositoryId"
  }
],
v3 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "name",
  "storageKey": null
},
v4 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "id",
  "storageKey": null
};
return {
  "fragment": {
    "argumentDefinitions": [
      (v0/*: any*/),
      (v1/*: any*/)
    ],
    "kind": "Fragment",
    "metadata": null,
    "name": "RepositoryLoadQuery",
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
            "concreteType": "Repository",
            "kind": "LinkedField",
            "name": "repository",
            "plural": false,
            "selections": [
              {
                "args": null,
                "kind": "FragmentSpread",
                "name": "RepositoryShow_repository"
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
    "argumentDefinitions": [
      (v1/*: any*/),
      (v0/*: any*/)
    ],
    "kind": "Operation",
    "name": "RepositoryLoadQuery",
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
            "concreteType": "Repository",
            "kind": "LinkedField",
            "name": "repository",
            "plural": false,
            "selections": [
              (v3/*: any*/),
              {
                "alias": null,
                "args": [
                  {
                    "kind": "Variable",
                    "name": "period",
                    "variableName": "period"
                  }
                ],
                "concreteType": "PlotDataMergedPr",
                "kind": "LinkedField",
                "name": "mergedPrs",
                "plural": false,
                "selections": [
                  {
                    "alias": null,
                    "args": null,
                    "concreteType": "PlotDataMergedPrTrace",
                    "kind": "LinkedField",
                    "name": "traces",
                    "plural": true,
                    "selections": [
                      (v3/*: any*/),
                      {
                        "alias": null,
                        "args": null,
                        "kind": "ScalarField",
                        "name": "x",
                        "storageKey": null
                      },
                      {
                        "alias": null,
                        "args": null,
                        "kind": "ScalarField",
                        "name": "y",
                        "storageKey": null
                      }
                    ],
                    "storageKey": null
                  }
                ],
                "storageKey": null
              },
              (v4/*: any*/)
            ],
            "storageKey": null
          },
          (v4/*: any*/)
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "be1638859787a1456227633789a46017",
    "id": null,
    "metadata": {},
    "name": "RepositoryLoadQuery",
    "operationKind": "query",
    "text": "query RepositoryLoadQuery(\n  $repositoryId: ID!\n  $period: Period!\n) {\n  currentUser {\n    repository(id: $repositoryId) {\n      ...RepositoryShow_repository\n      id\n    }\n    id\n  }\n}\n\nfragment RepositoryMergedPRs_repository on Repository {\n  name\n  mergedPrs(period: $period) {\n    traces {\n      name\n      x\n      y\n    }\n  }\n}\n\nfragment RepositoryShow_repository on Repository {\n  ...RepositoryMergedPRs_repository\n  name\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '2325c2b5d038cd6ae516b08804b046a5';

module.exports = node;
