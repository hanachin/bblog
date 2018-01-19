import { CsrfProtection } from "requests/CsrfProtection";

export const sendRequestFromForm = form =>
  new Promise((resolve, reject) => {
    const request = new XMLHttpRequest();

    request.open(form.method, form.action);

    CsrfProtection(request);

    request.addEventListener("load", event => {
      if (event.target.status === 201) {
        resolve(event.target.response);
      } else {
        reject(new Error(`${event.target.status}: ${event.target.statusText}`));
      }
    });

    request.addEventListener("error", () =>
      reject(new Error("ネットワークエラー"))
    );

    request.responseType = "json";

    request.send(new FormData(form));
  });
