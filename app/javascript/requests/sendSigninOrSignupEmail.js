import { Urls } from "constants/Urls.js.erb";
import { CsrfProtection } from "requests/CsrfProtection";

export const sendSigninOrSignupEmail = email =>
  new Promise((resolve, reject) => {
    const { method, path } = Urls.signinOrSignupEmails;
    const request = new XMLHttpRequest();

    request.open(method, path);

    CsrfProtection(request);

    request.addEventListener("load", event => {
      if (event.target.status === 201) {
        resolve();
      } else {
        reject(new Error(`${event.target.status}: ${event.target.statusText}`));
      }
    });

    request.addEventListener("error", () =>
      reject(new Error("ネットワークエラー"))
    );

    request.setRequestHeader(
      "Content-Type",
      "application/x-www-form-urlencoded"
    );

    request.send(`email=${escape(email)}`);
  });
