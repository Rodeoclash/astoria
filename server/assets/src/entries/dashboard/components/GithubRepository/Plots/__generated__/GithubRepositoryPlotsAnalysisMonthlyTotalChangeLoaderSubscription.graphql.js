/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type PlotChart_plotChart$ref = any;
export type GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderSubscriptionVariables = {|
  id: string,
  start: any,
  finish: any,
|};
export type GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderSubscriptionResponse = {|
  +githubRepositoryUpdated: ?{|
    +analysisMonthlyTotalChange: {|
      +$fragmentRefs: PlotChart_plotChart$ref
    |}
  |}
|};
export type GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderSubscription = {|
  variables: GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderSubscriptionVariables,
  response: GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderSubscriptionResponse,
|};
*/


/*
subscription GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderSubscription(
  $id: ID!
  $start: DateTime!
  $finish: DateTime!
) {
  githubRepositoryUpdated(id: $id) {
    analysisMonthlyTotalChange(start: $start, finish: $finish) {
      ...PlotChart_plotChart
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
  "name": "id"
},
v2 = {
  "defaultValue": null,
  "kind": "LocalArgument",
  "name": "start"
},
v3 = [
  {
    "kind": "Variable",
    "name": "id",
    "variableName": "id"
  }
],
v4 = [
  {
    "kind": "Variable",
    "name": "finish",
    "variableName": "finish"
  },
  {
    "kind": "Variable",
    "name": "start",
    "variableName": "start"
  }
];
return {
  "fragment": {
    "argumentDefinitions": [
      (v0/*: any*/),
      (v1/*: any*/),
      (v2/*: any*/)
    ],
    "kind": "Fragment",
    "metadata": null,
    "name": "GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderSubscription",
    "selections": [
      {
        "alias": null,
        "args": (v3/*: any*/),
        "concreteType": "GithubRepository",
        "kind": "LinkedField",
        "name": "githubRepositoryUpdated",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": (v4/*: any*/),
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
    "type": "RootSubscriptionType",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": [
      (v1/*: any*/),
      (v2/*: any*/),
      (v0/*: any*/)
    ],
    "kind": "Operation",
    "name": "GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderSubscription",
    "selections": [
      {
        "alias": null,
        "args": (v3/*: any*/),
        "concreteType": "GithubRepository",
        "kind": "LinkedField",
        "name": "githubRepositoryUpdated",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": (v4/*: any*/),
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
          {
            "alias": null,
            "args": null,
            "kind": "ScalarField",
            "name": "id",
            "storageKey": null
          }
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "f49fd87afd5c7450fde78da693a3cfbd",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderSubscription",
    "operationKind": "subscription",
    "text": "subscription GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderSubscription(\n  $id: ID!\n  $start: DateTime!\n  $finish: DateTime!\n) {\n  githubRepositoryUpdated(id: $id) {\n    analysisMonthlyTotalChange(start: $start, finish: $finish) {\n      ...PlotChart_plotChart\n    }\n    id\n  }\n}\n\nfragment PlotChart_plotChart on PlotChart {\n  description\n  name\n  traces\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'ce479ebd02cb234ffe67f89c5b2e888d';

module.exports = node;
