/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
export type createFileUploadMutationVariables = {|
  mimeType: string
|};
export type createFileUploadMutationResponse = {|
  +createFileUpload: ?{|
    +fileUpload: {|
      +id: string,
      +url: string,
    |}
  |}
|};
export type createFileUploadMutation = {|
  variables: createFileUploadMutationVariables,
  response: createFileUploadMutationResponse,
|};
*/


/*
mutation createFileUploadMutation(
  $mimeType: String!
) {
  createFileUpload(mimeType: $mimeType) {
    fileUpload {
      id
      url
    }
  }
}
*/

const node/*: ConcreteRequest*/ = (function(){
var v0 = [
  {
    "defaultValue": null,
    "kind": "LocalArgument",
    "name": "mimeType"
  }
],
v1 = [
  {
    "alias": null,
    "args": [
      {
        "kind": "Variable",
        "name": "mimeType",
        "variableName": "mimeType"
      }
    ],
    "concreteType": "CreateFileUploadPayload",
    "kind": "LinkedField",
    "name": "createFileUpload",
    "plural": false,
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "FileUpload",
        "kind": "LinkedField",
        "name": "fileUpload",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": null,
            "kind": "ScalarField",
            "name": "id",
            "storageKey": null
          },
          {
            "alias": null,
            "args": null,
            "kind": "ScalarField",
            "name": "url",
            "storageKey": null
          }
        ],
        "storageKey": null
      }
    ],
    "storageKey": null
  }
];
return {
  "fragment": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Fragment",
    "metadata": null,
    "name": "createFileUploadMutation",
    "selections": (v1/*: any*/),
    "type": "RootMutationType",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Operation",
    "name": "createFileUploadMutation",
    "selections": (v1/*: any*/)
  },
  "params": {
    "cacheID": "dbd0b3db9c1f752ed6d0b52dadac8112",
    "id": null,
    "metadata": {},
    "name": "createFileUploadMutation",
    "operationKind": "mutation",
    "text": "mutation createFileUploadMutation(\n  $mimeType: String!\n) {\n  createFileUpload(mimeType: $mimeType) {\n    fileUpload {\n      id\n      url\n    }\n  }\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '510618e356405c8493a71a2e1540c6f2';

module.exports = node;
