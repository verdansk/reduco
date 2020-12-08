import $ from 'jquery';
import 'select2';



const animate = () => {

// const button = document.querySelector('.update-xp');


// button.addEventListener('click', (e) => {
//    console.log(e.target.parentElement.parentElement);
//   e.preventDefault();
  $('.counter-count').each(function () {
        $(this).prop('Counter',0).animate({
            Counter: $(this).text()
        }, {
            duration: 2000,
            easing: 'swing',
            step: function (now) {
                $(this).text(Math.ceil(now));
            }
        });
    });

//   const element = e.target.parentElement.parentElement;
//   element.classList.add("hide-challenge");
// });


}
export { animate };
