/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type FlashShow_flash$ref: FragmentReference;
declare export opaque type FlashShow_flash$fragmentType: FlashShow_flash$ref;
export type FlashShow_flash = {|
  +body: string,
  +createdAt: string,
  +kind: string,
  +secondsVisible: number,
  +$refType: FlashShow_flash$ref,
|};
export type FlashShow_flash$data = FlashShow_flash;
export type FlashShow_flash$key = {
  +$data?: FlashShow_flash$data,
  +$fragmentRefs: FlashShow_flash$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "FlashShow_flash",
  "selections": [
    {
      "kind": "ClientExtension",
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
        }
      ]
    }
  ],
  "type": "Flash",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = 'b58f5c4f7543dccc94366707bc203509';

module.exports = node;
