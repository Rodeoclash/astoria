/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type PlotHero_plotHero$ref = any;
export type GithubRepositoryPlotsAnalysisClosedAgeLoaderSubscriptionVariables = {|
  id: string,
  start: any,
  finish: any,
|};
export type GithubRepositoryPlotsAnalysisClosedAgeLoaderSubscriptionResponse = {|
  +githubRepositoryUpdated: ?{|
    +analysisClosedAge: ?{|
      +$fragmentRefs: PlotHero_plotHero$ref
    |}
  |}
|};
export type GithubRepositoryPlotsAnalysisClosedAgeLoaderSubscription = {|
  variables: GithubRepositoryPlotsAnalysisClosedAgeLoaderSubscriptionVariables,
  response: GithubRepositoryPlotsAnalysisClosedAgeLoaderSubscriptionResponse,
|};
*/


/*
subscription GithubRepositoryPlotsAnalysisClosedAgeLoaderSubscription(
  $id: ID!
  $start: DateTime!
  $finish: DateTime!
) {
  githubRepositoryUpdated(id: $id) {
    analysisClosedAge(start: $start, finish: $finish) {
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
    "name": "GithubRepositoryPlotsAnalysisClosedAgeLoaderSubscription",
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
            "name": "analysisClosedAge",
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
    "name": "GithubRepositoryPlotsAnalysisClosedAgeLoaderSubscription",
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
            "name": "analysisClosedAge",
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
    "cacheID": "dcd44c88d9c8e7ed3c832a76fd254fad",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPlotsAnalysisClosedAgeLoaderSubscription",
    "operationKind": "subscription",
    "text": "subscription GithubRepositoryPlotsAnalysisClosedAgeLoaderSubscription(\n  $id: ID!\n  $start: DateTime!\n  $finish: DateTime!\n) {\n  githubRepositoryUpdated(id: $id) {\n    analysisClosedAge(start: $start, finish: $finish) {\n      ...PlotHero_plotHero\n    }\n    id\n  }\n}\n\nfragment PlotHero_plotHero on PlotHero {\n  byline\n  changeDirection\n  description\n  name\n  sentiment\n  unitType\n  value\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '18fdf1cc731322910a6c9784c5a3307d';

module.exports = node;
