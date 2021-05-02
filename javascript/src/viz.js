export default class Viz {
  constructor(map) {
    this._map = map;
  }

  render() {
    const map = this._map;
    const control = new maplibregl["NavigationControl"]();
    map.addControl(control);
  }
}
