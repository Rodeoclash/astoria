/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ReaderFragment } from 'relay-runtime';
type GithubInstallationGithubRepositories_githubInstallation$ref = any;
import type { FragmentReference } from "relay-runtime";
declare export opaque type GithubInstallationNavigationItem_githubInstallation$ref: FragmentReference;
declare export opaque type GithubInstallationNavigationItem_githubInstallation$fragmentType: GithubInstallationNavigationItem_githubInstallation$ref;
export type GithubInstallationNavigationItem_githubInstallation = {|
  +name: string,
  +$fragmentRefs: GithubInstallationGithubRepositories_githubInstallation$ref,
  +$refType: GithubInstallationNavigationItem_githubInstallation$ref,
|};
export type GithubInstallationNavigationItem_githubInstallation$data = GithubInstallationNavigationItem_githubInstallation;
export type GithubInstallationNavigationItem_githubInstallation$key = {
  +$data?: GithubInstallationNavigationItem_githubInstallation$data,
  +$fragmentRefs: GithubInstallationNavigationItem_githubInstallation$ref,
  ...
};
*/


const node/*: ReaderFragment*/ = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "GithubInstallationNavigationItem_githubInstallation",
  "selections": [
    {
      "alias": null,
      "args": null,
      "kind": "ScalarField",
      "name": "name",
      "storageKey": null
    },
    {
      "args": null,
      "kind": "FragmentSpread",
      "name": "GithubInstallationGithubRepositories_githubInstallation"
    }
  ],
  "type": "GithubInstallation",
  "abstractKey": null
};
// prettier-ignore
(node/*: any*/).hash = '634c101b7ddfa54ca1f1a7c3198058fa';

module.exports = node;
