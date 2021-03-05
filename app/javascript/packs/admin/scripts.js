// From yarn
import $ from 'jquery';

// From components
import { BootstrapDatepicker } from '../bootstrap-datepicker/datepicker';
import { BootstrapInputTags } from '../bootstrap-input-tags/input-tags';
import { InputMask } from '../input-mask/mask';
import { Select2 } from '../select2/select2';

require('../preload');

// Starts
$(document).on('turbolinks:load', () => {
  (new BootstrapDatepicker()).start();
  (new BootstrapInputTags()).start();
  (new InputMask()).start();
  (new Select2()).start();
});
