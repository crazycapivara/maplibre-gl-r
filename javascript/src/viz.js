import mustache from "mustache";

export default class Viz {
  constructor(map) {
    this._map = map;
  }

  addSource(args) {
    const map = this._map;
    map.addSource(args.id, args.src);
  }

  addControl(props) {
    const map = this._map;
    const control = new maplibregl[props.name](props.options);
    map.addControl(control, props.pos);
  }

  addLayer(props) {
    const map = this._map;
    map.addLayer(props.style);
  }

  addTooltip(args) {
    const map = this._map;
    const layerId = args.layerId;
    const popup = new maplibregl.Popup({
      closeButton: false,
      closeOnClick: false
    });
    map.on("mousemove", layerId, (e) => {
      map.getCanvas().style.cursor = "pointer";
      const lngLat = Object.values(e.lngLat);
      const feature = e.features[0];
      const content = mustache.render(args.tooltip, feature.properties);
      popup.setLngLat(lngLat)
        .setHTML(content)
        .addTo(map);
    });
    map.on("mouseleave", layerId, () => {
      map.getCanvas().style.cursor = "";
      popup.remove();
    });
  }

  render(calls) {
    calls.forEach(({ methodName, args }) => this[methodName](args));
  }
}
