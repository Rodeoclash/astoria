/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
export type ChangeDirection = "NEGATIVE" | "POSITIVE" | "%future added value";
import type { FragmentReference } from "relay-runtime";
declare export opaque type PlotHero_plotHero$ref: FragmentReference;
declare export opaque type PlotHero_plotHero$fragmentType: PlotHero_plotHero$ref;
export type PlotHero_plotHero = {|
  +change: ?number,
  +changeDirection: ?ChangeDirection,
  +currentTotal: ?string,
  +description: string,
  +name: string,
  +previousTotal: ?string,
  +$refType: PlotHero_plotHero$ref,
|};
export type PlotHero_plotHero$data = PlotHero_plotHero;
export type PlotHero_plotHero$key = {
  +$data?: PlotHero_plotHero$data,
  +$fragmentRefs: PlotHero_plotHero$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "PlotHero_plotHero",
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
      "name": "changeDirection",
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
      "name": "previousTotal",
      "storageKey": null
    }
  ],
  "type": "PlotHero",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = 'e10086edf18052a4b9efd3d22114ef8f';

module.exports = node;
