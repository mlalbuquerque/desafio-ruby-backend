import $ from 'jquery';

export default class Select2Remote {
  constructor(selector) {
    this.element = $(`#${$(selector).attr('id')}`);
  }

  start() {
    this.element.select2(this.options());

    this.reloadData();
  }

  reloadData() {
    const { element } = this;
    const {
      url, entity, optionKey, selectedOptions,
    } = this.dataAttributes();

    if ($.isEmptyObject(selectedOptions)) return;

    $.ajax({
      url,
      data: { id: selectedOptions },
      success(response) {
        const options = response[entity] || response;

        let newOption;
        options.forEach((opt) => {
          newOption = new Option(opt[optionKey], opt.id, false, opt.id);

          $(element).append(newOption).trigger('change');
        });
      },
    });
  }

  dataAttributes() {
    const { element } = this;

    return {
      url: $(element).data('url'),
      entity: $(element).data('entity'),
      optionKey: $(element).data('option-key'),
      selectedOptions: $(element).data('selected-options'),
    };
  }

  options() {
    return {
      language: 'pt-BR',
      placeholder: 'Selecione...',
      theme: 'bootstrap4',
      width: '100%',
      cache: true,
      ajax: {
        delay: 500,
        cache: true,
        url: this.s2Url,
        data: this.s2Data,
        dataType: 'json',
        processResults: this.s2ProcessResults,
      },
    };
  }

  s2Url() {
    return $(this).data('url');
  }

  s2Data(params) {
    params.selectedOptions = $(this).val();
    params.optionKey = $(this).data('option-key');
    params.entity = $(this).data('entity');

    const { term } = params;

    return { term };
  }

  s2ProcessResults(response, params) {
    const results = [];
    const { entity, optionKey, selectedOptions } = params;
    const options = response[entity] || response;

    options.forEach((opt) => {
      if (!selectedOptions.includes(opt.id.toString())) {
        results.push({ id: opt.id, text: opt[optionKey] });
      }
    });

    return { results };
  }
}
