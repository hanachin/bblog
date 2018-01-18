import { CsrfProtection } from "requests/CsrfProtection";

export const getBabyLogs = date =>
  new Promise((resolve, reject) => {
    const request = new XMLHttpRequest();

    request.open(
      "GET",
      `/baby/${date.getFullYear()}/${date.getMonth() +
        1}/${date.getDate()}.json`
    );

    CsrfProtection(request);

    request.addEventListener("load", event => {
      if (event.target.status === 200) {
        resolve(event.target.response);
      } else {
        reject(new Error(`${event.target.status}: ${event.target.statusText}`));
      }
    });

    request.addEventListener("error", () =>
      reject(new Error("ネットワークエラー"))
    );

    request.responseType = "json";

    request.send();
  });
