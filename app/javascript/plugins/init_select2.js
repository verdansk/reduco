import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  // $('.select2').val(0).attr("aria-selected", "false");
  // $('.select2').val(1).attr("aria-selected", "false");
  // $('.select2').val(2).attr("aria-selected", "false");
  // $('.select2').val(3).attr("aria-selected", "false");
  $('.select2').select2({
  });
};

export { initSelect2 };
