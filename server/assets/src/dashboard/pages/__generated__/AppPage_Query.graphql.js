/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type FlashList_flashes$ref = any;
export type AppPage_QueryVariables = {||};
export type AppPage_QueryResponse = {|
  +currentUser: ?{|
    +id: string
  |},
  +flashes: ?$ReadOnlyArray<?{|
    +$fragmentRefs: FlashList_flashes$ref
  |}>,
|};
export type AppPage_Query = {|
  variables: AppPage_QueryVariables,
  response: AppPage_QueryResponse,
|};
*/


/*
query AppPage_Query {
  currentUser {
    id
  }
}
*/

const node/*: ConcreteRequest*/ = (function(){
var v0 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "id",
  "storageKey": null
},
v1 = {
  "alias": null,
  "args": null,
  "concreteType": "CurrentUser",
  "kind": "LinkedField",
  "name": "currentUser",
  "plural": false,
  "selections": [
    (v0/*: any*/)
  ],
  "storageKey": null
};
return {
  "fragment": {
    "argumentDefinitions": [],
    "kind": "Fragment",
    "metadata": null,
    "name": "AppPage_Query",
    "selections": [
      (v1/*: any*/),
      {
        "kind": "ClientExtension",
        "selections": [
          {
            "alias": null,
            "args": null,
            "concreteType": "Flash",
            "kind": "LinkedField",
            "name": "flashes",
            "plural": true,
            "selections": [
              {
                "args": null,
                "kind": "FragmentSpread",
                "name": "FlashList_flashes"
              }
            ],
            "storageKey": null
          }
        ]
      }
    ],
    "type": "RootQueryType",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": [],
    "kind": "Operation",
    "name": "AppPage_Query",
    "selections": [
      (v1/*: any*/),
      {
        "kind": "ClientExtension",
        "selections": [
          {
            "alias": null,
            "args": null,
            "concreteType": "Flash",
            "kind": "LinkedField",
            "name": "flashes",
            "plural": true,
            "selections": [
              {
                "alias": null,
                "args": null,
                "kind": "ScalarField",
                "name": "body",
                "storageKey": null
              },
              {
                "alias": null,
                "args": null,
                "kind": "ScalarField",
                "name": "createdAt",
                "storageKey": null
              },
              {
                "alias": null,
                "args": null,
                "kind": "ScalarField",
                "name": "kind",
                "storageKey": null
              },
              {
                "alias": null,
                "args": null,
                "kind": "ScalarField",
                "name": "secondsVisible",
                "storageKey": null
              },
              (v0/*: any*/)
            ],
            "storageKey": null
          }
        ]
      }
    ]
  },
  "params": {
    "cacheID": "ca8e7e4e8ac5faf4b6e16422734924ca",
    "id": null,
    "metadata": {},
    "name": "AppPage_Query",
    "operationKind": "query",
    "text": "query AppPage_Query {\n  currentUser {\n    id\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '6c29c0be34c6448b421328cd6a2c3d4e';

module.exports = node;
