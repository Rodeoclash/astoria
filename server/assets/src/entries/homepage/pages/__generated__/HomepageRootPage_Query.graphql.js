/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type FlashList_flashes$ref = any;
export type HomepageRootPage_QueryVariables = {||};
export type HomepageRootPage_QueryResponse = {|
  +currentUser: ?{|
    +id: string
  |},
  +flashes: ?$ReadOnlyArray<?{|
    +$fragmentRefs: FlashList_flashes$ref
  |}>,
|};
export type HomepageRootPage_Query = {|
  variables: HomepageRootPage_QueryVariables,
  response: HomepageRootPage_QueryResponse,
|};
*/


/*
query HomepageRootPage_Query {
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
    "name": "HomepageRootPage_Query",
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
    "name": "HomepageRootPage_Query",
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
    "cacheID": "60647515ff801d8fa912c4e30049f42a",
    "id": null,
    "metadata": {},
    "name": "HomepageRootPage_Query",
    "operationKind": "query",
    "text": "query HomepageRootPage_Query {\n  currentUser {\n    id\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '5cddb99a63444b94dcb372e8047a299b';

module.exports = node;
