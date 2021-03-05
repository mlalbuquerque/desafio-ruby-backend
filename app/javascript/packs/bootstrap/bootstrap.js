import $ from 'jquery';
import { Collapse } from 'bootstrap';

require('bootstrap');

Collapse._jQueryInterface = function CollapseJQueryInterface() {
  return this.each(() => $(this).slideToggle());
};
