/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type PlotHero_plotHero$ref = any;
export type GithubRepositoryPlotsAnalysisOpenedAgeLoaderSubscriptionVariables = {|
  id: string,
  start: any,
  finish: any,
|};
export type GithubRepositoryPlotsAnalysisOpenedAgeLoaderSubscriptionResponse = {|
  +githubRepositoryUpdated: ?{|
    +analysisOpenedAge: ?{|
      +$fragmentRefs: PlotHero_plotHero$ref
    |}
  |}
|};
export type GithubRepositoryPlotsAnalysisOpenedAgeLoaderSubscription = {|
  variables: GithubRepositoryPlotsAnalysisOpenedAgeLoaderSubscriptionVariables,
  response: GithubRepositoryPlotsAnalysisOpenedAgeLoaderSubscriptionResponse,
|};
*/


/*
subscription GithubRepositoryPlotsAnalysisOpenedAgeLoaderSubscription(
  $id: ID!
  $start: DateTime!
  $finish: DateTime!
) {
  githubRepositoryUpdated(id: $id) {
    analysisOpenedAge(start: $start, finish: $finish) {
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
    "name": "GithubRepositoryPlotsAnalysisOpenedAgeLoaderSubscription",
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
            "name": "analysisOpenedAge",
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
    "name": "GithubRepositoryPlotsAnalysisOpenedAgeLoaderSubscription",
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
            "name": "analysisOpenedAge",
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
    "cacheID": "c2d3837a09bba7ac2377b0447a3af94f",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPlotsAnalysisOpenedAgeLoaderSubscription",
    "operationKind": "subscription",
    "text": "subscription GithubRepositoryPlotsAnalysisOpenedAgeLoaderSubscription(\n  $id: ID!\n  $start: DateTime!\n  $finish: DateTime!\n) {\n  githubRepositoryUpdated(id: $id) {\n    analysisOpenedAge(start: $start, finish: $finish) {\n      ...PlotHero_plotHero\n    }\n    id\n  }\n}\n\nfragment PlotHero_plotHero on PlotHero {\n  byline\n  changeDirection\n  description\n  name\n  sentiment\n  unitType\n  value\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'e382cc0d78470edf3f1eafe395f6109d';

module.exports = node;
