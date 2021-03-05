export default class MaskDefinitions {
  DEFAULT_DEFINITIONS = {};

  constructor() {
    this.setNumbersDefinitions();
  }

  static all() {
    const definitions = new MaskDefinitions();

    return definitions.DEFAULT_DEFINITIONS;
  }

  setNumbersDefinitions() {
    for (let i = 1; i <= 9; i += 1) {
      this.DEFAULT_DEFINITIONS[i] = { validator: `[0-${i}]` };
    }
  }
}

export { MaskDefinitions };
