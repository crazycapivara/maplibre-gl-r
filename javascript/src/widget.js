export default function(widgetElement, width, height) {
  function renderValue(widgetData) {
    console.log(widgetData);
    widgetElement.innerHTML = widgetData.message;
  }

  function resize(width, height) {
    // not implemented yet
  }

  return { renderValue, resize };
}
