/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
export type HomepageAuthenticationPage_QueryVariables = {||};
export type HomepageAuthenticationPage_QueryResponse = {|
  +currentUser: ?{|
    +name: string
  |}
|};
export type HomepageAuthenticationPage_Query = {|
  variables: HomepageAuthenticationPage_QueryVariables,
  response: HomepageAuthenticationPage_QueryResponse,
|};
*/


/*
query HomepageAuthenticationPage_Query {
  currentUser {
    name
    id
  }
}
*/

const node/*: ConcreteRequest*/ = (function(){
var v0 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "name",
  "storageKey": null
};
return {
  "fragment": {
    "argumentDefinitions": [],
    "kind": "Fragment",
    "metadata": null,
    "name": "HomepageAuthenticationPage_Query",
    "selections": [
      {
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
      }
    ],
    "type": "RootQueryType",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": [],
    "kind": "Operation",
    "name": "HomepageAuthenticationPage_Query",
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "CurrentUser",
        "kind": "LinkedField",
        "name": "currentUser",
        "plural": false,
        "selections": [
          (v0/*: any*/),
          {
            "alias": null,
            "args": null,
            "kind": "ScalarField",
            "name": "id",
            "storageKey": null
          }
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "313897911cdbc5a412fd3f85556aa1c7",
    "id": null,
    "metadata": {},
    "name": "HomepageAuthenticationPage_Query",
    "operationKind": "query",
    "text": "query HomepageAuthenticationPage_Query {\n  currentUser {\n    name\n    id\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'e1541810858f74ed5a189f9a5d8f235c';

module.exports = node;
