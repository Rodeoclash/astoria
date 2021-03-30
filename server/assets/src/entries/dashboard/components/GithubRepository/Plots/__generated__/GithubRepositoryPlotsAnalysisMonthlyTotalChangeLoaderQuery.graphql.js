/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type PlotChart_plotChart$ref = any;
export type GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQueryVariables = {|
  id: string,
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
  $id: ID!
  $start: DateTime!
  $finish: DateTime!
) {
  currentUser {
    githubRepository(id: $id) {
      analysisMonthlyTotalChange(start: $start, finish: $finish) {
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
      (v2/*: any*/)
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
            "args": (v3/*: any*/),
            "concreteType": "GithubRepository",
            "kind": "LinkedField",
            "name": "githubRepository",
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
            "args": (v3/*: any*/),
            "concreteType": "GithubRepository",
            "kind": "LinkedField",
            "name": "githubRepository",
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
    "cacheID": "30e3d02181cabc94d1010eafdfb5b562",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQuery",
    "operationKind": "query",
    "text": "query GithubRepositoryPlotsAnalysisMonthlyTotalChangeLoaderQuery(\n  $id: ID!\n  $start: DateTime!\n  $finish: DateTime!\n) {\n  currentUser {\n    githubRepository(id: $id) {\n      analysisMonthlyTotalChange(start: $start, finish: $finish) {\n        ...PlotChart_plotChart\n      }\n      id\n    }\n    id\n  }\n}\n\nfragment PlotChart_plotChart on PlotChart {\n  description\n  name\n  traces\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '1a21c416cda097b3fd7d90dbe65720d7';

module.exports = node;
