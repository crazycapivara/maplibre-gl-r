export default class Viz {
  constructor(map) {
    this._map = map;
  }

  addControl(props) {
    const map = this._map;
    const control = new maplibregl[props.name](props.options);
    map.addControl(control, props.pos);
  }

  render(calls) {
    const map = this._map;
    calls.forEach(({ methodName, args }) => this[methodName](args));
  }
}
