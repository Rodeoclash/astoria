/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type PlotChart_plotChart$ref = any;
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
      +analysisMonthlyTotalChange: {|
        +$fragmentRefs: PlotChart_plotChart$ref
      |}
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
      analysisMonthlyTotalChange(period: $period, start: $start, finish: $finish) {
        ...PlotChart_plotChart
      }
      id
    }
    id
  }
}

fragment PlotChart_plotChart on PlotChart {
  description
  name
  traces
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
v5 = [
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
v6 = {
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
                "alias": null,
                "args": (v5/*: any*/),
                "concreteType": "PlotChart",
                "kind": "LinkedField",
                "name": "analysisMonthlyTotalChange",
                "plural": false,
                "selections": [
                  {
                    "args": null,
                    "kind": "FragmentSpread",
                    "name": "PlotChart_plotChart"
                  }
                ],
                "storageKey": null
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
                "args": (v5/*: any*/),
                "concreteType": "PlotChart",
                "kind": "LinkedField",
                "name": "analysisMonthlyTotalChange",
                "plural": false,
                "selections": [
                  {
                    "alias": null,
                    "args": null,
                    "kind": "ScalarField",
                    "name": "description",
                    "storageKey": null
                  },
                  {
                    "alias": null,
                    "args": null,
                    "kind": "ScalarField",
                    "name": "name",
                    "storageKey": null
                  },
                  {
                    "alias": null,
                    "args": null,
                    "kind": "ScalarField",
                    "name": "traces",
                    "storageKey": null
                  }
                ],
                "storageKey": null
              },
              (v6/*: any*/)
            ],
            "storageKey": null
          },
          (v6/*: any*/)
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "1bb96ca36fb547e1c9a5d612829299ae",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQuery",
    "operationKind": "query",
    "text": "query GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQuery(\n  $githubRepositoryId: ID!\n  $period: Period!\n  $start: DateTime!\n  $finish: DateTime!\n) {\n  currentUser {\n    githubRepository(id: $githubRepositoryId) {\n      analysisMonthlyTotalChange(period: $period, start: $start, finish: $finish) {\n        ...PlotChart_plotChart\n      }\n      id\n    }\n    id\n  }\n}\n\nfragment PlotChart_plotChart on PlotChart {\n  description\n  name\n  traces\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '7816005eb22be2e8aabb8c39953f41bb';

module.exports = node;
