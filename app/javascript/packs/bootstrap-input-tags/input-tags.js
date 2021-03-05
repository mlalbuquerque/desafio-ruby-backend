import $ from 'jquery';
import BaseComponent from '../base-component';

require('bootstrap4-tagsinput/tagsinput');

export default class BootstrapInputTags extends BaseComponent {
  DEFAULT_SELECTORS = {
    data: {
      'input-tags': {},
    },
  };

  DATA_SUFIX = 'bootstrap';

  init(selector, options) {
    $(selector).tagsinput(this.mountOptions(options));
  }
}

export { BootstrapInputTags };
