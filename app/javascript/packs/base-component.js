import $ from 'jquery';

export default class BaseComponent {
  DEFAULT_OPTIONS = {};

  DEFAULT_SELECTORS = {};

  DATA_SUFIX = 'bs';

  SELECTORS = {};

  start() {
    this.mountAllSelectorsAndOptions();

    Object.keys(this.SELECTORS).forEach((selector) => {
      this.init(selector, this.SELECTORS[selector]);
    });
  }

  mountOptions(options) {
    return $.extend(options, this.DEFAULT_OPTIONS);
  }

  mountAllSelectorsAndOptions() {
    let selector;
    let currentSelectors;

    Object.keys(this.DEFAULT_SELECTORS).forEach((type) => {
      currentSelectors = this.DEFAULT_SELECTORS[type];

      Object.keys(currentSelectors).forEach((picker) => {
        selector = this.dataSelector(type, picker);

        this.SELECTORS[selector] = currentSelectors[picker];
      });
    });
  }

  dataSelector(type, picker) {
    if (type === 'data') {
      return `[data-${this.DATA_SUFIX}="${picker}"]`;
    }
    return picker;
  }
}
