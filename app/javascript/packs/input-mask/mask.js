import Inputmask from 'inputmask';

import { MaskFormats } from './formats';

export default class InputMask {
  MASK_OPTIONS = {
    mask: ['time', 'date', 'datetime', 'cnpj', 'cpf'],
    'bs-datepicker': ['date'],
  };

  constructor() {
    this.formats = MaskFormats.all();
  }

  start() {
    Object.keys(this.MASK_OPTIONS).forEach((i) => {
      this.MASK_OPTIONS[i].forEach((o) => {
        Inputmask(this.formats[o]).mask(`[data-${i}="${o}"]`);
      });
    });
  }
}

export { InputMask };
