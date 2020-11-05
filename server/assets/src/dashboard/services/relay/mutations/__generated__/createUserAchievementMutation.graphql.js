/**
 * @flow
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest } from 'relay-runtime';
type AvailableAchievementConnection_availableAchievementConnection$ref = any;
type UserScoreDisplay_userScore$ref = any;
export type createUserAchievementMutationVariables = {|
  achievementId: string
|};
export type createUserAchievementMutationResponse = {|
  +createUserAchievement: ?{|
    +currentUser: {|
      +availableAchievements: ?{|
        +$fragmentRefs: AvailableAchievementConnection_availableAchievementConnection$ref
      |},
      +userScore: ?{|
        +$fragmentRefs: UserScoreDisplay_userScore$ref
      |},
    |}
  |}
|};
export type createUserAchievementMutation = {|
  variables: createUserAchievementMutationVariables,
  response: createUserAchievementMutationResponse,
|};
*/


/*
mutation createUserAchievementMutation(
  $achievementId: ID!
) {
  createUserAchievement(achievementId: $achievementId) {
    currentUser {
      availableAchievements(first: 100) {
        ...AvailableAchievementConnection_availableAchievementConnection
      }
      userScore {
        ...UserScoreDisplay_userScore
      }
      id
    }
  }
}

fragment AchievementAdd_achievement on Achievement {
  id
  name
}

fragment AchievementPopup_achievement on Achievement {
  description
  name
}

fragment AchievementShow_achievement on Achievement {
  name
}

fragment AvailableAchievementConnection_availableAchievementConnection on AvailableAchievementConnection {
  edges {
    node {
      ...AvailableAchievementShow_availableAchievement
      key
    }
  }
}

fragment AvailableAchievementShow_availableAchievement on AvailableAchievement {
  addableAt
  timesEarned
  achievement {
    ...AchievementAdd_achievement
    ...AchievementShow_achievement
    ...AchievementPopup_achievement
    id
  }
}

fragment UserScoreDisplay_userScore on UserScore {
  allTime
  thisYear
  thisMonth
}
*/

const node/*: ConcreteRequest*/ = (function(){
var v0 = [
  {
    "defaultValue": null,
    "kind": "LocalArgument",
    "name": "achievementId"
  }
],
v1 = [
  {
    "kind": "Variable",
    "name": "achievementId",
    "variableName": "achievementId"
  }
],
v2 = [
  {
    "kind": "Literal",
    "name": "first",
    "value": 100
  }
],
v3 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "id",
  "storageKey": null
};
return {
  "fragment": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Fragment",
    "metadata": null,
    "name": "createUserAchievementMutation",
    "selections": [
      {
        "alias": null,
        "args": (v1/*: any*/),
        "concreteType": "CreateUserAchievementPayload",
        "kind": "LinkedField",
        "name": "createUserAchievement",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": null,
            "concreteType": "CurrentUser",
            "kind": "LinkedField",
            "name": "currentUser",
            "plural": false,
            "selections": [
              {
                "alias": null,
                "args": (v2/*: any*/),
                "concreteType": "AvailableAchievementConnection",
                "kind": "LinkedField",
                "name": "availableAchievements",
                "plural": false,
                "selections": [
                  {
                    "args": null,
                    "kind": "FragmentSpread",
                    "name": "AvailableAchievementConnection_availableAchievementConnection"
                  }
                ],
                "storageKey": "availableAchievements(first:100)"
              },
              {
                "alias": null,
                "args": null,
                "concreteType": "UserScore",
                "kind": "LinkedField",
                "name": "userScore",
                "plural": false,
                "selections": [
                  {
                    "args": null,
                    "kind": "FragmentSpread",
                    "name": "UserScoreDisplay_userScore"
                  }
                ],
                "storageKey": null
              }
            ],
            "storageKey": null
          }
        ],
        "storageKey": null
      }
    ],
    "type": "RootMutationType",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Operation",
    "name": "createUserAchievementMutation",
    "selections": [
      {
        "alias": null,
        "args": (v1/*: any*/),
        "concreteType": "CreateUserAchievementPayload",
        "kind": "LinkedField",
        "name": "createUserAchievement",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": null,
            "concreteType": "CurrentUser",
            "kind": "LinkedField",
            "name": "currentUser",
            "plural": false,
            "selections": [
              {
                "alias": null,
                "args": (v2/*: any*/),
                "concreteType": "AvailableAchievementConnection",
                "kind": "LinkedField",
                "name": "availableAchievements",
                "plural": false,
                "selections": [
                  {
                    "alias": null,
                    "args": null,
                    "concreteType": "AvailableAchievementEdge",
                    "kind": "LinkedField",
                    "name": "edges",
                    "plural": true,
                    "selections": [
                      {
                        "alias": null,
                        "args": null,
                        "concreteType": "AvailableAchievement",
                        "kind": "LinkedField",
                        "name": "node",
                        "plural": false,
                        "selections": [
                          {
                            "alias": null,
                            "args": null,
                            "kind": "ScalarField",
                            "name": "addableAt",
                            "storageKey": null
                          },
                          {
                            "alias": null,
                            "args": null,
                            "kind": "ScalarField",
                            "name": "timesEarned",
                            "storageKey": null
                          },
                          {
                            "alias": null,
                            "args": null,
                            "concreteType": "Achievement",
                            "kind": "LinkedField",
                            "name": "achievement",
                            "plural": false,
                            "selections": [
                              (v3/*: any*/),
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
                                "name": "description",
                                "storageKey": null
                              }
                            ],
                            "storageKey": null
                          },
                          {
                            "alias": null,
                            "args": null,
                            "kind": "ScalarField",
                            "name": "key",
                            "storageKey": null
                          }
                        ],
                        "storageKey": null
                      }
                    ],
                    "storageKey": null
                  }
                ],
                "storageKey": "availableAchievements(first:100)"
              },
              {
                "alias": null,
                "args": null,
                "concreteType": "UserScore",
                "kind": "LinkedField",
                "name": "userScore",
                "plural": false,
                "selections": [
                  {
                    "alias": null,
                    "args": null,
                    "kind": "ScalarField",
                    "name": "allTime",
                    "storageKey": null
                  },
                  {
                    "alias": null,
                    "args": null,
                    "kind": "ScalarField",
                    "name": "thisYear",
                    "storageKey": null
                  },
                  {
                    "alias": null,
                    "args": null,
                    "kind": "ScalarField",
                    "name": "thisMonth",
                    "storageKey": null
                  }
                ],
                "storageKey": null
              },
              (v3/*: any*/)
            ],
            "storageKey": null
          }
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "a9a703c042c0243b2c8075a69f10c965",
    "id": null,
    "metadata": {},
    "name": "createUserAchievementMutation",
    "operationKind": "mutation",
    "text": "mutation createUserAchievementMutation(\n  $achievementId: ID!\n) {\n  createUserAchievement(achievementId: $achievementId) {\n    currentUser {\n      availableAchievements(first: 100) {\n        ...AvailableAchievementConnection_availableAchievementConnection\n      }\n      userScore {\n        ...UserScoreDisplay_userScore\n      }\n      id\n    }\n  }\n}\n\nfragment AchievementAdd_achievement on Achievement {\n  id\n  name\n}\n\nfragment AchievementPopup_achievement on Achievement {\n  description\n  name\n}\n\nfragment AchievementShow_achievement on Achievement {\n  name\n}\n\nfragment AvailableAchievementConnection_availableAchievementConnection on AvailableAchievementConnection {\n  edges {\n    node {\n      ...AvailableAchievementShow_availableAchievement\n      key\n    }\n  }\n}\n\nfragment AvailableAchievementShow_availableAchievement on AvailableAchievement {\n  addableAt\n  timesEarned\n  achievement {\n    ...AchievementAdd_achievement\n    ...AchievementShow_achievement\n    ...AchievementPopup_achievement\n    id\n  }\n}\n\nfragment UserScoreDisplay_userScore on UserScore {\n  allTime\n  thisYear\n  thisMonth\n}\n"
  }
};
})();
// prettier-ignore
(node/*: any*/).hash = '3d6021fc67a2cdae92291ddfe65e12d5';

module.exports = node;
