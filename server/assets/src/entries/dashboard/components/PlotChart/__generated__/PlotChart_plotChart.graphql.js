/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type PlotChart_plotChart$ref: FragmentReference;
declare export opaque type PlotChart_plotChart$fragmentType: PlotChart_plotChart$ref;
export type PlotChart_plotChart = {|
  +description: string,
  +name: string,
  +traces: ?string,
  +$refType: PlotChart_plotChart$ref,
|};
export type PlotChart_plotChart$data = PlotChart_plotChart;
export type PlotChart_plotChart$key = {
  +$data?: PlotChart_plotChart$data,
  +$fragmentRefs: PlotChart_plotChart$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "PlotChart_plotChart",
  "selections": [
    {
      "alias": null,
      "args": null,
      "kind": "ScalarField",
      "name": "description",
      "storageKey": null
    },
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
      "name": "traces",
      "storageKey": null
    }
  ],
  "type": "PlotChart",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = 'f95c2e368fc5ec05c59452b2a2e0593d';

module.exports = node;
