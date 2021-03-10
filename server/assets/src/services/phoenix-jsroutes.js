/*eslint-disable*/
// jshint ignore: start
/**
 * DO NOT MODIFY!
 * This file was automatically generated and will be overwritten in the next build
 */

export function apiGithubWebhookCreate() {
  return "/api/github/webhook";
}

export function authRequest(provider) {
  return "/auth/" + provider;
}

export function authCallback(provider) {
  return "/auth/" + provider + "/callback";
}

export function installedCallback(provider) {
  return "/installed/" + provider;
}

export function adminCurrentUserShow() {
  return "/admin/current_user";
}

export function dashboardRootShow() {
  return "/dashboard";
}

export function dashboardShow() {
  return "/dashboard/*path";
}

export function homepageRootShow() {
  return "/";
}

export function homeShow() {
  return "/*path";
}
