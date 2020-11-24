/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
import type { FragmentReference } from "relay-runtime";
declare export opaque type PlotDateFloatShow_plotDateFloat$ref: FragmentReference;
declare export opaque type PlotDateFloatShow_plotDateFloat$fragmentType: PlotDateFloatShow_plotDateFloat$ref;
export type PlotDateFloatShow_plotDateFloat = {|
  +traces: $ReadOnlyArray<?{|
    +name: string,
    +x: $ReadOnlyArray<?any>,
    +y: $ReadOnlyArray<?number>,
  |}>,
  +$refType: PlotDateFloatShow_plotDateFloat$ref,
|};
export type PlotDateFloatShow_plotDateFloat$data = PlotDateFloatShow_plotDateFloat;
export type PlotDateFloatShow_plotDateFloat$key = {
  +$data?: PlotDateFloatShow_plotDateFloat$data,
  +$fragmentRefs: PlotDateFloatShow_plotDateFloat$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "PlotDateFloatShow_plotDateFloat",
  "selections": [
    {
      "alias": null,
      "args": null,
      "concreteType": "ChartTraceDateFloat",
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
  "type": "PlotDateFloat",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = 'd4df93969c1378b70aa79ea68976cb6f';

module.exports = node;
