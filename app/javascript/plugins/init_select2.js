import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  document.addEventListener('click', (event) => {
    if (document.querySelector(".select2-results__option")){
      console.log(document.querySelector(".select2-results__option"));
      document.querySelector(".select2-results__option").setAttribute("aria-selected", "false")
    }

  });
  // $('.select2').val(0).attr("aria-selected", "false");
  // $('.select2').val(1).attr("aria-selected", "false");
  // $('.select2').val(2).attr("aria-selected", "false");
  // $('.select2').val(3).attr("aria-selected", "false");
  $('.select2-container').remove()
  $('.select2').select2({
  });
};

export { initSelect2 };
