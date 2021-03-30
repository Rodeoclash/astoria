/*
import { graphql } from "react-relay";
import { baseCommitMutation as commitMutation } from "app/services/relay/mutations.js";

const mutation = graphql`
  mutation createUserAchievementMutation($achievementId: ID!) {
    createUserAchievement(achievementId: $achievementId) {
      currentUser {
        availableAchievements(first: 100) {
          ...AvailableAchievementConnection_availableAchievementConnection
        }
        userScore {
          ...UserScoreDisplay_userScore
        }
      }
    }
  }
`;

const committedMutation = commitMutation(mutation);

export default committedMutation;
*/
