const debug = global.maplibreglWidget = {
  _widgets: { }
};

export default function(widgetElement, width, height) {
  let map = null;
  const _widget = debug._widgets[widgetElement.id] = { };

  function renderValue(widgetData) {
    console.log(widgetData);
    widgetData.mapProps.container = widgetElement.id;
    map = _widget.map = new maplibregl.Map(widgetData.mapProps);
  }

  function resize(width, height) {
    // not implemented yet
  }

  return { renderValue, resize };
}
