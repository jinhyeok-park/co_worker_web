const script = document.createElement("script");
document.head.appendChild(script);

var
    init = function() {/* init Start */

        $('.logo-title').on('click', function () {
            window.location.href = '/';
        });
    };

window.onload = () => {
    init();
};
