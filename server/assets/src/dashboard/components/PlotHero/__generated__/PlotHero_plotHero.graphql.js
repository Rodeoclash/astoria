/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
export type ChangeDirection = "DECREASE" | "INCREASE" | "%future added value";
export type Sentiment = "NEGATIVE" | "POSITIVE" | "%future added value";
import type { FragmentReference } from "relay-runtime";
declare export opaque type PlotHero_plotHero$ref: FragmentReference;
declare export opaque type PlotHero_plotHero$fragmentType: PlotHero_plotHero$ref;
export type PlotHero_plotHero = {|
  +byline: string,
  +changeDirection: ?ChangeDirection,
  +description: string,
  +name: string,
  +sentiment: ?Sentiment,
  +value: string,
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
      "name": "byline",
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
      "name": "sentiment",
      "storageKey": null
    },
    {
      "alias": null,
      "args": null,
      "kind": "ScalarField",
      "name": "value",
      "storageKey": null
    }
  ],
  "type": "PlotHero",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = '371164e4248f0d9179262647ba5652d2';

module.exports = node;
