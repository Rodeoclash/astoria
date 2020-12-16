/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type PlotChangeShow_plotChange$ref: FragmentReference;
declare export opaque type PlotChangeShow_plotChange$fragmentType: PlotChangeShow_plotChange$ref;
export type PlotChangeShow_plotChange = {|
  +trace: {|
    +change: number,
    +currentTotal: number,
    +previousTotal: number,
  |},
  +$refType: PlotChangeShow_plotChange$ref,
|};
export type PlotChangeShow_plotChange$data = PlotChangeShow_plotChange;
export type PlotChangeShow_plotChange$key = {
  +$data?: PlotChangeShow_plotChange$data,
  +$fragmentRefs: PlotChangeShow_plotChange$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "PlotChangeShow_plotChange",
  "selections": [
    {
      "alias": null,
      "args": null,
      "concreteType": "ChartTraceChange",
      "kind": "LinkedField",
      "name": "trace",
      "plural": false,
      "selections": [
        {
          "alias": null,
          "args": null,
          "kind": "ScalarField",
          "name": "change",
          "storageKey": null
        },
        {
          "alias": null,
          "args": null,
          "kind": "ScalarField",
          "name": "currentTotal",
          "storageKey": null
        },
        {
          "alias": null,
          "args": null,
          "kind": "ScalarField",
          "name": "previousTotal",
          "storageKey": null
        }
      ],
      "storageKey": null
    }
  ],
  "type": "PlotChange",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = 'e664c0339a75b178c641855ce5defd42';

module.exports = node;
