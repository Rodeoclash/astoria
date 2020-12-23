/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type PlotHero_plotHero$ref = any;
export type Period = "DAY" | "MONTH" | "WEEK" | "YEAR" | "%future added value";
export type GithubRepositoryPlotsAnalysisClosedAgeLoaderQueryVariables = {|
  githubRepositoryId: string,
  period: Period,
  start: any,
  finish: any,
|};
export type GithubRepositoryPlotsAnalysisClosedAgeLoaderQueryResponse = {|
  +currentUser: ?{|
    +githubRepository: {|
      +analysisClosedAge: ?{|
        +$fragmentRefs: PlotHero_plotHero$ref
      |}
    |}
  |}
|};
export type GithubRepositoryPlotsAnalysisClosedAgeLoaderQuery = {|
  variables: GithubRepositoryPlotsAnalysisClosedAgeLoaderQueryVariables,
  response: GithubRepositoryPlotsAnalysisClosedAgeLoaderQueryResponse,
|};
*/


/*
query GithubRepositoryPlotsAnalysisClosedAgeLoaderQuery(
  $githubRepositoryId: ID!
  $period: Period!
  $start: DateTime!
  $finish: DateTime!
) {
  currentUser {
    githubRepository(id: $githubRepositoryId) {
      analysisClosedAge(period: $period, start: $start, finish: $finish) {
        ...PlotHero_plotHero
      }
      id
    }
    id
  }
}

fragment PlotHero_plotHero on PlotHero {
  byline
  changeDirection
  description
  name
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
    "name": "GithubRepositoryPlotsAnalysisClosedAgeLoaderQuery",
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
    "name": "GithubRepositoryPlotsAnalysisClosedAgeLoaderQuery",
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
                    "name": "value",
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
    "cacheID": "4987ae56167c69c12094ca094c12d295",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPlotsAnalysisClosedAgeLoaderQuery",
    "operationKind": "query",
    "text": "query GithubRepositoryPlotsAnalysisClosedAgeLoaderQuery(\n  $githubRepositoryId: ID!\n  $period: Period!\n  $start: DateTime!\n  $finish: DateTime!\n) {\n  currentUser {\n    githubRepository(id: $githubRepositoryId) {\n      analysisClosedAge(period: $period, start: $start, finish: $finish) {\n        ...PlotHero_plotHero\n      }\n      id\n    }\n    id\n  }\n}\n\nfragment PlotHero_plotHero on PlotHero {\n  byline\n  changeDirection\n  description\n  name\n  value\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '8c39dbb4c4d1c710745e30a58a660f09';

module.exports = node;
