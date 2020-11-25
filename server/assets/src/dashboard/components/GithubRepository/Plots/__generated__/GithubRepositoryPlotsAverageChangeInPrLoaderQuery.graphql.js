/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type GithubRepositoryPlotsAverageChangeInPr_githubRepository$ref = any;
export type Period = "DAY" | "MONTH" | "WEEK" | "YEAR" | "%future added value";
export type GithubRepositoryPlotsAverageChangeInPrLoaderQueryVariables = {|
  githubRepositoryId: string,
  period: Period,
  start: any,
  finish: any,
|};
export type GithubRepositoryPlotsAverageChangeInPrLoaderQueryResponse = {|
  +currentUser: ?{|
    +githubRepository: {|
      +$fragmentRefs: GithubRepositoryPlotsAverageChangeInPr_githubRepository$ref
    |}
  |}
|};
export type GithubRepositoryPlotsAverageChangeInPrLoaderQuery = {|
  variables: GithubRepositoryPlotsAverageChangeInPrLoaderQueryVariables,
  response: GithubRepositoryPlotsAverageChangeInPrLoaderQueryResponse,
|};
*/


/*
query GithubRepositoryPlotsAverageChangeInPrLoaderQuery(
  $githubRepositoryId: ID!
  $period: Period!
  $start: DateTime!
  $finish: DateTime!
) {
  currentUser {
    githubRepository(id: $githubRepositoryId) {
      ...GithubRepositoryPlotsAverageChangeInPr_githubRepository
      id
    }
    id
  }
}

fragment GithubRepositoryPlotsAverageChangeInPr_githubRepository on GithubRepository {
  averageChangeInPr(period: $period, start: $start, finish: $finish) {
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
    "name": "GithubRepositoryPlotsAverageChangeInPrLoaderQuery",
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
                "name": "GithubRepositoryPlotsAverageChangeInPr_githubRepository"
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
    "name": "GithubRepositoryPlotsAverageChangeInPrLoaderQuery",
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
                "name": "averageChangeInPr",
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
    "cacheID": "755340c7d52b3fb09bdfe54eb8d82121",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPlotsAverageChangeInPrLoaderQuery",
    "operationKind": "query",
    "text": "query GithubRepositoryPlotsAverageChangeInPrLoaderQuery(\n  $githubRepositoryId: ID!\n  $period: Period!\n  $start: DateTime!\n  $finish: DateTime!\n) {\n  currentUser {\n    githubRepository(id: $githubRepositoryId) {\n      ...GithubRepositoryPlotsAverageChangeInPr_githubRepository\n      id\n    }\n    id\n  }\n}\n\nfragment GithubRepositoryPlotsAverageChangeInPr_githubRepository on GithubRepository {\n  averageChangeInPr(period: $period, start: $start, finish: $finish) {\n    ...PlotDateFloatShow_plotDateFloat\n  }\n}\n\nfragment PlotDateFloatShow_plotDateFloat on PlotDateFloat {\n  traces {\n    name\n    x\n    y\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '16529c78457ba620f723dd8b0430bad0';

module.exports = node;
