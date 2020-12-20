/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type PlotChart_plotChart$ref = any;
export type Period = "DAY" | "MONTH" | "WEEK" | "YEAR" | "%future added value";
export type GithubRepositoryPlotsMergedPrsLoaderQueryVariables = {|
  githubRepositoryId: string,
  period: Period,
  start: any,
  finish: any,
|};
export type GithubRepositoryPlotsMergedPrsLoaderQueryResponse = {|
  +currentUser: ?{|
    +githubRepository: {|
      +mergedPrs: {|
        +$fragmentRefs: PlotChart_plotChart$ref
      |}
    |}
  |}
|};
export type GithubRepositoryPlotsMergedPrsLoaderQuery = {|
  variables: GithubRepositoryPlotsMergedPrsLoaderQueryVariables,
  response: GithubRepositoryPlotsMergedPrsLoaderQueryResponse,
|};
*/


/*
query GithubRepositoryPlotsMergedPrsLoaderQuery(
  $githubRepositoryId: ID!
  $period: Period!
  $start: DateTime!
  $finish: DateTime!
) {
  currentUser {
    githubRepository(id: $githubRepositoryId) {
      mergedPrs(period: $period, start: $start, finish: $finish) {
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
    "name": "GithubRepositoryPlotsMergedPrsLoaderQuery",
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
                "name": "mergedPrs",
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
    "name": "GithubRepositoryPlotsMergedPrsLoaderQuery",
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
                "name": "mergedPrs",
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
    "cacheID": "fbdbbfee0a84016817fe2e902d1f7f32",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPlotsMergedPrsLoaderQuery",
    "operationKind": "query",
    "text": "query GithubRepositoryPlotsMergedPrsLoaderQuery(\n  $githubRepositoryId: ID!\n  $period: Period!\n  $start: DateTime!\n  $finish: DateTime!\n) {\n  currentUser {\n    githubRepository(id: $githubRepositoryId) {\n      mergedPrs(period: $period, start: $start, finish: $finish) {\n        ...PlotChart_plotChart\n      }\n      id\n    }\n    id\n  }\n}\n\nfragment PlotChart_plotChart on PlotChart {\n  description\n  name\n  traces\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'ccae4518c9b3b0178e18f1380adaba23';

module.exports = node;
