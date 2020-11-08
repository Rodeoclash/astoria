/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
type FlashShow_flash$ref = any;
import type { FragmentReference } from "relay-runtime";
declare export opaque type FlashList_flashes$ref: FragmentReference;
declare export opaque type FlashList_flashes$fragmentType: FlashList_flashes$ref;
export type FlashList_flashes = $ReadOnlyArray<{|
  +id: string,
  +$fragmentRefs: FlashShow_flash$ref,
  +$refType: FlashList_flashes$ref,
|}>;
export type FlashList_flashes$data = FlashList_flashes;
export type FlashList_flashes$key = $ReadOnlyArray<{
  +$data?: FlashList_flashes$data,
  +$fragmentRefs: FlashList_flashes$ref,
  ...
}>;
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": {
    "plural": true
  },
  "name": "FlashList_flashes",
  "selections": [
    {
      "args": null,
      "kind": "FragmentSpread",
      "name": "FlashShow_flash"
    },
    {
      "kind": "ClientExtension",
      "selections": [
        {
          "alias": null,
          "args": null,
          "kind": "ScalarField",
          "name": "id",
          "storageKey": null
        }
      ]
    }
  ],
  "type": "Flash",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = '9a16fefade00102f83ed39a202fc18fb';

module.exports = node;
