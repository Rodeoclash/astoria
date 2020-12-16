/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type GithubRepositoryPlotsAnalysisLast30Total_githubRepository$ref = any;
export type Period = "DAY" | "MONTH" | "WEEK" | "YEAR" | "%future added value";
export type GithubRepositoryPlotsAnalysisLast30TotalLoaderQueryVariables = {|
  githubRepositoryId: string,
  period: Period,
  start: any,
  finish: any,
|};
export type GithubRepositoryPlotsAnalysisLast30TotalLoaderQueryResponse = {|
  +currentUser: ?{|
    +githubRepository: {|
      +$fragmentRefs: GithubRepositoryPlotsAnalysisLast30Total_githubRepository$ref
    |}
  |}
|};
export type GithubRepositoryPlotsAnalysisLast30TotalLoaderQuery = {|
  variables: GithubRepositoryPlotsAnalysisLast30TotalLoaderQueryVariables,
  response: GithubRepositoryPlotsAnalysisLast30TotalLoaderQueryResponse,
|};
*/


/*
query GithubRepositoryPlotsAnalysisLast30TotalLoaderQuery(
  $githubRepositoryId: ID!
  $period: Period!
  $start: DateTime!
  $finish: DateTime!
) {
  currentUser {
    githubRepository(id: $githubRepositoryId) {
      ...GithubRepositoryPlotsAnalysisLast30Total_githubRepository
      id
    }
    id
  }
}

fragment GithubRepositoryPlotsAnalysisLast30Total_githubRepository on GithubRepository {
  analysisLast30Total(period: $period, start: $start, finish: $finish) {
    ...PlotChangeShow_plotChange
  }
}

fragment PlotChangeShow_plotChange on PlotChange {
  trace {
    change
    currentTotal
    previousTotal
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
    "name": "GithubRepositoryPlotsAnalysisLast30TotalLoaderQuery",
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
                "name": "GithubRepositoryPlotsAnalysisLast30Total_githubRepository"
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
    "name": "GithubRepositoryPlotsAnalysisLast30TotalLoaderQuery",
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
                "name": "analysisLast30Total",
                "plural": false,
                "selections": [
                  {
                    "alias": null,
                    "args": null,
                    "concreteType": "ChartTraceChange",
                    "kind": "LinkedField",
                    "name": "trace",
                    "plural": false,
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
                        "name": "currentTotal",
                        "storageKey": null
                      },
                      {
                        "alias": null,
                        "args": null,
                        "kind": "ScalarField",
                        "name": "previousTotal",
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
    "cacheID": "6a6a02ecb1225da803ea33ce32b225ef",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPlotsAnalysisLast30TotalLoaderQuery",
    "operationKind": "query",
    "text": "query GithubRepositoryPlotsAnalysisLast30TotalLoaderQuery(\n  $githubRepositoryId: ID!\n  $period: Period!\n  $start: DateTime!\n  $finish: DateTime!\n) {\n  currentUser {\n    githubRepository(id: $githubRepositoryId) {\n      ...GithubRepositoryPlotsAnalysisLast30Total_githubRepository\n      id\n    }\n    id\n  }\n}\n\nfragment GithubRepositoryPlotsAnalysisLast30Total_githubRepository on GithubRepository {\n  analysisLast30Total(period: $period, start: $start, finish: $finish) {\n    ...PlotChangeShow_plotChange\n  }\n}\n\nfragment PlotChangeShow_plotChange on PlotChange {\n  trace {\n    change\n    currentTotal\n    previousTotal\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'b0a506c27b55e37aeac5a0e1ca225a34';

module.exports = node;
