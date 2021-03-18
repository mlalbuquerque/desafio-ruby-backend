import $ from 'jquery';
import BaseComponent from '../base-component';

window.jQuery = $;
require('bootstrap-datepicker');
require('bootstrap-datepicker/js/locales/bootstrap-datepicker.pt-BR');

export default class BootstrapDatepicker extends BaseComponent {
  DEFAULT_OPTIONS = {
    language: 'pt-BR',
    format: 'dd/mm/yyyy',
  };

  DEFAULT_SELECTORS = {
    data: {
      date: {},
      'since-today': { startDate: new Date() },
      'until-today': { startDate: -Infinity, endDate: new Date() },
    },
    additional: {
      '.datepicker': {},
    },
  };

  DATA_SUFIX = 'bs-datepicker';

  init(selector, options) {
    $(selector).datepicker(this.mountOptions(options));
  }
}

export { BootstrapDatepicker };
