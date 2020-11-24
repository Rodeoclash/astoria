/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository$ref = any;
export type Period = "DAY" | "MONTH" | "WEEK" | "YEAR" | "%future added value";
export type GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoaderQueryVariables = {|
  githubRepositoryId: string,
  period: Period,
  start: any,
  finish: any,
|};
export type GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoaderQueryResponse = {|
  +currentUser: ?{|
    +githubRepository: {|
      +$fragmentRefs: GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository$ref
    |}
  |}
|};
export type GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoaderQuery = {|
  variables: GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoaderQueryVariables,
  response: GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoaderQueryResponse,
|};
*/


/*
query GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoaderQuery(
  $githubRepositoryId: ID!
  $period: Period!
  $start: DateTime!
  $finish: DateTime!
) {
  currentUser {
    githubRepository(id: $githubRepositoryId) {
      ...GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository
      id
    }
    id
  }
}

fragment GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository on GithubRepository {
  averageDaysPrOpenBeforeMerge(period: $period, start: $start, finish: $finish) {
    ...PlotDateFloatShow_plotDateFloat
  }
}

fragment PlotDateFloatShow_plotDateFloat on PlotDateFloat {
  traces {
    name
    x
    y
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
    "name": "GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoaderQuery",
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
                "name": "GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository"
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
    "name": "GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoaderQuery",
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
                "concreteType": "PlotDateFloat",
                "kind": "LinkedField",
                "name": "averageDaysPrOpenBeforeMerge",
                "plural": false,
                "selections": [
                  {
                    "alias": null,
                    "args": null,
                    "concreteType": "ChartTraceDateFloat",
                    "kind": "LinkedField",
                    "name": "traces",
                    "plural": true,
                    "selections": [
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
                        "name": "x",
                        "storageKey": null
                      },
                      {
                        "alias": null,
                        "args": null,
                        "kind": "ScalarField",
                        "name": "y",
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
    "cacheID": "1ee46a22b2cdd6e718a433dd3792e8b5",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoaderQuery",
    "operationKind": "query",
    "text": "query GithubRepositoryPlotsAverageDaysPerOpenBeforeMergeLoaderQuery(\n  $githubRepositoryId: ID!\n  $period: Period!\n  $start: DateTime!\n  $finish: DateTime!\n) {\n  currentUser {\n    githubRepository(id: $githubRepositoryId) {\n      ...GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository\n      id\n    }\n    id\n  }\n}\n\nfragment GithubRepositoryPlotsAverageDaysPerOpenBeforeMerge_githubRepository on GithubRepository {\n  averageDaysPrOpenBeforeMerge(period: $period, start: $start, finish: $finish) {\n    ...PlotDateFloatShow_plotDateFloat\n  }\n}\n\nfragment PlotDateFloatShow_plotDateFloat on PlotDateFloat {\n  traces {\n    name\n    x\n    y\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'a3cafef314c58e0b003ecf5450e6c2dc';

module.exports = node;
