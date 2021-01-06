import { commitLocalUpdate } from "react-relay";

const createFlash = (environment, options) => {
  commitLocalUpdate(environment, (store) => {
    const dashboardSettingsRecord = store
      .getRoot()
      .getLinkedRecord("dashboardSettings");

    dashboardSettingsRecord.setValue(
      options.selectedGithubInstallationName,
      "selectedGithubInstallationName"
    );
    dashboardSettingsRecord.setValue(
      options.selectedGithubRepositoryName,
      "selectedGithubRepositoryName"
    );
  });
};

export default createFlash;
