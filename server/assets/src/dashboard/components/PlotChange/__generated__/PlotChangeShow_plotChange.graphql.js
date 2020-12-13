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
  +traces: $ReadOnlyArray<?{|
    +change: number,
    +datetime: string,
    +total: number,
  |}>,
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
      "name": "traces",
      "plural": true,
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
          "name": "datetime",
          "storageKey": null
        },
        {
          "alias": null,
          "args": null,
          "kind": "ScalarField",
          "name": "total",
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
(node/*: any*/).hash = 'b5bb249899caf56c41759c51564d512b';

module.exports = node;
