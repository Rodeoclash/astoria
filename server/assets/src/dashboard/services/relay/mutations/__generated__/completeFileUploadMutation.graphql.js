/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
export type completeFileUploadMutationVariables = {|
  fileUploadId: string
|};
export type completeFileUploadMutationResponse = {|
  +completeFileUpload: ?{|
    +currentUser: {|
      +email: string
    |}
  |}
|};
export type completeFileUploadMutation = {|
  variables: completeFileUploadMutationVariables,
  response: completeFileUploadMutationResponse,
|};
*/


/*
mutation completeFileUploadMutation(
  $fileUploadId: ID!
) {
  completeFileUpload(fileUploadId: $fileUploadId) {
    currentUser {
      email
      id
    }
  }
}
*/

const node/*: ConcreteRequest*/ = (function(){
var v0 = [
  {
    "defaultValue": null,
    "kind": "LocalArgument",
    "name": "fileUploadId"
  }
],
v1 = [
  {
    "kind": "Variable",
    "name": "fileUploadId",
    "variableName": "fileUploadId"
  }
],
v2 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "email",
  "storageKey": null
};
return {
  "fragment": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Fragment",
    "metadata": null,
    "name": "completeFileUploadMutation",
    "selections": [
      {
        "alias": null,
        "args": (v1/*: any*/),
        "concreteType": "CompleteFileUploadPayload",
        "kind": "LinkedField",
        "name": "completeFileUpload",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": null,
            "concreteType": "CurrentUser",
            "kind": "LinkedField",
            "name": "currentUser",
            "plural": false,
            "selections": [
              (v2/*: any*/)
            ],
            "storageKey": null
          }
        ],
        "storageKey": null
      }
    ],
    "type": "RootMutationType",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Operation",
    "name": "completeFileUploadMutation",
    "selections": [
      {
        "alias": null,
        "args": (v1/*: any*/),
        "concreteType": "CompleteFileUploadPayload",
        "kind": "LinkedField",
        "name": "completeFileUpload",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": null,
            "concreteType": "CurrentUser",
            "kind": "LinkedField",
            "name": "currentUser",
            "plural": false,
            "selections": [
              (v2/*: any*/),
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
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "cae1ec8601487823dbf68619c504c27f",
    "id": null,
    "metadata": {},
    "name": "completeFileUploadMutation",
    "operationKind": "mutation",
    "text": "mutation completeFileUploadMutation(\n  $fileUploadId: ID!\n) {\n  completeFileUpload(fileUploadId: $fileUploadId) {\n    currentUser {\n      email\n      id\n    }\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = 'b142ef8b434af24a19507e4913385cc9';

module.exports = node;
