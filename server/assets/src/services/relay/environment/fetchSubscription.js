import { Observable } from "relay-runtime";
import * as withAbsintheSocket from "@absinthe/socket";
import { Socket as PhoenixSocket } from "phoenix";
import { createFetcher, createSubscriber } from "@absinthe/socket-relay";

const absintheSocket = withAbsintheSocket.create(
  new PhoenixSocket(window.SPA_CONFIG.userWebsocketURL, {
    params: {
      channelToken: window.SPA_CONFIG.channelToken,
    },
  })
);

const legacySubscribe = createSubscriber(absintheSocket);

export default function (request, variables, cacheConfig) {
  return Observable.create((sink) => {
    legacySubscribe(request, variables, cacheConfig, {
      onNext: sink.next,
      onError: sink.error,
      onCompleted: sink.complete,
    });
  });
}
