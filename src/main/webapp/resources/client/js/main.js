(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner(0);


    // Fixed Navbar
    $(window).scroll(function () {
        if ($(window).width() < 992) {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow');
            } else {
                $('.fixed-top').removeClass('shadow');
            }
        } else {

            $('.fixed-top').removeClass('shadow').css('top', 0);

        }
    });


    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({ scrollTop: 0 }, 1500, 'easeInOutExpo');
        return false;
    });


    // Testimonial carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 2000,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 1
            },
            992: {
                items: 2
            },
            1200: {
                items: 2
            }
        }
    });


    // vegetable carousel
    $(".vegetable-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 2
            },
            992: {
                items: 3
            },
            1200: {
                items: 4
            }
        }
    });


    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });
        console.log($videoSrc);

        $('#videoModal').on('shown.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        })

        $('#videoModal').on('hide.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc);
        })

        const navElement = $("#navbarCollapse");
        const currentUrl = window.location.pathname;
        navElement.find('a.nav-link').each(function () {
            const link = $(this);
            const href = link.attr('href');

            if (href == currentUrl) {
                link.addClass('active');
            } else {
                link.removeClass('active');
            }
        });
    });



    // Product Quantity
    $('.quantity button').on('click', function () {
        let change = 0;
        var button = $(this);
        var oldValue = button.parent().parent().find('input').val();
        if (button.hasClass('btn-plus')) {
            var newVal = parseFloat(oldValue) + 1;
            change = 1;
        } else {
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
                change = -1;
            } else {
                newVal = 1;
            }
        }
        const input = button.parent().parent().find('input');
        input.val(newVal);

        const index = input.attr("data-cart-detail-index");
        const el = document.getElementById(`cartDetails${index}.quantity`);
        $(el).val(newVal);

        const price = input.attr("data-cart-detail-price");
        const id = input.attr("data-cart-detail-id");

        const priceElement = $(`p[data-cart-detail-id='${id}']`);

        if (priceElement) {
            const newPrice = +price * newVal;
            priceElement.text(formatCurrency(newPrice.toFixed(2)) + " đ");
        }

        const totalPriceElement = $(`p[data-cart-total-price]`);

        if (totalPriceElement && totalPriceElement.length) {
            const currentTotal = totalPriceElement.first().attr("data-cart-total-price");
            let newTotal = +currentTotal;

            if (change === 0) {
                newTotal = +currentTotal;
            } else {
                newTotal = change * (+price) + (+currentTotal);
            }

            change = 0;

            totalPriceElement?.each(function (index, element) {
                $(totalPriceElement[index]).text(formatCurrency(newTotal.toFixed(2)) + " đ");
                $(totalPriceElement[index]).attr("data-cart-total-price", newTotal);
            });
        }
    });
    function formatCurrency(value) {
        const format = new Intl.NumberFormat('vi-VN', {
            style: 'decimal',
            minimumFractionDigits: 0,
        });
        let formatted = format.format(value);

        formatted = formatted.replace(/\./g, ',');
        return formatted;
    }

    $('#btnFilter').click(function (event) {
        event.preventDefault();
        updateURL();
    });

    function updateURL() {
        let factoryArr = [];
        let targetArr = [];
        let priceArr = [];

        $("#factoryFilter .form-check-input:checked").each(function () {
            factoryArr.push($(this).val());
        });

        $("#targetFilter .form-check-input:checked").each(function () {
            targetArr.push($(this).val());
        });

        $("#priceFilter .form-check-input:checked").each(function () {
            priceArr.push($(this).val());
        });

        let sortValue = $('input[name="sort"]:checked').val();

        const currentUrl = new URL(window.location.href);
        const searchParams = currentUrl.searchParams;

        searchParams.set('page', '1');
        if (sortValue) searchParams.set('sort', sortValue);

        if (factoryArr.length > 0) {
            searchParams.set('factory', factoryArr.join(','));
        } else {
            searchParams.delete('factory');
        }
        if (targetArr.length > 0) {
            searchParams.set('target', targetArr.join(','));
        } else {
            searchParams.delete('target');
        }
        if (priceArr.length > 0) {
            searchParams.set('price', priceArr.join(','));
        } else {
            searchParams.delete('price');
        }

        window.location.href = currentUrl.toString();
    }

    // Handle auto checkbox after page loading
    const params = new URLSearchParams(window.location.search);

    // Function to check checkboxes based on URL params
    function setCheckedValues(paramName, selector) {
        if (params.has(paramName)) {
            const values = params.get(paramName).split(',');
            values.forEach(value => {
                $(`${selector} .form-check-input[value='${value}']`).prop('checked', true);
            });
        }
    }

    setCheckedValues('factory', '#factoryFilter');
    setCheckedValues('target', '#targetFilter');
    setCheckedValues('price', '#priceFilter');

    // Auto check sort option
    if (params.has('sort')) {
        $(`input[name='sort'][value='${params.get('sort')}']`).prop('checked', true);
    }


})(jQuery);

