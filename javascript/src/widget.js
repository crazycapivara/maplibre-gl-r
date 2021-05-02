import Viz from "./viz";

const debug = global.maplibreglWidget = {
  _widgets: { }
};

export default function(widgetElement, width, height) {
  let map = null;
  let viz = null;
  const _widget = debug._widgets[widgetElement.id] = { };

  function renderValue(widgetData) {
    console.log(widgetData);
    widgetData.mapProps.container = widgetElement.id;
    map = _widget.map = new maplibregl.Map(widgetData.mapProps);
    viz = _widget.viz = new Viz(map);
    map.on("load", () => viz.render());
  }

  function resize(width, height) {
    // not implemented yet
  }

  return { renderValue, resize };
}
