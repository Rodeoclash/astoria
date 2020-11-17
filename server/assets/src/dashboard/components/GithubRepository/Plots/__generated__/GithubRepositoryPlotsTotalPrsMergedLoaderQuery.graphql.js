/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type GithubRepositoryPlotsTotalPrsMerged_githubRepository$ref = any;
export type Period = "DAY" | "MONTH" | "WEEK" | "YEAR" | "%future added value";
export type GithubRepositoryPlotsTotalPrsMergedLoaderQueryVariables = {|
  githubRepositoryId: string,
  period: Period,
|};
export type GithubRepositoryPlotsTotalPrsMergedLoaderQueryResponse = {|
  +currentUser: ?{|
    +githubRepository: {|
      +$fragmentRefs: GithubRepositoryPlotsTotalPrsMerged_githubRepository$ref
    |}
  |}
|};
export type GithubRepositoryPlotsTotalPrsMergedLoaderQuery = {|
  variables: GithubRepositoryPlotsTotalPrsMergedLoaderQueryVariables,
  response: GithubRepositoryPlotsTotalPrsMergedLoaderQueryResponse,
|};
*/


/*
query GithubRepositoryPlotsTotalPrsMergedLoaderQuery(
  $githubRepositoryId: ID!
  $period: Period!
) {
  currentUser {
    githubRepository(id: $githubRepositoryId) {
      ...GithubRepositoryPlotsTotalPrsMerged_githubRepository
      id
    }
    id
  }
}

fragment GithubRepositoryPlotsTotalPrsMerged_githubRepository on GithubRepository {
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
var v0 = [
  {
    "defaultValue": null,
    "kind": "LocalArgument",
    "name": "githubRepositoryId"
  },
  {
    "defaultValue": null,
    "kind": "LocalArgument",
    "name": "period"
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
    "name": "GithubRepositoryPlotsTotalPrsMergedLoaderQuery",
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
                "name": "GithubRepositoryPlotsTotalPrsMerged_githubRepository"
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
    "name": "GithubRepositoryPlotsTotalPrsMergedLoaderQuery",
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
                      (v2/*: any*/),
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
    "cacheID": "bc20ef8ab24457a0e089264eb28cd5b7",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPlotsTotalPrsMergedLoaderQuery",
    "operationKind": "query",
    "text": "query GithubRepositoryPlotsTotalPrsMergedLoaderQuery(\n  $githubRepositoryId: ID!\n  $period: Period!\n) {\n  currentUser {\n    githubRepository(id: $githubRepositoryId) {\n      ...GithubRepositoryPlotsTotalPrsMerged_githubRepository\n      id\n    }\n    id\n  }\n}\n\nfragment GithubRepositoryPlotsTotalPrsMerged_githubRepository on GithubRepository {\n  name\n  totalPrsMerged(period: $period) {\n    traces {\n      name\n      x\n      y\n    }\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'b479cae7d582a325dbde2c24322ae834';

module.exports = node;
