/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type GithubRepositoryName_githubRepository$ref = any;
export type GithubRepositoryPage_QueryVariables = {|
  githubRepositoryId: string
|};
export type GithubRepositoryPage_QueryResponse = {|
  +currentUser: ?{|
    +githubRepository: {|
      +$fragmentRefs: GithubRepositoryName_githubRepository$ref
    |}
  |}
|};
export type GithubRepositoryPage_Query = {|
  variables: GithubRepositoryPage_QueryVariables,
  response: GithubRepositoryPage_QueryResponse,
|};
*/


/*
query GithubRepositoryPage_Query(
  $githubRepositoryId: ID!
) {
  currentUser {
    githubRepository(id: $githubRepositoryId) {
      ...GithubRepositoryName_githubRepository
      id
    }
    id
  }
}

fragment GithubRepositoryName_githubRepository on GithubRepository {
  name
  githubInstallation {
    name
    id
  }
}
*/

const node/*: ConcreteRequest*/ = (function(){
var v0 = [
  {
    "defaultValue": null,
    "kind": "LocalArgument",
    "name": "githubRepositoryId"
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
    "name": "GithubRepositoryPage_Query",
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
                "name": "GithubRepositoryName_githubRepository"
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
    "name": "GithubRepositoryPage_Query",
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
                "args": null,
                "concreteType": "GithubInstallation",
                "kind": "LinkedField",
                "name": "githubInstallation",
                "plural": false,
                "selections": [
                  (v2/*: any*/),
                  (v3/*: any*/)
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
    "cacheID": "59e31bc0f1475274b4a7e0e31be350c4",
    "id": null,
    "metadata": {},
    "name": "GithubRepositoryPage_Query",
    "operationKind": "query",
    "text": "query GithubRepositoryPage_Query(\n  $githubRepositoryId: ID!\n) {\n  currentUser {\n    githubRepository(id: $githubRepositoryId) {\n      ...GithubRepositoryName_githubRepository\n      id\n    }\n    id\n  }\n}\n\nfragment GithubRepositoryName_githubRepository on GithubRepository {\n  name\n  githubInstallation {\n    name\n    id\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'd1fc204818b6c8832ed898616291a5e2';

module.exports = node;
