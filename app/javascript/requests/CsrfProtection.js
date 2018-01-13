export function CsrfProtection(xhr) {
  const meta = document.querySelector("meta[name=csrf-token]");

  if (meta) {
    const token = meta.content;
    xhr.setRequestHeader("X-CSRF-Token", token);
  }
}
