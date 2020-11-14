/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type RepositoryPlotsTotalPrsMerged_repository$ref = any;
export type Period = "DAY" | "MONTH" | "WEEK" | "YEAR" | "%future added value";
export type RepositoryPlotsTotalPrsMergedLoaderQueryVariables = {|
  repositoryId: string,
  period: Period,
|};
export type RepositoryPlotsTotalPrsMergedLoaderQueryResponse = {|
  +currentUser: ?{|
    +repository: {|
      +$fragmentRefs: RepositoryPlotsTotalPrsMerged_repository$ref
    |}
  |}
|};
export type RepositoryPlotsTotalPrsMergedLoaderQuery = {|
  variables: RepositoryPlotsTotalPrsMergedLoaderQueryVariables,
  response: RepositoryPlotsTotalPrsMergedLoaderQueryResponse,
|};
*/


/*
query RepositoryPlotsTotalPrsMergedLoaderQuery(
  $repositoryId: ID!
  $period: Period!
) {
  currentUser {
    repository(id: $repositoryId) {
      ...RepositoryPlotsTotalPrsMerged_repository
      id
    }
    id
  }
}

fragment RepositoryPlotsTotalPrsMerged_repository on Repository {
  name
  totalPrsMerged(period: $period) {
    traces {
      name
      x
      y
    }
  }
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
    "name": "RepositoryPlotsTotalPrsMergedLoaderQuery",
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
                "name": "RepositoryPlotsTotalPrsMerged_repository"
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
    "name": "RepositoryPlotsTotalPrsMergedLoaderQuery",
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
                "name": "totalPrsMerged",
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
    "cacheID": "a7f57c6955b4466867ac5ca966361ac2",
    "id": null,
    "metadata": {},
    "name": "RepositoryPlotsTotalPrsMergedLoaderQuery",
    "operationKind": "query",
    "text": "query RepositoryPlotsTotalPrsMergedLoaderQuery(\n  $repositoryId: ID!\n  $period: Period!\n) {\n  currentUser {\n    repository(id: $repositoryId) {\n      ...RepositoryPlotsTotalPrsMerged_repository\n      id\n    }\n    id\n  }\n}\n\nfragment RepositoryPlotsTotalPrsMerged_repository on Repository {\n  name\n  totalPrsMerged(period: $period) {\n    traces {\n      name\n      x\n      y\n    }\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '3fe01b2d0585c9804dafe47fcdf5b50f';

module.exports = node;
