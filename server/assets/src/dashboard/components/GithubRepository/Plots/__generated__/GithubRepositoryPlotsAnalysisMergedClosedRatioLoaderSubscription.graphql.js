/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type PlotHero_plotHero$ref = any;
export type GithubRepositoryPlotsAnalysisMergedClosedRatioLoaderSubscriptionVariables = {|
  id: string,
  start: any,
  finish: any,
|};
export type GithubRepositoryPlotsAnalysisMergedClosedRatioLoaderSubscriptionResponse = {|
  +githubRepositoryUpdated: ?{|
    +analysisMergedClosedRatio: ?{|
      +$fragmentRefs: PlotHero_plotHero$ref
    |}
  |}
|};
export type GithubRepositoryPlotsAnalysisMergedClosedRatioLoaderSubscription = {|
  variables: GithubRepositoryPlotsAnalysisMergedClosedRatioLoaderSubscriptionVariables,
  response: GithubRepositoryPlotsAnalysisMergedClosedRatioLoaderSubscriptionResponse,
|};
*/


/*
subscription GithubRepositoryPlotsAnalysisMergedClosedRatioLoaderSubscription(
  $id: ID!
  $start: DateTime!
  $finish: DateTime!
) {
  githubRepositoryUpdated(id: $id) {
    analysisMergedClosedRatio(start: $start, finish: $finish) {
      ...PlotHero_plotHero
    }
    id
  }
}

fragment PlotHero_plotHero on PlotHero {
  byline
  changeDirection
  description
  name
  sentiment
  unitType
  value
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
    "name": "GithubRepositoryPlotsAnalysisMergedClosedRatioLoaderSubscription",
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
            "concreteType": "PlotHero",
            "kind": "LinkedField",
            "name": "analysisMergedClosedRatio",
            "plural": false,
            "selections": [
              {
                "args": null,
                "kind": "FragmentSpread",
                "name": "PlotHero_plotHero"
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
    "name": "GithubRepositoryPlotsAnalysisMergedClosedRatioLoaderSubscription",
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
            "concreteType": "PlotHero",
            "kind": "LinkedField",
            "name": "analysisMergedClosedRatio",
            "plural": false,
            "selections": [
              {
                "alias": null,
                "args": null,
                "kind": "ScalarField",
                "name": "byline",
                "storageKey": null
              },
              {
                "alias": null,
                "args": null,
                "kind": "ScalarField",
                "name": "changeDirection",
                "storageKey": null
              },
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
                "name": "sentiment",
                "storageKey": null
              },
              {
                "alias": null,
                "args": null,
                "kind": "ScalarField",
                "name": "unitType",
                "storageKey": null
              },
              {
                "alias": null,
                "args": null,
                "kind": "ScalarField",
                "name": "value",
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
    "cacheID": "052cc61b15778f992ff662c5dd4258ac",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPlotsAnalysisMergedClosedRatioLoaderSubscription",
    "operationKind": "subscription",
    "text": "subscription GithubRepositoryPlotsAnalysisMergedClosedRatioLoaderSubscription(\n  $id: ID!\n  $start: DateTime!\n  $finish: DateTime!\n) {\n  githubRepositoryUpdated(id: $id) {\n    analysisMergedClosedRatio(start: $start, finish: $finish) {\n      ...PlotHero_plotHero\n    }\n    id\n  }\n}\n\nfragment PlotHero_plotHero on PlotHero {\n  byline\n  changeDirection\n  description\n  name\n  sentiment\n  unitType\n  value\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'b1a71ff6133bacdad99c9b63297d758a';

module.exports = node;
