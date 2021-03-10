/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type FlashList_flashes$ref = any;
export type DashboardRootPage_QueryVariables = {||};
export type DashboardRootPage_QueryResponse = {|
  +currentUser: ?{|
    +id: string
  |},
  +flashes: ?$ReadOnlyArray<?{|
    +$fragmentRefs: FlashList_flashes$ref
  |}>,
|};
export type DashboardRootPage_Query = {|
  variables: DashboardRootPage_QueryVariables,
  response: DashboardRootPage_QueryResponse,
|};
*/


/*
query DashboardRootPage_Query {
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
    "name": "DashboardRootPage_Query",
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
    "name": "DashboardRootPage_Query",
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
    "cacheID": "5b0d4ddeb0ed41bf74d6bcbdf1f4df23",
    "id": null,
    "metadata": {},
    "name": "DashboardRootPage_Query",
    "operationKind": "query",
    "text": "query DashboardRootPage_Query {\n  currentUser {\n    id\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '5c9e2377a3d0d22f42509beca79bf938';

module.exports = node;
