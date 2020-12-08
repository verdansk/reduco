import $ from 'jquery';
import 'select2';



const animate = () => {

const button = document.querySelector('.update-xp');

button.addEventListener('click', (e) => {
  console.log("bla");
}

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
}
export { animate };
