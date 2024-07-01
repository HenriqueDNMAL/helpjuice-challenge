import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["query", "results"];

  performSearch() {
    const query = this.queryTarget.value;
    const url = new URL(this.element.action);
    url.searchParams.set('query', query);

    fetch(url)
      .then(response => response.text())
      .then(html => {
        this.resultsTarget.innerHTML = html;
      });
  }
}
