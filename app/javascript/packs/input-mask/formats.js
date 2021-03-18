import { MaskDefinitions } from './definitions';

export default class MaskFormats {
  OPTIONS = {
    time: '29:59',
    date: '39/19/2999',
    datetime: '39/19/2999 29:59',
    cnpj: '99.999.999/9999-99',
    cpf: '999.999.999-99',
  };

  FORMATS = {}

  constructor() {
    this.definitions = MaskDefinitions.all();

    this.defaultMasks();
  }

  static all() {
    const formats = new MaskFormats();

    return formats.FORMATS;
  }

  defaultMasks() {
    Object.keys(this.OPTIONS).forEach((mask) => {
      this.FORMATS[mask] = {
        mask: this.OPTIONS[mask],
        definitions: this.definitions,
      };
    });
  }
}

export { MaskFormats };
