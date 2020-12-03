import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    placeholder: {
    id: '-1', // the value of the option
    text: 'Select an option'
    }

  });
};

export { initSelect2 };
