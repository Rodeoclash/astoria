import { commitLocalUpdate } from "react-relay";

let tempID = 1;

const createFlash = (environment, options) => {
  options.id = tempID;
  options.createdAt = new Date().toISOString();
  options.secondsVisible = options.secondsVisible || 3;

  commitLocalUpdate(environment, (store) => {
    const flashRecords = store.getRoot().getLinkedRecords("flashes");
    const dataID = `client:Flash:${tempID++}`;
    const newRecord = store.create(dataID, "Flash");

    for (const [key, value] of Object.entries(options)) {
      newRecord.setValue(value, key);
    }

    store.getRoot().setLinkedRecords([...flashRecords, newRecord], "flashes");
  });
};

export default createFlash;
