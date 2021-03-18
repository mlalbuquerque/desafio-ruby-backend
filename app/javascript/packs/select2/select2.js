import $ from 'jquery';
import BaseBomponent from '../base-component';
import Select2Remote from './select2-remote';

window.jQuery = $;
require('select2/dist/js/select2');

export default class Select2 extends BaseBomponent {
  DEFAULT_OPTIONS = {
    language: 'pt-BR',
    placeholder: 'Selecione...',
    theme: 'bootstrap4',
    width: '100%',
    cache: true,
  };

  DEFAULT_SELECTORS = {
    data: {},
    additional: {
      '.bs-select2-required': { allowClear: false },
      '.bs-select2-multiple': { minimumResultsForSearch: 1 },
      '.bs-select2-search': { minimumResultsForSearch: 1 },
    },
  };

  REMOTE_SELECTORS = ['.bs-select2-remote']

  DATA_SUFIX = 'bs-select2';

  SELECTORS = {};

  mountAllSelectorsAndOptions() {
    super.mountAllSelectorsAndOptions();

    this.defaultSelects();

    this.REMOTE_SELECTORS.forEach((selector) => {
      $(selector).each((_, element) => {
        (new Select2Remote(element)).start();
      });
    });
  }

  defaultSelects() {
    const selects = ['select'];
    const nonSelects = ['.no-select2'];

    this.REMOTE_SELECTORS.forEach((selector) => {
      nonSelects.push(selector);
    });

    this.init(
      `${selects.join(',')}:not(${nonSelects.join(',')})`,
      { allowClear: true },
    );
  }

  init(selector, options) {
    $(selector).select2(this.mountOptions(options));
  }

  markAsSelectedAllWithOneOption() {
    let options;

    $('select').each(() => {
      options = $(this).find('option').not('option[value=""]');

      if (options.length === 1) {
        $(this).val(options.attr('value')).change();
      }
    });
  }
}

export { Select2 };
