/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type PlotHero_plotHero$ref = any;
export type GithubRepositoryPlotsAnalysisOpenedTotalLoaderQueryVariables = {|
  id: string,
  start: any,
  finish: any,
|};
export type GithubRepositoryPlotsAnalysisOpenedTotalLoaderQueryResponse = {|
  +currentUser: ?{|
    +githubRepository: {|
      +analysisOpenedTotal: ?{|
        +$fragmentRefs: PlotHero_plotHero$ref
      |}
    |}
  |}
|};
export type GithubRepositoryPlotsAnalysisOpenedTotalLoaderQuery = {|
  variables: GithubRepositoryPlotsAnalysisOpenedTotalLoaderQueryVariables,
  response: GithubRepositoryPlotsAnalysisOpenedTotalLoaderQueryResponse,
|};
*/


/*
query GithubRepositoryPlotsAnalysisOpenedTotalLoaderQuery(
  $id: ID!
  $start: DateTime!
  $finish: DateTime!
) {
  currentUser {
    githubRepository(id: $id) {
      analysisOpenedTotal(start: $start, finish: $finish) {
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
    "name": "GithubRepositoryPlotsAnalysisOpenedTotalLoaderQuery",
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
                "concreteType": "PlotHero",
                "kind": "LinkedField",
                "name": "analysisOpenedTotal",
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
      (v0/*: any*/)
    ],
    "kind": "Operation",
    "name": "GithubRepositoryPlotsAnalysisOpenedTotalLoaderQuery",
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
                "concreteType": "PlotHero",
                "kind": "LinkedField",
                "name": "analysisOpenedTotal",
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
    "cacheID": "77d3906fc8f4b1b7ebf0e03f897a0e67",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPlotsAnalysisOpenedTotalLoaderQuery",
    "operationKind": "query",
    "text": "query GithubRepositoryPlotsAnalysisOpenedTotalLoaderQuery(\n  $id: ID!\n  $start: DateTime!\n  $finish: DateTime!\n) {\n  currentUser {\n    githubRepository(id: $id) {\n      analysisOpenedTotal(start: $start, finish: $finish) {\n        ...PlotHero_plotHero\n      }\n      id\n    }\n    id\n  }\n}\n\nfragment PlotHero_plotHero on PlotHero {\n  byline\n  changeDirection\n  description\n  name\n  sentiment\n  unitType\n  value\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'ece4775801c5b2bdf69cfa601f22b688';

module.exports = node;
