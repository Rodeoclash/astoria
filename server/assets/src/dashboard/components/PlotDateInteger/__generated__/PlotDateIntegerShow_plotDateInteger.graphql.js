/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type PlotDateIntegerShow_plotDateInteger$ref: FragmentReference;
declare export opaque type PlotDateIntegerShow_plotDateInteger$fragmentType: PlotDateIntegerShow_plotDateInteger$ref;
export type PlotDateIntegerShow_plotDateInteger = {|
  +traces: $ReadOnlyArray<?{|
    +name: string,
    +x: $ReadOnlyArray<?any>,
    +y: $ReadOnlyArray<?number>,
  |}>,
  +$refType: PlotDateIntegerShow_plotDateInteger$ref,
|};
export type PlotDateIntegerShow_plotDateInteger$data = PlotDateIntegerShow_plotDateInteger;
export type PlotDateIntegerShow_plotDateInteger$key = {
  +$data?: PlotDateIntegerShow_plotDateInteger$data,
  +$fragmentRefs: PlotDateIntegerShow_plotDateInteger$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "PlotDateIntegerShow_plotDateInteger",
  "selections": [
    {
      "alias": null,
      "args": null,
      "concreteType": "ChartTraceDateInteger",
      "kind": "LinkedField",
      "name": "traces",
      "plural": true,
      "selections": [
        {
          "alias": null,
          "args": null,
          "kind": "ScalarField",
          "name": "name",
          "storageKey": null
        },
        {
          "alias": null,
          "args": null,
          "kind": "ScalarField",
          "name": "x",
          "storageKey": null
        },
        {
          "alias": null,
          "args": null,
          "kind": "ScalarField",
          "name": "y",
          "storageKey": null
        }
      ],
      "storageKey": null
    }
  ],
  "type": "PlotDateInteger",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = '3781ba04069d46e15f0ea18469f6c9da';

module.exports = node;
