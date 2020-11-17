/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type GithubRepositoryPlotsMergedPrsPerPerson_githubRepository$ref = any;
export type Period = "DAY" | "MONTH" | "WEEK" | "YEAR" | "%future added value";
export type GithubRepositoryPlotsMergedPrsPerPersonLoaderQueryVariables = {|
  githubRepositoryId: string,
  period: Period,
|};
export type GithubRepositoryPlotsMergedPrsPerPersonLoaderQueryResponse = {|
  +currentUser: ?{|
    +githubRepository: {|
      +$fragmentRefs: GithubRepositoryPlotsMergedPrsPerPerson_githubRepository$ref
    |}
  |}
|};
export type GithubRepositoryPlotsMergedPrsPerPersonLoaderQuery = {|
  variables: GithubRepositoryPlotsMergedPrsPerPersonLoaderQueryVariables,
  response: GithubRepositoryPlotsMergedPrsPerPersonLoaderQueryResponse,
|};
*/


/*
query GithubRepositoryPlotsMergedPrsPerPersonLoaderQuery(
  $githubRepositoryId: ID!
  $period: Period!
) {
  currentUser {
    githubRepository(id: $githubRepositoryId) {
      ...GithubRepositoryPlotsMergedPrsPerPerson_githubRepository
      id
    }
    id
  }
}

fragment GithubRepositoryPlotsMergedPrsPerPerson_githubRepository on GithubRepository {
  name
  mergedPrsPerPerson(period: $period) {
    traces {
      name
      x
      y
    }
  }
}
*/

const node/*: ConcreteRequest*/ = (function(){
var v0 = [
  {
    "defaultValue": null,
    "kind": "LocalArgument",
    "name": "githubRepositoryId"
  },
  {
    "defaultValue": null,
    "kind": "LocalArgument",
    "name": "period"
  }
],
v1 = [
  {
    "kind": "Variable",
    "name": "id",
    "variableName": "githubRepositoryId"
  }
],
v2 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "name",
  "storageKey": null
},
v3 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "id",
  "storageKey": null
};
return {
  "fragment": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Fragment",
    "metadata": null,
    "name": "GithubRepositoryPlotsMergedPrsPerPersonLoaderQuery",
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
            "args": (v1/*: any*/),
            "concreteType": "GithubRepository",
            "kind": "LinkedField",
            "name": "githubRepository",
            "plural": false,
            "selections": [
              {
                "args": null,
                "kind": "FragmentSpread",
                "name": "GithubRepositoryPlotsMergedPrsPerPerson_githubRepository"
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
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Operation",
    "name": "GithubRepositoryPlotsMergedPrsPerPersonLoaderQuery",
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
            "args": (v1/*: any*/),
            "concreteType": "GithubRepository",
            "kind": "LinkedField",
            "name": "githubRepository",
            "plural": false,
            "selections": [
              (v2/*: any*/),
              {
                "alias": null,
                "args": [
                  {
                    "kind": "Variable",
                    "name": "period",
                    "variableName": "period"
                  }
                ],
                "concreteType": "PlotDataMergedPr",
                "kind": "LinkedField",
                "name": "mergedPrsPerPerson",
                "plural": false,
                "selections": [
                  {
                    "alias": null,
                    "args": null,
                    "concreteType": "PlotDataMergedPrTrace",
                    "kind": "LinkedField",
                    "name": "traces",
                    "plural": true,
                    "selections": [
                      (v2/*: any*/),
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
              (v3/*: any*/)
            ],
            "storageKey": null
          },
          (v3/*: any*/)
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "d53b6eae415c2bb010e18836ec1ee64c",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPlotsMergedPrsPerPersonLoaderQuery",
    "operationKind": "query",
    "text": "query GithubRepositoryPlotsMergedPrsPerPersonLoaderQuery(\n  $githubRepositoryId: ID!\n  $period: Period!\n) {\n  currentUser {\n    githubRepository(id: $githubRepositoryId) {\n      ...GithubRepositoryPlotsMergedPrsPerPerson_githubRepository\n      id\n    }\n    id\n  }\n}\n\nfragment GithubRepositoryPlotsMergedPrsPerPerson_githubRepository on GithubRepository {\n  name\n  mergedPrsPerPerson(period: $period) {\n    traces {\n      name\n      x\n      y\n    }\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'ee3b9568599e50488d7608440221fb09';

module.exports = node;
