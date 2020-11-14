/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type RepositoryPlotsMergedPrsPerPerson_repository$ref = any;
export type Period = "DAY" | "MONTH" | "WEEK" | "YEAR" | "%future added value";
export type RepositoryPlotsMergedPrsPerPersonLoaderQueryVariables = {|
  repositoryId: string,
  period: Period,
|};
export type RepositoryPlotsMergedPrsPerPersonLoaderQueryResponse = {|
  +currentUser: ?{|
    +repository: {|
      +$fragmentRefs: RepositoryPlotsMergedPrsPerPerson_repository$ref
    |}
  |}
|};
export type RepositoryPlotsMergedPrsPerPersonLoaderQuery = {|
  variables: RepositoryPlotsMergedPrsPerPersonLoaderQueryVariables,
  response: RepositoryPlotsMergedPrsPerPersonLoaderQueryResponse,
|};
*/


/*
query RepositoryPlotsMergedPrsPerPersonLoaderQuery(
  $repositoryId: ID!
  $period: Period!
) {
  currentUser {
    repository(id: $repositoryId) {
      ...RepositoryPlotsMergedPrsPerPerson_repository
      id
    }
    id
  }
}

fragment RepositoryPlotsMergedPrsPerPerson_repository on Repository {
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
var v0 = {
  "defaultValue": null,
  "kind": "LocalArgument",
  "name": "period"
},
v1 = {
  "defaultValue": null,
  "kind": "LocalArgument",
  "name": "repositoryId"
},
v2 = [
  {
    "kind": "Variable",
    "name": "id",
    "variableName": "repositoryId"
  }
],
v3 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "name",
  "storageKey": null
},
v4 = {
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
      (v1/*: any*/)
    ],
    "kind": "Fragment",
    "metadata": null,
    "name": "RepositoryPlotsMergedPrsPerPersonLoaderQuery",
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
            "args": (v2/*: any*/),
            "concreteType": "Repository",
            "kind": "LinkedField",
            "name": "repository",
            "plural": false,
            "selections": [
              {
                "args": null,
                "kind": "FragmentSpread",
                "name": "RepositoryPlotsMergedPrsPerPerson_repository"
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
      (v0/*: any*/)
    ],
    "kind": "Operation",
    "name": "RepositoryPlotsMergedPrsPerPersonLoaderQuery",
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
            "args": (v2/*: any*/),
            "concreteType": "Repository",
            "kind": "LinkedField",
            "name": "repository",
            "plural": false,
            "selections": [
              (v3/*: any*/),
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
                      (v3/*: any*/),
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
              (v4/*: any*/)
            ],
            "storageKey": null
          },
          (v4/*: any*/)
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "a8f27f94385b2e5fc0b4102e12cf4e57",
    "id": null,
    "metadata": {},
    "name": "RepositoryPlotsMergedPrsPerPersonLoaderQuery",
    "operationKind": "query",
    "text": "query RepositoryPlotsMergedPrsPerPersonLoaderQuery(\n  $repositoryId: ID!\n  $period: Period!\n) {\n  currentUser {\n    repository(id: $repositoryId) {\n      ...RepositoryPlotsMergedPrsPerPerson_repository\n      id\n    }\n    id\n  }\n}\n\nfragment RepositoryPlotsMergedPrsPerPerson_repository on Repository {\n  name\n  mergedPrsPerPerson(period: $period) {\n    traces {\n      name\n      x\n      y\n    }\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '284a077ef9ce8acc2b74390cc73afc44';

module.exports = node;
