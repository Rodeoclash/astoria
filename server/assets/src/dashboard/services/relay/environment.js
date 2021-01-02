import { Environment, Network, RecordSource, Store } from "relay-runtime";
import { commitLocalUpdate } from "react-relay";
import fetchQuery from "./environment/fetchQuery.js";
import fetchSubscription from "./environment/fetchSubscription.js";

const environment = new Environment({
  network: Network.create(fetchQuery, fetchSubscription),
  store: new Store(new RecordSource()),
});

commitLocalUpdate(environment, (store) => {
  store.getRoot().setLinkedRecords([], "flashes");
});

export default environment;
