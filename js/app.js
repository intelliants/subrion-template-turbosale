//
// Spin.js
// --------------------------------------------------

(function (t, e) {
    "object" == typeof exports ? module.exports = e() : "function" == typeof define && define.amd ? define(e) : t.Spinner = e()
})(this, function () {
    "use strict";
    function t(t, e) {
        var i, n = document.createElement(t || "div");
        for (i in e)n[i] = e[i];
        return n
    }

    function e(t) {
        for (var e = 1, i = arguments.length; i > e; e++)t.appendChild(arguments[e]);
        return t
    }

    function i(t, e, i, n) {
        var r = ["opacity", e, ~~(100 * t), i, n].join("-"), o = .01 + 100 * (i / n),
            a = Math.max(1 - (1 - t) / e * (100 - o), t), s = u.substring(0, u.indexOf("Animation")).toLowerCase(),
            l = s && "-" + s + "-" || "";
        return c[r] || (p.insertRule("@" + l + "keyframes " + r + "{" + "0%{opacity:" + a + "}" + o + "%{opacity:" + t + "}" + (o + .01) + "%{opacity:1}" + (o + e) % 100 + "%{opacity:" + t + "}" + "100%{opacity:" + a + "}" + "}", p.cssRules.length), c[r] = 1), r
    }

    function n(t, e) {
        var i, n, r = t.style;
        for (e = e.charAt(0).toUpperCase() + e.slice(1), n = 0; d.length > n; n++)if (i = d[n] + e, void 0 !== r[i])return i;
        return void 0 !== r[e] ? e : void 0
    }

    function r(t, e) {
        for (var i in e)t.style[n(t, i) || i] = e[i];
        return t
    }

    function o(t) {
        for (var e = 1; arguments.length > e; e++) {
            var i = arguments[e];
            for (var n in i)void 0 === t[n] && (t[n] = i[n])
        }
        return t
    }

    function a(t, e) {
        return "string" == typeof t ? t : t[e % t.length]
    }

    function s(t) {
        this.opts = o(t || {}, s.defaults, f)
    }

    function l() {
        function i(e, i) {
            return t("<" + e + ' xmlns="urn:schemas-microsoft.com:vml" class="spin-vml">', i)
        }

        p.addRule(".spin-vml", "behavior:url(#default#VML)"), s.prototype.lines = function (t, n) {
            function o() {
                return r(i("group", {coordsize: d + " " + d, coordorigin: -u + " " + -u}), {width: d, height: d})
            }

            function s(t, s, l) {
                e(p, e(r(o(), {
                    rotation: 360 / n.lines * t + "deg",
                    left: ~~s
                }), e(r(i("roundrect", {arcsize: n.corners}), {
                    width: u,
                    height: n.width,
                    left: n.radius,
                    top: -n.width >> 1,
                    filter: l
                }), i("fill", {color: a(n.color, t), opacity: n.opacity}), i("stroke", {opacity: 0}))))
            }

            var l, u = n.length + n.width, d = 2 * u, c = 2 * -(n.width + n.length) + "px",
                p = r(o(), {position: "absolute", top: c, left: c});
            if (n.shadow)for (l = 1; n.lines >= l; l++)s(l, -2, "progid:DXImageTransform.Microsoft.Blur(pixelradius=2,makeshadow=1,shadowopacity=.3)");
            for (l = 1; n.lines >= l; l++)s(l);
            return e(t, p)
        }, s.prototype.opacity = function (t, e, i, n) {
            var r = t.firstChild;
            n = n.shadow && n.lines || 0, r && r.childNodes.length > e + n && (r = r.childNodes[e + n], r = r && r.firstChild, r = r && r.firstChild, r && (r.opacity = i))
        }
    }

    var u, d = ["webkit", "Moz", "ms", "O"], c = {}, p = function () {
        var i = t("style", {type: "text/css"});
        return e(document.getElementsByTagName("head")[0], i), i.sheet || i.styleSheet
    }(), f = {
        lines: 12,
        length: 7,
        width: 5,
        radius: 10,
        rotate: 0,
        corners: 1,
        color: "#000",
        direction: 1,
        speed: 1,
        trail: 100,
        opacity: .25,
        fps: 20,
        zIndex: 2e9,
        className: "spinner",
        top: "50%",
        left: "50%",
        position: "absolute"
    };
    s.defaults = {}, o(s.prototype, {
        spin: function (e) {
            this.stop();
            var i = this, n = i.opts,
                o = i.el = r(t(0, {className: n.className}), {position: n.position, width: 0, zIndex: n.zIndex});
            if (n.radius + n.length + n.width, r(o, {
                    left: n.left,
                    top: n.top
                }), e && e.insertBefore(o, e.firstChild || null), o.setAttribute("role", "progressbar"), i.lines(o, i.opts), !u) {
                var a, s = 0, l = (n.lines - 1) * (1 - n.direction) / 2, d = n.fps, c = d / n.speed,
                    p = (1 - n.opacity) / (c * n.trail / 100), f = c / n.lines;
                (function h() {
                    s++;
                    for (var t = 0; n.lines > t; t++)a = Math.max(1 - (s + (n.lines - t) * f) % c * p, n.opacity), i.opacity(o, t * n.direction + l, a, n);
                    i.timeout = i.el && setTimeout(h, ~~(1e3 / d))
                })()
            }
            return i
        }, stop: function () {
            var t = this.el;
            return t && (clearTimeout(this.timeout), t.parentNode && t.parentNode.removeChild(t), this.el = void 0), this
        }, lines: function (n, o) {
            function s(e, i) {
                return r(t(), {
                    position: "absolute",
                    width: o.length + o.width + "px",
                    height: o.width + "px",
                    background: e,
                    boxShadow: i,
                    transformOrigin: "left",
                    transform: "rotate(" + ~~(360 / o.lines * d + o.rotate) + "deg) translate(" + o.radius + "px" + ",0)",
                    borderRadius: (o.corners * o.width >> 1) + "px"
                })
            }

            for (var l, d = 0, c = (o.lines - 1) * (1 - o.direction) / 2; o.lines > d; d++)l = r(t(), {
                position: "absolute",
                top: 1 + ~(o.width / 2) + "px",
                transform: o.hwaccel ? "translate3d(0,0,0)" : "",
                opacity: o.opacity,
                animation: u && i(o.opacity, o.trail, c + d * o.direction, o.lines) + " " + 1 / o.speed + "s linear infinite"
            }), o.shadow && e(l, r(s("#000", "0 0 4px #000"), {top: "2px"})), e(n, e(l, s(a(o.color, d), "0 0 1px rgba(0,0,0,.1)")));
            return n
        }, opacity: function (t, e, i) {
            t.childNodes.length > e && (t.childNodes[e].style.opacity = i)
        }
    });
    var h = r(t("group"), {behavior: "url(#default#VML)"});
    return !n(h, "transform") && h.adj ? l() : u = n(h, "animation"), s
});

//
// Ladda button
// --------------------------------------------------

(function (t, e) {
    "object" == typeof exports ? module.exports = e(require("spin.js")) : "function" == typeof define && define.amd ? define(["spin"], e) : t.Ladda = e(t.Spinner)
})(this, function (t) {
    "use strict";
    function e(t) {
        if (t === void 0)return console.warn("Ladda button target must be defined."), void 0;
        t.querySelector(".ladda-label") || (t.innerHTML = '<span class="ladda-label">' + t.innerHTML + "</span>");
        var e, n = document.createElement("span");
        n.className = "ladda-spinner", t.appendChild(n);
        var r, a = {
            start: function () {
                return e || (e = o(t)), t.setAttribute("disabled", ""), t.setAttribute("data-loading", ""), clearTimeout(r), e.spin(n), this.setProgress(0), this
            }, startAfter: function (t) {
                return clearTimeout(r), r = setTimeout(function () {
                    a.start()
                }, t), this
            }, stop: function () {
                return t.removeAttribute("disabled"), t.removeAttribute("data-loading"), clearTimeout(r), e && (r = setTimeout(function () {
                    e.stop()
                }, 1e3)), this
            }, toggle: function () {
                return this.isLoading() ? this.stop() : this.start(), this
            }, setProgress: function (e) {
                e = Math.max(Math.min(e, 1), 0);
                var n = t.querySelector(".ladda-progress");
                0 === e && n && n.parentNode ? n.parentNode.removeChild(n) : (n || (n = document.createElement("div"), n.className = "ladda-progress", t.appendChild(n)), n.style.width = (e || 0) * t.offsetWidth + "px")
            }, enable: function () {
                return this.stop(), this
            }, disable: function () {
                return this.stop(), t.setAttribute("disabled", ""), this
            }, isLoading: function () {
                return t.hasAttribute("data-loading")
            }, remove: function () {
                clearTimeout(r), t.removeAttribute("disabled", ""), t.removeAttribute("data-loading", ""), e && (e.stop(), e = null);
                for (var n = 0, i = u.length; i > n; n++)if (a === u[n]) {
                    u.splice(n, 1);
                    break
                }
            }
        };
        return u.push(a), a
    }

    function n(t, e) {
        for (; t.parentNode && t.tagName !== e;)t = t.parentNode;
        return e === t.tagName ? t : void 0
    }

    function r(t) {
        for (var e = ["input", "textarea"], n = [], r = 0; e.length > r; r++)for (var a = t.getElementsByTagName(e[r]), i = 0; a.length > i; i++)a[i].hasAttribute("required") && n.push(a[i]);
        return n
    }

    function a(t, a) {
        a = a || {};
        var i = [];
        "string" == typeof t ? i = s(document.querySelectorAll(t)) : "object" == typeof t && "string" == typeof t.nodeName && (i = [t]);
        for (var o = 0, u = i.length; u > o; o++)(function () {
            var t = i[o];
            if ("function" == typeof t.addEventListener) {
                var s = e(t), u = -1;
                t.addEventListener("click", function () {
                    var e = !0, i = n(t, "FORM");
                    if (i !== void 0)for (var o = r(i), d = 0; o.length > d; d++)"" === o[d].value.replace(/^\s+|\s+$/g, "") && (e = !1);
                    e && (s.startAfter(1), "number" == typeof a.timeout && (clearTimeout(u), u = setTimeout(s.stop, a.timeout)), "function" == typeof a.callback && a.callback.apply(null, [s]))
                }, !1)
            }
        })()
    }

    function i() {
        for (var t = 0, e = u.length; e > t; t++)u[t].stop()
    }

    function o(e) {
        var n, r = e.offsetHeight;
        0 === r && (r = parseFloat(window.getComputedStyle(e).height)), r > 32 && (r *= .8), e.hasAttribute("data-spinner-size") && (r = parseInt(e.getAttribute("data-spinner-size"), 10)), e.hasAttribute("data-spinner-color") && (n = e.getAttribute("data-spinner-color"));
        var a = 12, i = .2 * r, o = .6 * i, s = 7 > i ? 2 : 3;
        return new t({
            color: n || "#fff",
            lines: a,
            radius: i,
            length: o,
            width: s,
            zIndex: "auto",
            top: "auto",
            left: "auto",
            className: ""
        })
    }

    function s(t) {
        for (var e = [], n = 0; t.length > n; n++)e.push(t[n]);
        return e
    }

    var u = [];
    return {bind: a, create: e, stopAll: i}
});

/*!
 * jQuery Brazzers Carousel v1.0.0 (http://webdesign-master.ru)
 * Copyright 2015 WebDesign Master.
 */
!function (a) {
    a.fn.brazzersCarousel = function () {
        return this.addClass("brazzers-daddy").append("<div class='tmb-wrap'><div class='tmb-wrap-table'>").append("<div class='image-wrap'>").each(function () {
            var i = a(this);
            i.find("img").appendTo(i.find(".image-wrap")).each(function () {
                i.find(".tmb-wrap-table").append("<div>")
            })
        }).find(".tmb-wrap-table div").hover(function () {
            var i = a(this).parent(".tmb-wrap-table").closest(".brazzers-daddy").find("img"),
                d = a(this).parent(".tmb-wrap-table").find("div");
            i.hide().eq(a(this).index()).css("display", "block"), d.removeClass("active"), a(this).addClass("active")
        }).parent().find(":first").addClass("active")
    }
}(jQuery);

$(function () {

    //
    // Utils
    // --------------------------------------------------

    $('[data-toggle="tooltip"]').tooltip({
        container: 'body'
    });

    $('.modal').appendTo('body');

    // BRAZZERS
    $(".ia-card-hr__image").brazzersCarousel();

    // Bind ladda buttons
    Ladda.bind('.ladda-button');

    //
    // Back to top
    // --------------------------------------------------

    $(window).scroll(function () {
        if ($(this).scrollTop() > 200) {
            $('.scroll-to-top').fadeIn();
        } else {
            $('.scroll-to-top').fadeOut();
        }
    });

    //Click event to scroll to top
    $('.scroll-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 300);
        return false;
    });


    //
    // Expand makes list
    // --------------------------------------------------

    if ($('.pr-list-simple').length) {
        $('.pr-list-simple .row:nth-child(5)').nextAll('.row')
            .wrapAll('<div class="pr-list-simple__hidden"></div>')

        $('.js-more-makes').on('click', function (e) {
            e.preventDefault();

            var $this = $(this),
                $hiddenList = $('.pr-list-simple__hidden'),
                lessText = $this.data('less-makes-text'),
                moreText = $this.data('more-makes-text');

            if (!$hiddenList.hasClass('is-visible')) {
                $hiddenList.slideDown('fast', function () {
                    $hiddenList.addClass('is-visible');
                    $this.html(lessText);
                });
            } else {
                $hiddenList.slideUp('fast', function () {
                    $hiddenList.removeClass('is-visible');
                    $this.html(moreText);
                });
            }
        });
    }
});