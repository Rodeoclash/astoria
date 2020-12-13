/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository$ref = any;
export type Period = "DAY" | "MONTH" | "WEEK" | "YEAR" | "%future added value";
export type GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQueryVariables = {|
  githubRepositoryId: string,
  period: Period,
  start: any,
  finish: any,
|};
export type GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQueryResponse = {|
  +currentUser: ?{|
    +githubRepository: {|
      +$fragmentRefs: GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository$ref
    |}
  |}
|};
export type GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQuery = {|
  variables: GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQueryVariables,
  response: GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQueryResponse,
|};
*/


/*
query GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQuery(
  $githubRepositoryId: ID!
  $period: Period!
  $start: DateTime!
  $finish: DateTime!
) {
  currentUser {
    githubRepository(id: $githubRepositoryId) {
      ...GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository
      id
    }
    id
  }
}

fragment GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository on GithubRepository {
  analysisMonthlyTotalChange(period: $period, start: $start, finish: $finish) {
    ...PlotChangeShow_plotChange
  }
}

fragment PlotChangeShow_plotChange on PlotChange {
  traces {
    change
    datetime
    total
  }
}
*/

const node/*: ConcreteRequest*/ = (function(){
var v0 = {
  "defaultValue": null,
  "kind": "LocalArgument",
  "name": "finish"
},
v1 = {
  "defaultValue": null,
  "kind": "LocalArgument",
  "name": "githubRepositoryId"
},
v2 = {
  "defaultValue": null,
  "kind": "LocalArgument",
  "name": "period"
},
v3 = {
  "defaultValue": null,
  "kind": "LocalArgument",
  "name": "start"
},
v4 = [
  {
    "kind": "Variable",
    "name": "id",
    "variableName": "githubRepositoryId"
  }
],
v5 = {
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
      (v1/*: any*/),
      (v2/*: any*/),
      (v3/*: any*/)
    ],
    "kind": "Fragment",
    "metadata": null,
    "name": "GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQuery",
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
            "args": (v4/*: any*/),
            "concreteType": "GithubRepository",
            "kind": "LinkedField",
            "name": "githubRepository",
            "plural": false,
            "selections": [
              {
                "args": null,
                "kind": "FragmentSpread",
                "name": "GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository"
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
      (v2/*: any*/),
      (v3/*: any*/),
      (v0/*: any*/)
    ],
    "kind": "Operation",
    "name": "GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQuery",
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
            "args": (v4/*: any*/),
            "concreteType": "GithubRepository",
            "kind": "LinkedField",
            "name": "githubRepository",
            "plural": false,
            "selections": [
              {
                "alias": null,
                "args": [
                  {
                    "kind": "Variable",
                    "name": "finish",
                    "variableName": "finish"
                  },
                  {
                    "kind": "Variable",
                    "name": "period",
                    "variableName": "period"
                  },
                  {
                    "kind": "Variable",
                    "name": "start",
                    "variableName": "start"
                  }
                ],
                "concreteType": "PlotChange",
                "kind": "LinkedField",
                "name": "analysisMonthlyTotalChange",
                "plural": false,
                "selections": [
                  {
                    "alias": null,
                    "args": null,
                    "concreteType": "ChartTraceChange",
                    "kind": "LinkedField",
                    "name": "traces",
                    "plural": true,
                    "selections": [
                      {
                        "alias": null,
                        "args": null,
                        "kind": "ScalarField",
                        "name": "change",
                        "storageKey": null
                      },
                      {
                        "alias": null,
                        "args": null,
                        "kind": "ScalarField",
                        "name": "datetime",
                        "storageKey": null
                      },
                      {
                        "alias": null,
                        "args": null,
                        "kind": "ScalarField",
                        "name": "total",
                        "storageKey": null
                      }
                    ],
                    "storageKey": null
                  }
                ],
                "storageKey": null
              },
              (v5/*: any*/)
            ],
            "storageKey": null
          },
          (v5/*: any*/)
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "40e88549738dd4dc27000bc205772513",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQuery",
    "operationKind": "query",
    "text": "query GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQuery(\n  $githubRepositoryId: ID!\n  $period: Period!\n  $start: DateTime!\n  $finish: DateTime!\n) {\n  currentUser {\n    githubRepository(id: $githubRepositoryId) {\n      ...GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository\n      id\n    }\n    id\n  }\n}\n\nfragment GithubRepositoryPlotsAnalysisMonthlyTotalChange_githubRepository on GithubRepository {\n  analysisMonthlyTotalChange(period: $period, start: $start, finish: $finish) {\n    ...PlotChangeShow_plotChange\n  }\n}\n\nfragment PlotChangeShow_plotChange on PlotChange {\n  traces {\n    change\n    datetime\n    total\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '3ab4cfdd530a234953ec53a7dfc16e65';

module.exports = node;
