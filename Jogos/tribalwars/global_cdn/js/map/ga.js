(function () {
    var g = void 0,
        i = !0,
        j = null,
        k = !1,
        aa = encodeURIComponent,
        ba = Infinity,
        fa = setTimeout,
        ga = decodeURIComponent,
        l = Math;

    function ha(a, b) {
        return a.name = b
    }
    var m = "push",
        ia = "test",
        ja = "slice",
        o = "replace",
        ka = "load",
        la = "floor",
        ma = "charAt",
        na = "value",
        q = "indexOf",
        oa = "match",
        pa = "port",
        qa = "createElement",
        ra = "path",
        r = "name",
        t = "host",
        u = "toString",
        v = "length",
        w = "prototype",
        sa = "clientWidth",
        x = "split",
        ta = "stopPropagation",
        ua = "scope",
        y = "location",
        va = "search",
        z = "protocol",
        wa = "clientHeight",
        xa = "href",
        A = "substring",
        ya = "apply",
        za = "navigator",
        B = "join",
        C = "toLowerCase",
        D;

    function Aa(a, b) {
        switch (b) {
        case 0:
            return "" + a;
        case 1:
            return 1 * a;
        case 2:
            return !!a;
        case 3:
            return 1E3 * a
        }
        return a
    }function Ba(a) {
        return "function" == typeof a
    }function Ca(a) {
        return a != g && -1 < (a.constructor + "")[q]("String")
    }function E(a, b) {
        return g == a || "-" == a && !b || "" == a
    }function Da(a) {
        if (!a || "" == a) return "";
        for (; a && -1 < " \n\r\t" [q](a[ma](0));) a = a[A](1);
        for (; a && -1 < " \n\r\t" [q](a[ma](a[v] - 1));) a = a[A](0, a[v] - 1);
        return a
    }

    function F(a) {
        var b = 1,
            c = 0,
            d;
        if (!E(a)) {
            b = 0;
            for (d = a[v] - 1; 0 <= d; d--) c = a.charCodeAt(d), b = (b << 6 & 268435455) + c + (c << 14), c = b & 266338304, b = 0 != c ? b ^ c >> 21 : b
        }
        return b
    }function Ea() {
        return l.round(2147483647 * l.random())
    }function Fa() {}function G(a, b) {
        if (aa instanceof Function) return b ? encodeURI(a) : aa(a);
        H(68);
        return escape(a)
    }function I(a) {
        a = a[x]("+")[B](" ");
        if (ga instanceof Function) try {
            return ga(a)
        } catch (b) {
            H(17)
        } else H(68);
        return unescape(a)
    }
    var Ga = function (a, b, c, d) {
            a.addEventListener ? a.addEventListener(b, c, !! d) : a.attachEvent && a.attachEvent("on" + b, c)
        },
        Ha = function (a, b, c, d) {
            a.removeEventListener ? a.removeEventListener(b, c, !! d) : a.detachEvent && a.detachEvent("on" + b, c)
        };

    function Ia(a, b) {
        if (a) {
            var c = J[qa]("script");
            c.type = "text/javascript";
            c.async = i;
            c.src = a;
            c.id = b;
            var d = J.getElementsByTagName("script")[0];
            d.parentNode.insertBefore(c, d);
            return c
        }
    }function K(a) {
        return a && 0 < a[v] ? a[0] : ""
    }function Ja(a) {
        var b = a ? a[v] : 0;
        return 0 < b ? a[b - 1] : ""
    }
    var Ka = function () {
            this.prefix = "ga.";
            this.R = {}
        };
    Ka[w].set = function (a, b) {
        this.R[this.prefix + a] = b
    };
    Ka[w].get = function (a) {
        return this.R[this.prefix + a]
    };
    Ka[w].contains = function (a) {
        return this.get(a) !== g
    };

    function La(a) {
        0 == a[q]("www.") && (a = a[A](4));
        return a[C]()
    }function Ma(a, b) {
        var c, d = {
            url: a,
            protocol: "http",
            host: "",
            path: "",
            d: new Ka,
            anchor: ""
        };
        if (!a) return d;
        c = a[q]("://");
        0 <= c && (d.protocol = a[A](0, c), a = a[A](c + 3));
        c = a[va]("/|\\?|#");
        if (0 <= c) d.host = a[A](0, c)[C](), a = a[A](c);
        else return d.host = a[C](), d;
        c = a[q]("#");
        0 <= c && (d.anchor = a[A](c + 1), a = a[A](0, c));
        c = a[q]("?");
        0 <= c && (Na(d.d, a[A](c + 1)), a = a[A](0, c));
        d.anchor && b && Na(d.d, d.anchor);
        a && "/" == a[ma](0) && (a = a[A](1));
        d.path = a;
        return d
    }

    function Oa(a, b) {function c(a) {
            var b = (a.hostname || "")[x](":")[0][C](),
                c = (a[z] || "")[C](),
                c = 1 * a[pa] || ("http:" == c ? 80 : "https:" == c ? 443 : ""),
                a = a.pathname || "";
            0 == a[q]("/") || (a = "/" + a);
            return [b, "" + c, a]
        }
        var d = b || J[qa]("a");
        d.href = J[y][xa];
        var e = (d[z] || "")[C](),
            f = c(d),
            h = d[va] || "",
            n = e + "//" + f[0] + (f[1] ? ":" + f[1] : "");
        0 == a[q]("//") ? a = e + a : 0 == a[q]("/") ? a = n + a : !a || 0 == a[q]("?") ? a = n + f[2] + (a || h) : 0 > a[x]("/")[0][q](":") && (a = n + f[2][A](0, f[2].lastIndexOf("/")) + "/" + a);
        d.href = a;
        e = c(d);
        return {
            protocol: (d[z] || "")[C](),
            host: e[0],
            port: e[1],
            path: e[2],
            Na: d[va] || "",
            url: a || ""
        }
    }function Na(a, b) {function c(b, c) {
            a.contains(b) || a.set(b, []);
            a.get(b)[m](c)
        }
        for (var d = Da(b)[x]("&"), e = 0; e < d[v]; e++) if (d[e]) {
            var f = d[e][q]("=");
            0 > f ? c(d[e], "1") : c(d[e][A](0, f), d[e][A](f + 1))
        }
    }function Pa(a, b) {
        if (E(a) || "[" == a[ma](0) && "]" == a[ma](a[v] - 1)) return "-";
        var c = J.domain;
        return a[q](c + (b && "/" != b ? b : "")) == (0 == a[q]("http://") ? 7 : 0 == a[q]("https://") ? 8 : 0) ? "0" : a
    };
    var Qa = 0;

    function Ra(a, b, c) {
        !(1 <= Qa) && !(1 <= 100 * l.random()) && (a = ["utmt=error", "utmerr=" + a, "utmwv=5.3.3", "utmn=" + Ea(), "utmsp=1"], b && a[m]("api=" + b), c && a[m]("msg=" + G(c[A](0, 100))), L.w && a[m]("aip=1"), Ta(a[B]("&")), Qa++)
    };
    var Ua = 0,
        Va = {};

    function M(a) {
        return Wa("x" + Ua++, a)
    }function Wa(a, b) {
        Va[a] = !! b;
        return a
    }
    var N = M(),
        Xa = M(),
        Ya = M(),
        Za = M(),
        $a = M(),
        O = M(),
        P = M(),
        ab = M(),
        bb = M(),
        cb = M(),
        db = M(),
        eb = M(),
        fb = M(),
        gb = M(),
        hb = M(),
        ib = M(),
        jb = M(),
        kb = M(),
        lb = M(),
        mb = M(),
        nb = M(),
        ob = M(),
        pb = M(),
        qb = M(),
        rb = M(),
        sb = M(),
        tb = M(),
        ub = M(),
        vb = M(),
        wb = M(),
        xb = M(),
        yb = M(),
        zb = M(),
        Ab = M(),
        Bb = M(),
        Q = M(i),
        Cb = Wa("currencyCode"),
        Db = Wa("page"),
        Eb = Wa("title"),
        Fb = M(),
        Gb = M(),
        Hb = M(),
        Ib = M(),
        Jb = M(),
        Kb = M(),
        Lb = M(),
        Mb = M(),
        Nb = M(),
        R = M(i),
        Ob = M(i),
        Rb = M(i),
        Sb = M(i),
        Tb = M(i),
        Ub = M(i),
        Vb = M(i),
        Wb = M(i),
        Xb = M(i),
        Yb = M(i),
        Zb = M(i),
        S = M(i),
        $b = M(i),
        ac = M(i),
        bc = M(i),
        cc = M(i),
        dc = M(i),
        ec = M(i),
        fc = M(i),
        gc = M(i),
        hc = M(i),
        ic = M(i),
        jc = M(i),
        kc = M(i),
        lc = M(i),
        mc = Wa("campaignParams"),
        nc = M(),
        oc = Wa("hitCallback"),
        pc = M();
    M();
    var qc = M(),
        rc = M(),
        sc = M(),
        tc = M(),
        uc = M(),
        vc = M(),
        wc = M(),
        xc = M(),
        yc = M(),
        zc = M(),
        Dc = M(),
        Ec = M();
    M();
    var Fc = M(),
        Gc = M(),
        Hc = M();

    function Ic(a) {
        var b = this.plugins_;
        if (b) return b.get(a)
    }
    var T = function (a, b, c, d) {
            a[b] = function () {
                try {
                    return d != g && H(d), c[ya](this, arguments)
                } catch (a) {
                    throw Ra("exc", b, a && a[r]), a;
                }
            }
        },
        Jc = function (a, b, c, d) {
            U[w][a] = function () {
                try {
                    return H(c), Aa(this.a.get(b), d)
                } catch (e) {
                    throw Ra("exc", a, e && e[r]), e;
                }
            }
        },
        V = function (a, b, c, d, e) {
            U[w][a] = function (f) {
                try {
                    H(c), e == g ? this.a.set(b, Aa(f, d)) : this.a.set(b, e)
                } catch (h) {
                    throw Ra("exc", a, h && h[r]), h;
                }
            }
        };
    var Kc = RegExp(/(^|\.)doubleclick\.net$/i),
        Lc = function (a, b) {
            return Kc[ia](J[y].hostname) ? i : "/" !== b ? k : (0 == a[q]("www.google.") || 0 == a[q](".google.") || 0 == a[q]("google.")) && !(-1 < a[q]("google.org")) ? i : k
        },
        Mc = function (a) {
            var b = a.get($a),
                c = a.c(P, "/");
            Lc(b, c) && a[ta]()
        };
    var Rc = function () {
            var a = {},
                b = {},
                c = new Nc;
            this.i = function (a, b) {
                c.add(a, b)
            };
            var d = new Nc;
            this.e = function (a, b) {
                d.add(a, b)
            };
            var e = k,
                f = k,
                h = i;
            this.T = function () {
                e = i
            };
            this.j = function (a) {
                this[ka]();
                this.set(nc, a, i);
                a = new Oc(this);
                e = k;
                d.execute(this);
                e = i;
                b = {};
                this.n();
                a.Ia()
            };
            this.load = function () {
                e && (e = k, this.Ja(), Pc(this), f || (f = i, c.execute(this), Qc(this), Pc(this)), e = i)
            };
            this.n = function () {
                if (e) if (f) e = k, Qc(this), e = i;
                else this[ka]()
            };
            this.get = function (c) {
                Va[c] && this[ka]();
                return b[c] !== g ? b[c] : a[c]
            };
            this.set = function (c, d, e) {
                Va[c] && this[ka]();
                e ? b[c] = d : a[c] = d;
                Va[c] && this.n()
            };
            this.z = function (b) {
                a[b] = this.b(b, 0) + 1
            };
            this.b = function (a, b) {
                var c = this.get(a);
                return c == g || "" === c ? b : 1 * c
            };
            this.c = function (a, b) {
                var c = this.get(a);
                return c == g ? b : c + ""
            };
            this.Ja = function () {
                if (h) {
                    var b = this.c($a, ""),
                        c = this.c(P, "/");
                    Lc(b, c) || (a[O] = a[fb] && "" != b ? F(b) : 1, h = k)
                }
            }
        };
    Rc[w].stopPropagation = function () {
        throw "aborted";
    };
    var Oc = function (a) {
            var b = this;
            this.q = 0;
            var c = a.get(oc);
            this.Ta = function () {
                0 < b.q && c && (b.q--, b.q || c())
            };
            this.Ia = function () {
                !b.q && c && fa(c, 10)
            };
            a.set(pc, b, i)
        };

    function Sc(a, b) {
        for (var b = b || [], c = 0; c < b[v]; c++) {
            var d = b[c];
            if ("" + a == d || 0 == d[q](a + ".")) return d
        }
        return "-"
    }
    var Uc = function (a, b, c) {
            c = c ? "" : a.c(O, "1");
            b = b[x](".");
            if (6 !== b[v] || Tc(b[0], c)) return k;
            var c = 1 * b[1],
                d = 1 * b[2],
                e = 1 * b[3],
                f = 1 * b[4],
                b = 1 * b[5];
            if (!(0 <= c && 0 < d && 0 < e && 0 < f && 0 <= b)) return H(110), k;
            a.set(R, c);
            a.set(Tb, d);
            a.set(Ub, e);
            a.set(Vb, f);
            a.set(Wb, b);
            return i
        },
        Vc = function (a) {
            var b = a.get(R),
                c = a.get(Tb),
                d = a.get(Ub),
                e = a.get(Vb),
                f = a.b(Wb, 1);
            b == g ? H(113) : NaN == b && H(114);
            0 <= b && 0 < c && 0 < d && 0 < e && 0 <= f || H(115);
            return [a.b(O, 1), b != g ? b : "-", c || "-", d || "-", e || "-", f][B](".")
        },
        Wc = function (a) {
            return [a.b(O, 1), a.b(Zb, 0), a.b(S, 1),
            a.b($b, 0)][B](".")
        },
        Xc = function (a, b, c) {
            var c = c ? "" : a.c(O, "1"),
                d = b[x](".");
            if (4 !== d[v] || Tc(d[0], c)) d = j;
            a.set(Zb, d ? 1 * d[1] : 0);
            a.set(S, d ? 1 * d[2] : 10);
            a.set($b, d ? 1 * d[3] : a.get(Za));
            return d != j || !Tc(b, c)
        },
        Yc = function (a, b) {
            var c = G(a.c(Rb, "")),
                d = [],
                e = a.get(Q);
            if (!b && e) {
                for (var f = 0; f < e[v]; f++) {
                    var h = e[f];
                    h && 1 == h[ua] && d[m](f + "=" + G(h[r]) + "=" + G(h[na]) + "=1")
                }
                0 < d[v] && (c += "|" + d[B]("^"))
            }
            return c ? a.b(O, 1) + "." + c : j
        },
        Zc = function (a, b, c) {
            c = c ? "" : a.c(O, "1");
            b = b[x](".");
            if (2 > b[v] || Tc(b[0], c)) return k;
            b = b[ja](1)[B](".")[x]("|");
            0 < b[v] && a.set(Rb, I(b[0]));
            if (1 >= b[v]) return i;
            b = b[1][x](-1 == b[1][q](",") ? "^" : ",");
            for (c = 0; c < b[v]; c++) {
                var d = b[c][x]("=");
                if (4 == d[v]) {
                    var e = {};
                    ha(e, I(d[1]));
                    e.value = I(d[2]);
                    e.scope = 1;
                    a.get(Q)[d[0]] = e
                }
            }
            return i
        },
        $c = function (a) {
            var b;
            b = function (b, e) {
                if (!E(a.get(b))) {
                    var f = a.c(b, ""),
                        f = f[x](" ")[B]("%20"),
                        f = f[x]("+")[B]("%20");
                    c[m](e + "=" + f)
                }
            };
            var c = [];
            b(ec, "utmcid");
            b(ic, "utmcsr");
            b(gc, "utmgclid");
            b(hc, "utmdclid");
            b(fc, "utmccn");
            b(jc, "utmcmd");
            b(kc, "utmctr");
            b(lc, "utmcct");
            return (b = c[B]("|")) ? [a.b(O, 1),
            a.b(ac, 0), a.b(bc, 1), a.b(cc, 1), b][B](".") : ""
        },
        ad = function (a, b, c) {
            c = c ? "" : a.c(O, "1");
            b = b[x](".");
            if (5 > b[v] || Tc(b[0], c)) return a.set(ac, g), a.set(bc, g), a.set(cc, g), a.set(ec, g), a.set(fc, g), a.set(ic, g), a.set(jc, g), a.set(kc, g), a.set(lc, g), a.set(gc, g), a.set(hc, g), k;
            a.set(ac, 1 * b[1]);
            a.set(bc, 1 * b[2]);
            a.set(cc, 1 * b[3]);
            var d = b[ja](4)[B]("."),
                b = function (a) {
                    return (a = d[oa](a + "=(.*?)(?:\\|utm|$)")) && 2 == a[v] ? a[1] : g
                },
                c = function (b, c) {
                    c && (c = e ? I(c) : c[x]("%20")[B](" "), a.set(b, c))
                }; - 1 == d[q]("=") && (d = I(d));
            var e = "2" == b("utmcvr");
            c(ec, b("utmcid"));
            c(fc, b("utmccn"));
            c(ic, b("utmcsr"));
            c(jc, b("utmcmd"));
            c(kc, b("utmctr"));
            c(lc, b("utmcct"));
            c(gc, b("utmgclid"));
            c(hc, b("utmdclid"));
            return i
        },
        Tc = function (a, b) {
            return b ? a != b : !/^\d+$/ [ia](a)
        };
    var Nc = function () {
            this.B = []
        };
    Nc[w].add = function (a, b) {
        this.B[m]({
            name: a,
            s: b
        })
    };
    Nc[w].execute = function (a) {
        try {
            for (var b = 0; b < this.B[v]; b++) this.B[b].s.call(W, a)
        } catch (c) {}
    };

    function bd(a) {
        100 != a.get(sb) && a.get(R) % 1E4 >= 100 * a.get(sb) && a[ta]()
    }function cd(a) {
        dd(a.get(N)) && a[ta]()
    }function ed(a) {
        "file:" == J[y][z] && a[ta]()
    }function fd(a) {
        a.get(Eb) || a.set(Eb, J.title, i);
        a.get(Db) || a.set(Db, J[y].pathname + J[y][va], i)
    };
    var gd = new function () {
            var a = [];
            this.set = function (b) {
                a[b] = i
            };
            this.Wa = function () {
                for (var b = [], c = 0; c < a[v]; c++) a[c] && (b[l[la](c / 6)] = b[l[la](c / 6)] ^ 1 << c % 6);
                for (c = 0; c < b[v]; c++) b[c] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_" [ma](b[c] || 0);
                return b[B]("") + "~"
            }
        };

    function H(a) {
        gd.set(a)
    };
    var W = window,
        J = document,
        dd = function (a) {
            var b = W._gaUserPrefs;
            return b && b.ioo && b.ioo() || !! a && W["ga-disable-" + a] === i
        },
        hd = function (a) {
            for (var b = [], c = J.cookie[x](";"), a = RegExp("^\\s*" + a + "=\\s*(.*?)\\s*$"), d = 0; d < c[v]; d++) {
                var e = c[d][oa](a);
                e && b[m](e[1])
            }
            return b
        },
        X = function (a, b, c, d, e, f) {
            e = dd(e) ? k : Lc(d, c) ? k : i;
            if (e) {
                if (b && 0 <= W[za].userAgent[q]("Firefox")) for (var b = b[o](/\n|\r/g, " "), e = 0, h = b[v]; e < h; ++e) {
                    var n = b.charCodeAt(e) & 255;
                    if (10 == n || 13 == n) b = b[A](0, e) + "?" + b[A](e + 1)
                }
                b && 2E3 < b[v] && (b = b[A](0, 2E3), H(69));
                a = a + "=" + b + "; path=" + c + "; ";
                f && (a += "expires=" + (new Date((new Date).getTime() + f)).toGMTString() + "; ");
                d && (a += "domain=" + d + ";");
                J.cookie = a
            }
        };
    var id, jd, kd = function () {
            if (!id) {
                var a = {},
                    b = W[za],
                    c = W.screen;
                a.Q = c ? c.width + "x" + c.height : "-";
                a.P = c ? c.colorDepth + "-bit" : "-";
                a.language = (b && (b.language || b.browserLanguage) || "-")[C]();
                a.javaEnabled = b && b.javaEnabled() ? 1 : 0;
                a.characterSet = J.characterSet || J.charset || "-";
                try {
                    var d = J.documentElement,
                        e = J.body,
                        f = e && e[sa] && e[wa],
                        b = [];
                    d && (d[sa] && d[wa]) && ("CSS1Compat" === J.compatMode || !f) ? b = [d[sa], d[wa]] : f && (b = [e[sa], e[wa]]);
                    a.Va = b[B]("x")
                } catch (h) {
                    H(135)
                }
                id = a
            }
        },
        ld = function () {
            kd();
            for (var a = id, b = W[za], a = b.appName + b.version + a.language + b.platform + b.userAgent + a.javaEnabled + a.Q + a.P + (J.cookie ? J.cookie : "") + (J.referrer ? J.referrer : ""), b = a[v], c = W.history[v]; 0 < c;) a += c-- ^ b++;
            return F(a)
        },
        md = function (a) {
            kd();
            var b = id;
            a.set(Hb, b.Q);
            a.set(Ib, b.P);
            a.set(Lb, b.language);
            a.set(Mb, b.characterSet);
            a.set(Jb, b.javaEnabled);
            a.set(Nb, b.Va);
            if (a.get(gb) && a.get(hb)) {
                if (!(b = jd)) {
                    var c, d, e;
                    d = "ShockwaveFlash";
                    if ((b = (b = W[za]) ? b.plugins : g) && 0 < b[v]) for (c = 0; c < b[v] && !e; c++) d = b[c], - 1 < d[r][q]("Shockwave Flash") && (e = d.description[x]("Shockwave Flash ")[1]);
                    else {
                        d = d + "." + d;
                        try {
                            c = new ActiveXObject(d + ".7"), e = c.GetVariable("$version")
                        } catch (f) {}
                        if (!e) try {
                            c = new ActiveXObject(d + ".6"), e = "WIN 6,0,21,0", c.AllowScriptAccess = "always", e = c.GetVariable("$version")
                        } catch (h) {}
                        if (!e) try {
                            c = new ActiveXObject(d), e = c.GetVariable("$version")
                        } catch (n) {}
                        e && (e = e[x](" ")[1][x](","), e = e[0] + "." + e[1] + " r" + e[2])
                    }
                    b = e ? e : "-"
                }
                jd = b;
                a.set(Kb, jd)
            } else a.set(Kb, "-")
        };
    var nd = function (a) {
            if (Ba(a)) this.s = a;
            else {
                var b = a[0],
                    c = b.lastIndexOf(":"),
                    d = b.lastIndexOf(".");
                this.g = this.h = this.l = ""; - 1 == c && -1 == d ? this.g = b : -1 == c && -1 != d ? (this.h = b[A](0, d), this.g = b[A](d + 1)) : -1 != c && -1 == d ? (this.l = b[A](0, c), this.g = b[A](c + 1)) : c > d ? (this.h = b[A](0, d), this.l = b[A](d + 1, c), this.g = b[A](c + 1)) : (this.h = b[A](0, d), this.g = b[A](d + 1));
                this.k = a[ja](1);
                this.Ka = !this.l && "_require" == this.g;
                this.J = !this.h && !this.l && "_provide" == this.g
            }
        },
        Y = function () {
            T(Y[w], "push", Y[w][m], 5);
            T(Y[w], "_getPlugin", Ic, 121);
            T(Y[w], "_createAsyncTracker", Y[w].Ra, 33);
            T(Y[w], "_getAsyncTracker", Y[w].Sa, 34);
            this.I = new Ka;
            this.p = []
        };
    D = Y[w];
    D.Ma = function (a, b, c) {
        var d = this.I.get(a);
        if (!Ba(d)) return k;
        b.plugins_ = b.plugins_ || new Ka;
        b.plugins_.set(a, new d(b, c || {}));
        return i
    };
    D.push = function (a) {
        var b = Z.Ua[ya](this, arguments),
            b = Z.p.concat(b);
        for (Z.p = []; 0 < b[v] && !Z.O(b[0]) && !(b.shift(), 0 < Z.p[v]););
        Z.p = Z.p.concat(b);
        return 0
    };
    D.Ua = function (a) {
        for (var b = [], c = 0; c < arguments[v]; c++) try {
            var d = new nd(arguments[c]);
            d.J ? this.O(d) : b[m](d)
        } catch (e) {}
        return b
    };
    D.O = function (a) {
        try {
            if (a.s) a.s[ya](W);
            else if (a.J) this.I.set(a.k[0], a.k[1]);
            else {
                var b = "_gat" == a.h ? L : "_gaq" == a.h ? Z : L.u(a.h);
                if (a.Ka) {
                    if (!this.Ma(a.k[0], b, a.k[2])) {
                        if (!a.Oa) {
                            var c = Oa("" + a.k[1]);
                            var d = c[z],
                                e = J[y][z];
                            var f;
                            if (f = "https:" == d || d == e ? i : "http:" != d ? k : "http:" == e) {
                                var h;
                                a: {
                                    var n = Oa(J[y][xa]);
                                    if (!(c.Na || 0 <= c.url[q]("?") || 0 <= c[ra][q]("://") || c[t] == n[t] && c[pa] == n[pa])) for (var p = "http:" == c[z] ? 80 : 443, s = L.S, b = 0; b < s[v]; b++) if (c[t] == s[b][0] && (c[pa] || p) == (s[b][1] || p) && 0 == c[ra][q](s[b][2])) {
                                        h = i;
                                        break a
                                    }
                                    h = k
                                }
                                f = h && !dd()
                            }
                            f && (a.Oa = Ia(c.url))
                        }
                        return i
                    }
                } else a.l && (b = b.plugins_.get(a.l)), b[a.g][ya](b, a.k)
            }
        } catch (Sa) {}
    };
    D.Ra = function (a, b) {
        return L.r(a, b || "")
    };
    D.Sa = function (a) {
        return L.u(a)
    };
    var qd = function () {function a(a, b, c, d) {
                g == f[a] && (f[a] = {});
                g == f[a][b] && (f[a][b] = []);
                f[a][b][c] = d
            }function b(a, b, c) {
                if (g != f[a] && g != f[a][b]) return f[a][b][c]
            }function c(a, b) {
                if (g != f[a] && g != f[a][b]) {
                    f[a][b] = g;
                    var c = i,
                        d;
                    for (d = 0; d < h[v]; d++) if (g != f[a][h[d]]) {
                        c = k;
                        break
                    }
                    c && (f[a] = g)
                }
            }function d(a) {
                var b = "",
                    c = k,
                    d, e;
                for (d = 0; d < h[v]; d++) if (e = a[h[d]], g != e) {
                    c && (b += h[d]);
                    for (var c = [], f = g, da = g, da = 0; da < e[v]; da++) if (g != e[da]) {
                        f = "";
                        da != Pb && g == e[da - 1] && (f += da[u]() + Sa);
                        for (var vd = e[da], Ac = "", Qb = g, Bc = g, Cc = g, Qb = 0; Qb < vd[v]; Qb++) Bc = vd[ma](Qb), Cc = ea[Bc], Ac += g != Cc ? Cc : Bc;
                        f += Ac;
                        c[m](f)
                    }
                    b += n + c[B](s) + p;
                    c = k
                } else c = i;
                return b
            }
            var e = this,
                f = [],
                h = ["k", "v"],
                n = "(",
                p = ")",
                s = "*",
                Sa = "!",
                ea = {
                    "'": "'0"
                };
            ea[p] = "'1";
            ea[s] = "'2";
            ea[Sa] = "'3";
            var Pb = 1;
            e.Qa = function (a) {
                return g != f[a]
            };
            e.A = function () {
                for (var a = "", b = 0; b < f[v]; b++) g != f[b] && (a += b[u]() + d(f[b]));
                return a
            };
            e.Pa = function (a) {
                if (a == g) return e.A();
                for (var b = a.A(), c = 0; c < f[v]; c++) g != f[c] && !a.Qa(c) && (b += c[u]() + d(f[c]));
                return b
            };
            e.f = function (b, c, d) {
                if (!od(d)) return k;
                a(b, "k", c, d);
                return i
            };
            e.o = function (b,
            c, d) {
                if (!pd(d)) return k;
                a(b, "v", c, d[u]());
                return i
            };
            e.getKey = function (a, c) {
                return b(a, "k", c)
            };
            e.N = function (a, c) {
                return b(a, "v", c)
            };
            e.L = function (a) {
                c(a, "k")
            };
            e.M = function (a) {
                c(a, "v")
            };
            T(e, "_setKey", e.f, 89);
            T(e, "_setValue", e.o, 90);
            T(e, "_getKey", e.getKey, 87);
            T(e, "_getValue", e.N, 88);
            T(e, "_clearKey", e.L, 85);
            T(e, "_clearValue", e.M, 86)
        };

    function od(a) {
        return "string" == typeof a
    }function pd(a) {
        return "number" != typeof a && (g == Number || !(a instanceof Number)) || l.round(a) != a || NaN == a || a == ba ? k : i
    };
    var rd = function (a) {
            var b = W.gaGlobal;
            a && !b && (W.gaGlobal = b = {});
            return b
        },
        sd = function () {
            var a = rd(i).hid;
            a == j && (a = Ea(), rd(i).hid = a);
            return a
        },
        td = function (a) {
            a.set(Gb, sd());
            var b = rd();
            if (b && b.dh == a.get(O)) {
                var c = b.sid;
                c && ("0" == c && H(112), a.set(Vb, c), a.get(Ob) && a.set(Ub, c));
                b = b.vid;
                a.get(Ob) && b && (b = b[x]("."), 1 * b[1] || H(112), a.set(R, 1 * b[0]), a.set(Tb, 1 * b[1]))
            }
        };
    var wd, xd = function (a, b, c) {
            var d = a.c($a, ""),
                e = a.c(P, "/"),
                f = a.b(ab, 0),
                a = a.c(N, "");
            X(b, c, e, d, a, f)
        },
        Qc = function (a) {
            var b = a.c($a, "");
            a.b(O, 1);
            var c = a.c(P, "/"),
                d = a.c(N, "");
            X("__utma", Vc(a), c, b, d, a.get(ab));
            X("__utmb", Wc(a), c, b, d, a.get(bb));
            X("__utmc", "" + a.b(O, 1), c, b, d);
            var e = $c(a, i);
            e ? X("__utmz", e, c, b, d, a.get(cb)) : X("__utmz", "", c, b, "", - 1);
            (e = Yc(a, k)) ? X("__utmv", e, c, b, d, a.get(ab)) : X("__utmv", "", c, b, "", - 1)
        },
        Pc = function (a) {
            var b = a.b(O, 1);
            if (!Uc(a, Sc(b, hd("__utma")))) return a.set(Sb, i), k;
            var c = !Xc(a, Sc(b, hd("__utmb")));
            a.set(Yb, c);
            ad(a, Sc(b, hd("__utmz")));
            Zc(a, Sc(b, hd("__utmv")));
            wd = !c;
            return i
        },
        yd = function (a) {
            !wd && !(0 < hd("__utmb")[v]) && (X("__utmd", "1", a.c(P, "/"), a.c($a, ""), a.c(N, ""), 1E4), 0 == hd("__utmd")[v] && a[ta]())
        };
    var Bd = function (a) {
            a.get(R) == g ? zd(a) : a.get(Sb) && !a.get(Fc) ? zd(a) : a.get(Yb) && Ad(a)
        },
        Cd = function (a) {
            a.get(dc) && !a.get(Xb) && (Ad(a), a.set(bc, a.get(Wb)))
        },
        zd = function (a) {
            var b = a.get(Za);
            a.set(Ob, i);
            a.set(R, Ea() ^ ld(a) & 2147483647);
            a.set(Rb, "");
            a.set(Tb, b);
            a.set(Ub, b);
            a.set(Vb, b);
            a.set(Wb, 1);
            a.set(Xb, i);
            a.set(Zb, 0);
            a.set(S, 10);
            a.set($b, b);
            a.set(Q, []);
            a.set(Sb, k);
            a.set(Yb, k)
        },
        Ad = function (a) {
            a.set(Ub, a.get(Vb));
            a.set(Vb, a.get(Za));
            a.z(Wb);
            a.set(Xb, i);
            a.set(Zb, 0);
            a.set(S, 10);
            a.set($b, a.get(Za));
            a.set(Yb, k)
        };
    var Dd = "daum:q eniro:search_word naver:query pchome:q images.google:q google:q yahoo:p yahoo:q msn:q bing:q aol:query aol:q lycos:q lycos:query ask:q netscape:query cnn:query about:terms mamma:q voila:rdata virgilio:qs live:q baidu:wd alice:qs yandex:text najdi:q seznam:q rakuten:qt biglobe:q goo.ne:MT wp:szukaj onet:qt yam:k kvasir:q ozu:q terra:query rambler:query conduit:q babylon:q search-results:q avg:q comcast:q incredimail:q startsiden:q go.mail.ru:q search.centrum.cz:q".split(" "),
        Kd = function (a) {
            if (a.get(ib) && !a.get(Fc)) {
                for (var b = !E(a.get(ec)) || !E(a.get(ic)) || !E(a.get(gc)) || !E(a.get(hc)), c = {}, d = 0; d < Ed[v]; d++) {
                    var e = Ed[d];
                    c[e] = a.get(e)
                }(d = a.get(mc)) ? (H(149), e = new Ka, Na(e, d), d = e) : d = Ma(J[y][xa], a.get(eb)).d;
                if (!("1" == Ja(d.get(a.get(rb))) && b)) {
                    var f = d,
                        h = function (b, c) {
                            var c = c || "-",
                                d = Ja(f.get(a.get(b)));
                            return d && d != "-" ? I(d) : c
                        },
                        d = Ja(f.get(a.get(kb))) || "-",
                        e = Ja(f.get(a.get(nb))) || "-",
                        n = Ja(f.get(a.get(mb))) || "-",
                        p = Ja(f.get("dclid")) || "-",
                        s = h(lb, "(not set)"),
                        Sa = h(ob, "(not set)"),
                        ea = h(pb),
                        h = h(qb);
                    if (E(d) && E(n) && E(p) && E(e)) d = k;
                    else {
                        var Pb = !E(p) && E(e),
                            ud = E(ea);
                        if (Pb || ud) {
                            var ca = Fd(a),
                                ca = Ma(ca, i);
                            if ((ca = Gd(a, ca)) && !E(ca[1] && !ca[2])) Pb && (e = ca[0]), ud && (ea = ca[1])
                        }
                        Hd(a, d, e, n, p, s, Sa, ea, h);
                        d = i
                    }
                    d = d || Id(a);
                    !d && (!b && a.get(Xb)) && (Hd(a, g, "(direct)", g, g, "(direct)", "(none)", g, g), d = i);
                    if (d && (a.set(dc, Jd(a, c)), b = "(direct)" == a.get(ic) && "(direct)" == a.get(fc) && "(none)" == a.get(jc), a.get(dc) || a.get(Xb) && !b)) a.set(ac, a.get(Za)), a.set(bc, a.get(Wb)), a.z(cc)
                }
            }
        },
        Id = function (a) {
            var b = Fd(a),
                c = Ma(b, i);
            if (!(b != g && b != j && "" != b && "0" != b && "-" != b && 0 <= b[q]("://")) || c && -1 < c[t][q]("google") && c.d.contains("q") && "cse" == c[ra]) return k;
            if ((b = Gd(a, c)) && !b[2]) return Hd(a, g, b[0], g, g, "(organic)", "organic", b[1], g), i;
            if (b || !a.get(Xb)) return k;
            a: {
                for (var b = a.get(yb), d = La(c[t]), e = 0; e < b[v]; ++e) if (-1 < d[q](b[e])) {
                    a = k;
                    break a
                }
                Hd(a, g, d, g, g, "(referral)", "referral", g, "/" + c[ra]);
                a = i
            }
            return a
        },
        Gd = function (a, b) {
            for (var c = a.get(wb), d = 0; d < c[v]; ++d) {
                var e = c[d][x](":");
                if (-1 < b[t][q](e[0][C]())) {
                    var f = b.d.get(e[1]);
                    if (f && (f = K(f), !f && -1 < b[t][q]("google.") && (f = "(not provided)"), !e[3] || -1 < b.url[q](e[3]))) {
                        a: {
                            for (var c = f, d = a.get(xb), c = I(c)[C](), h = 0; h < d[v]; ++h) if (c == d[h]) {
                                c = i;
                                break a
                            }
                            c = k
                        }
                        return [e[2] || e[0], f, c]
                    }
                }
            }
            return j
        },
        Hd = function (a, b, c, d, e, f, h, n, p) {
            a.set(ec, b);
            a.set(ic, c);
            a.set(gc, d);
            a.set(hc, e);
            a.set(fc, f);
            a.set(jc, h);
            a.set(kc, n);
            a.set(lc, p)
        },
        Ed = [fc, ec, gc, hc, ic, jc, kc, lc],
        Jd = function (a, b) {function c(a) {
                a = ("" + a)[x]("+")[B]("%20");
                return a = a[x](" ")[B]("%20")
            }function d(c) {
                var d = "" + (a.get(c) || ""),
                    c = "" + (b[c] || "");
                return 0 < d[v] && d == c
            }
            if (d(gc) || d(hc)) return H(131), k;
            for (var e = 0; e < Ed[v]; e++) {
                var f = Ed[e],
                    h = b[f] || "-",
                    f = a.get(f) || "-";
                if (c(h) != c(f)) return i
            }
            return k
        },
        Ld = RegExp(/^https:\/\/(www\.)?google(\.com?)?(\.[a-z]{2}t?)?\/?$/i),
        Fd = function (a) {
            a = Pa(a.get(Fb), a.get(P));
            try {
                if (Ld[ia](a)) return H(136), a + "?q="
            } catch (b) {
                H(145)
            }
            return a
        };
    var Nd = function (a) {
            Md(a, J[y][xa]) ? (a.set(Fc, i), H(12)) : a.set(Fc, k)
        },
        Md = function (a, b) {
            if (!a.get(db)) return k;
            var c = Ma(b, a.get(eb)),
                d = K(c.d.get("__utma")),
                e = K(c.d.get("__utmb")),
                f = K(c.d.get("__utmc")),
                h = K(c.d.get("__utmx")),
                n = K(c.d.get("__utmz")),
                p = K(c.d.get("__utmv")),
                c = K(c.d.get("__utmk"));
            if (F("" + d + e + f + h + n + p) != c) {
                d = I(d);
                e = I(e);
                f = I(f);
                h = I(h);
                f = Od(d + e + f + h, n, p, c);
                if (!f) return k;
                n = f[0];
                p = f[1]
            }
            if (!Uc(a, d, i)) return k;
            Xc(a, e, i);
            ad(a, n, i);
            Zc(a, p, i);
            Pd(a, h, i);
            return i
        },
        Rd = function (a, b, c) {
            var d;
            d = Vc(a) || "-";
            var e = Wc(a) || "-",
                f = "" + a.b(O, 1) || "-",
                h = Qd(a) || "-",
                n = $c(a, k) || "-",
                a = Yc(a, k) || "-",
                p = F("" + d + e + f + h + n + a),
                s = [];
            s[m]("__utma=" + d);
            s[m]("__utmb=" + e);
            s[m]("__utmc=" + f);
            s[m]("__utmx=" + h);
            s[m]("__utmz=" + n);
            s[m]("__utmv=" + a);
            s[m]("__utmk=" + p);
            d = s[B]("&");
            if (!d) return b;
            e = b[q]("#");
            if (c) return 0 > e ? b + "#" + d : b + "&" + d;
            c = "";
            f = b[q]("?");
            0 < e && (c = b[A](e), b = b[A](0, e));
            return 0 > f ? b + "?" + d + c : b + "&" + d + c
        },
        Od = function (a, b, c, d) {
            for (var e = 0; 3 > e; e++) {
                for (var f = 0; 3 > f; f++) {
                    if (d == F(a + b + c)) return H(127), [b, c];
                    var h = b[o](/ /g, "%20"),
                        n = c[o](/ /g, "%20");
                    if (d == F(a + h + n)) return H(128), [h, n];
                    h = h[o](/\+/g, "%20");
                    n = n[o](/\+/g, "%20");
                    if (d == F(a + h + n)) return H(129), [h, n];
                    try {
                        var p = b[oa]("utmctr=(.*?)(?:\\|utm|$)");
                        if (p && 2 == p[v] && (h = b[o](p[1], G(I(p[1]))), d == F(a + h + c))) return H(139), [h, c]
                    } catch (s) {}
                    b = I(b)
                }
                c = I(c)
            }
        };
    var Sd = "|",
        Ud = function (a, b, c, d, e, f, h, n, p) {
            var s = Td(a, b);
            s || (s = {}, a.get(zb)[m](s));
            s.id_ = b;
            s.affiliation_ = c;
            s.total_ = d;
            s.tax_ = e;
            s.shipping_ = f;
            s.city_ = h;
            s.state_ = n;
            s.country_ = p;
            s.items_ = s.items_ || [];
            return s
        },
        Vd = function (a, b, c, d, e, f, h) {
            var a = Td(a, b) || Ud(a, b, "", 0, 0, 0, "", "", ""),
                n;
            a: {
                if (a && a.items_) {
                    n = a.items_;
                    for (var p = 0; p < n[v]; p++) if (n[p].sku_ == c) {
                        n = n[p];
                        break a
                    }
                }
                n = j
            }
            p = n || {};
            p.transId_ = b;
            p.sku_ = c;
            p.name_ = d;
            p.category_ = e;
            p.price_ = f;
            p.quantity_ = h;
            n || a.items_[m](p);
            return p
        },
        Td = function (a, b) {
            for (var c = a.get(zb), d = 0; d < c[v]; d++) if (c[d].id_ == b) return c[d];
            return j
        };
    var Wd, Xd = function (a) {
            if (!Wd) {
                var b;
                b = J[y].hash;
                var c = W[r],
                    d = /^#?gaso=([^&]*)/;
                if (c = (b = (b = b && b[oa](d) || c && c[oa](d)) ? b[1] : K(hd("GASO"))) && b[oa](/^(?:[|!]([-0-9a-z.]{1,40})[|!])?([-.\w]{10,1200})$/i)) xd(a, "GASO", "" + b), L._gasoDomain = a.get($a), L._gasoCPath = a.get(P), a = c[1], Ia("https://www.google.com/analytics/web/inpage/pub/inpage.js?" + (a ? "prefix=" + a + "&" : "") + Ea(), "_gasojs");
                Wd = i
            }
        };
    var Pd = function (a, b, c) {
            c && (b = I(b));
            c = a.b(O, 1);
            b = b[x](".");
            !(2 > b[v]) && /^\d+$/ [ia](b[0]) && (b[0] = "" + c, xd(a, "__utmx", b[B](".")))
        },
        Qd = function (a, b) {
            var c = Sc(a.get(O), hd("__utmx"));
            "-" == c && (c = "");
            return b ? G(c) : c
        };
    var Zd = function (a, b) {
            var c = l.min(a.b(yc, 0), 100);
            if (a.b(R, 0) % 100 >= c) return k;
            var d;
            if (c = (c = W.performance || W.webkitPerformance) && c.timing) {
                var e = c.navigationStart;
                0 == e ? H(133) : d = [c.loadEventStart - e, c.domainLookupEnd - c.domainLookupStart, c.connectEnd - c.connectStart, c.responseStart - c.requestStart, c.responseEnd - c.responseStart, c.fetchStart - e]
            }
            d || (W.top != W ? d = g : (c = (d = W.external) && d.onloadT, d && !d.isValidLoadTime && (c = g), 2147483648 < c && (c = g), 0 < c && d.setPageReadyTime(), d = c == g ? g : [c]));
            if (d == g) return k;
            c = d[0];
            if (c == g || c == ba || isNaN(c)) return k;
            if (0 < c) {
                a: {
                    for (c = 1; c < d[v]; c++) if (isNaN(d[c]) || d[c] == ba || 0 > d[c]) {
                        c = k;
                        break a
                    }
                    c = i
                }
                c ? b(Yd(d)) : b(Yd(d[ja](0, 1)))
            } else Ga(W, "load", function () {
                Zd(a, b)
            }, k);
            return i
        },
        ae = function (a, b, c, d) {
            var e = new qd;
            e.f(14, 90, b[A](0, 64));
            e.f(14, 91, a[A](0, 64));
            e.f(14, 92, "" + $d(c));
            d != g && e.f(14, 93, d[A](0, 64));
            e.o(14, 90, c);
            return e
        },
        $d = function (a) {
            return isNaN(a) || 0 > a ? 0 : 5E3 > a ? 10 * l[la](a / 10) : 5E4 > a ? 100 * l[la](a / 100) : 41E5 > a ? 1E3 * l[la](a / 1E3) : 41E5
        },
        Yd = function (a) {
            for (var b = new qd, c = 0; c < a[v]; c++) b.f(14,
            c + 1, "" + $d(a[c])), b.o(14, c + 1, a[c]);
            return b
        };
    var U = function (a, b, c) {function d(a) {
                return function (b) {
                    if ((b = b.get(Gc)[a]) && b[v]) for (var c = {
                        type: a,
                        target: e,
                        stopPropagation: function () {
                            throw "aborted";
                        }
                    }, d = 0; d < b[v]; d++) b[d].call(e, c)
                }
            }
            var e = this;
            this.a = new Rc;
            this.get = function (a) {
                return this.a.get(a)
            };
            this.set = function (a, b, c) {
                this.a.set(a, b, c)
            };
            this.set(N, b || "UA-XXXXX-X");
            this.set(Ya, a || "");
            this.set(Xa, c || "");
            this.set(Za, l.round((new Date).getTime() / 1E3));
            this.set(P, "/");
            this.set(ab, 63072E6);
            this.set(cb, 15768E6);
            this.set(bb, 18E5);
            this.set(db, k);
            this.set(vb,
            50);
            this.set(eb, k);
            this.set(fb, i);
            this.set(gb, i);
            this.set(hb, i);
            this.set(ib, i);
            this.set(jb, i);
            this.set(lb, "utm_campaign");
            this.set(kb, "utm_id");
            this.set(mb, "gclid");
            this.set(nb, "utm_source");
            this.set(ob, "utm_medium");
            this.set(pb, "utm_term");
            this.set(qb, "utm_content");
            this.set(rb, "utm_nooverride");
            this.set(sb, 100);
            this.set(yc, 1);
            this.set(zc, k);
            this.set(tb, "/__utm.gif");
            this.set(ub, 1);
            this.set(zb, []);
            this.set(Q, []);
            this.set(wb, Dd[ja](0));
            this.set(xb, []);
            this.set(yb, []);
            this.C("auto");
            this.set(Fb, J.referrer);
            a = this.a;
            try {
                var f = Ma(J[y][xa], k),
                    h = ga(Ja(f.d.get("utm_referrer"))) || "";
                h && a.set(Fb, h);
                var n = ga(K(f.d.get("utm_expid")));
                n && a.set(Hc, n)
            } catch (p) {
                H(146)
            }
            this.set(Gc, {
                hit: [],
                load: []
            });
            this.a.i("0", Nd);
            this.a.i("1", Bd);
            this.a.i("2", Kd);
            this.a.i("3", Cd);
            this.a.i("4", d("load"));
            this.a.i("5", Xd);
            this.a.e("A", cd);
            this.a.e("B", ed);
            this.a.e("C", Bd);
            this.a.e("D", bd);
            this.a.e("E", Mc);
            this.a.e("F", be);
            this.a.e("G", yd);
            this.a.e("H", fd);
            this.a.e("I", md);
            this.a.e("J", td);
            this.a.e("K", d("hit"));
            this.a.e("L", ce);
            this.a.e("M", de);
            0 === this.get(Za) && H(111);
            this.a.T();
            this.H = g
        };
    D = U[w];
    D.m = function () {
        var a = this.get(Ab);
        a || (a = new qd, this.set(Ab, a));
        return a
    };
    D.La = function (a) {
        for (var b in a) {
            var c = a[b];
            a.hasOwnProperty(b) && this.set(b, c, i)
        }
    };
    D.K = function (a) {
        if (this.get(zc)) return k;
        var b = this,
            c = Zd(this.a, function (c) {
                b.set(Db, a, i);
                b.t(c)
            });
        this.set(zc, c);
        return c
    };
    D.Ea = function (a) {
        a && Ca(a) ? (H(13), this.set(Db, a, i)) : "object" === typeof a && a !== j && this.La(a);
        this.H = a = this.get(Db);
        this.a.j("page");
        this.K(a)
    };
    D.G = function (a, b, c, d, e) {
        if ("" == a || (!od(a) || "" == b || !od(b)) || c != g && !od(c) || d != g && !pd(d)) return k;
        this.set(rc, a, i);
        this.set(sc, b, i);
        this.set(tc, c, i);
        this.set(uc, d, i);
        this.set(qc, !! e, i);
        this.a.j("event");
        return i
    };
    D.Ga = function (a, b, c, d, e) {
        var f = this.a.b(yc, 0);
        1 * e === e && (f = e);
        if (this.a.b(R, 0) % 100 >= f) return k;
        c = 1 * ("" + c);
        if ("" == a || (!od(a) || "" == b || !od(b) || !pd(c) || isNaN(c) || 0 > c || 0 > f || 100 < f) || d != g && ("" == d || !od(d))) return k;
        this.t(ae(a, b, c, d));
        return i
    };
    D.Fa = function (a, b, c, d) {
        if (!a || !b) return k;
        this.set(vc, a, i);
        this.set(wc, b, i);
        this.set(xc, c || J[y][xa], i);
        d && this.set(Db, d, i);
        this.a.j("social");
        return i
    };
    D.Da = function () {
        this.set(yc, 10);
        this.K(this.H)
    };
    D.Ha = function () {
        this.a.j("trans")
    };
    D.t = function (a) {
        this.set(Bb, a, i);
        this.a.j("event")
    };
    D.ia = function (a) {
        this.v();
        var b = this;
        return {
            _trackEvent: function (c, d, e) {
                H(91);
                b.G(a, c, d, e)
            }
        }
    };
    D.la = function (a) {
        return this.get(a)
    };
    D.wa = function (a, b) {
        if (a) if (Ca(a)) this.set(a, b);
        else if ("object" == typeof a) for (var c in a) a.hasOwnProperty(c) && this.set(c, a[c])
    };
    D.addEventListener = function (a, b) {
        var c = this.get(Gc)[a];
        c && c[m](b)
    };
    D.removeEventListener = function (a, b) {
        for (var c = this.get(Gc)[a], d = 0; c && d < c[v]; d++) if (c[d] == b) {
            c.splice(d, 1);
            break
        }
    };
    D.pa = function () {
        return "5.3.3"
    };
    D.C = function (a) {
        this.get(fb);
        a = "auto" == a ? La(J.domain) : !a || "-" == a || "none" == a ? "" : a[C]();
        this.set($a, a)
    };
    D.ua = function (a) {
        this.set(fb, !! a)
    };
    D.ma = function (a, b) {
        return Rd(this.a, a, b)
    };
    D.link = function (a, b) {
        if (this.a.get(db) && a) {
            var c = Rd(this.a, a, b);
            J[y].href = c
        }
    };
    D.ta = function (a, b) {
        this.a.get(db) && (a && a.action) && (a.action = Rd(this.a, a.action, b))
    };
    D.ya = function () {
        this.v();
        var a = this.a,
            b = J.getElementById ? J.getElementById("utmtrans") : J.utmform && J.utmform.utmtrans ? J.utmform.utmtrans : j;
        if (b && b[na]) {
            a.set(zb, []);
            for (var b = b[na][x]("UTM:"), c = 0; c < b[v]; c++) {
                b[c] = Da(b[c]);
                for (var d = b[c][x](Sd), e = 0; e < d[v]; e++) d[e] = Da(d[e]);
                "T" == d[0] ? Ud(a, d[1], d[2], d[3], d[4], d[5], d[6], d[7], d[8]) : "I" == d[0] && Vd(a, d[1], d[2], d[3], d[4], d[5], d[6])
            }
        }
    };
    D.$ = function (a, b, c, d, e, f, h, n) {
        return Ud(this.a, a, b, c, d, e, f, h, n)
    };
    D.Y = function (a, b, c, d, e, f) {
        return Vd(this.a, a, b, c, d, e, f)
    };
    D.za = function (a) {
        Sd = a || "|"
    };
    D.ea = function () {
        this.set(zb, [])
    };
    D.va = function (a, b, c, d) {
        var e = this.a;
        if (0 >= a || a > e.get(vb)) a = k;
        else if (!b || !c || 128 < b[v] + c[v]) a = k;
        else {
            1 != d && 2 != d && (d = 3);
            var f = {};
            ha(f, b);
            f.value = c;
            f.scope = d;
            e.get(Q)[a] = f;
            a = i
        }
        a && this.a.n();
        return a
    };
    D.ka = function (a) {
        this.a.get(Q)[a] = g;
        this.a.n()
    };
    D.qa = function (a) {
        return (a = this.a.get(Q)[a]) && 1 == a[ua] ? a[na] : g
    };
    D.Ba = function (a, b, c) {
        this.m().f(a, b, c)
    };
    D.Ca = function (a, b, c) {
        this.m().o(a, b, c)
    };
    D.ra = function (a, b) {
        return this.m().getKey(a, b)
    };
    D.sa = function (a, b) {
        return this.m().N(a, b)
    };
    D.fa = function (a) {
        this.m().L(a)
    };
    D.ga = function (a) {
        this.m().M(a)
    };
    D.ja = function () {
        return new qd
    };
    D.W = function (a) {
        a && this.get(xb)[m](a[C]())
    };
    D.ba = function () {
        this.set(xb, [])
    };
    D.X = function (a) {
        a && this.get(yb)[m](a[C]())
    };
    D.ca = function () {
        this.set(yb, [])
    };
    D.Z = function (a, b, c, d, e) {
        if (a && b) {
            a = [a, b[C]()][B](":");
            if (d || e) a = [a, d, e][B](":");
            d = this.get(wb);
            d.splice(c ? 0 : d[v], 0, a)
        }
    };
    D.da = function () {
        this.set(wb, [])
    };
    D.ha = function (a) {
        this.a[ka]();
        var b = this.get(P),
            c = Qd(this.a);
        this.set(P, a);
        this.a.n();
        Pd(this.a, c);
        this.set(P, b)
    };
    D.xa = function (a, b) {
        if (0 < a && 5 >= a && Ca(b) && "" != b) {
            var c = this.get(Dc) || [];
            c[a] = b;
            this.set(Dc, c)
        }
    };
    D.V = function (a) {
        a = "" + a;
        if (a[oa](/^[A-Za-z0-9]{1,5}$/)) {
            var b = this.get(Ec) || [];
            b[m](a);
            this.set(Ec, b)
        }
    };
    D.v = function () {
        this.a[ka]()
    };
    D.Aa = function (a) {
        a && "" != a && (this.set(Rb, a), this.a.j("var"))
    };
    var be = function (a) {
            "trans" !== a.get(nc) && 500 <= a.b(Zb, 0) && a[ta]();
            if ("event" === a.get(nc)) {
                var b = (new Date).getTime(),
                    c = a.b($b, 0),
                    d = a.b(Vb, 0),
                    c = l[la](1 * ((b - (c != d ? c : 1E3 * c)) / 1E3));
                0 < c && (a.set($b, b), a.set(S, l.min(10, a.b(S, 0) + c)));
                0 >= a.b(S, 0) && a[ta]()
            }
        },
        de = function (a) {
            "event" === a.get(nc) && a.set(S, l.max(0, a.b(S, 10) - 1))
        };
    var ee = function () {
            var a = [];
            this.add = function (b, c, d) {
                d && (c = G("" + c));
                a[m](b + "=" + c)
            };
            this.toString = function () {
                return a[B]("&")
            }
        },
        fe = function (a, b) {
            (b || 2 != a.get(ub)) && a.z(Zb)
        },
        ge = function (a, b) {
            b.add("utmwv", "5.3.3");
            b.add("utms", a.get(Zb));
            b.add("utmn", Ea());
            var c = J[y].hostname;
            E(c) || b.add("utmhn", c, i);
            c = a.get(sb);
            100 != c && b.add("utmsp", c, i)
        },
        he = function (a, b) {
            b.add("utmac", Da(a.get(N)));
            a.get(Hc) && b.add("utmxkey", a.get(Hc), i);
            a.get(qc) && b.add("utmni", 1);
            var c = a.get(Ec);
            c && 0 < c[v] && b.add("utmdid", c[B]("."));
            var c = function (a, b) {
                    b && d[m](a + "=" + b + ";")
                },
                d = [];
            c("__utma", Vc(a));
            c("__utmz", $c(a, k));
            c("__utmv", Yc(a, i));
            c("__utmx", Qd(a));
            b.add("utmcc", d[B]("+"), i);
            L.w && b.add("aip", 1);
            b.add("utmu", gd.Wa())
        },
        ie = function (a, b) {
            for (var c = a.get(Dc) || [], d = [], e = 1; e < c[v]; e++) c[e] && d[m](e + ":" + G(c[e][o](/%/g, "%25")[o](/:/g, "%3A")[o](/,/g, "%2C")));
            d[v] && b.add("utmpg", d[B](","))
        },
        je = function (a, b) {
            a.get(gb) && (b.add("utmcs", a.get(Mb), i), b.add("utmsr", a.get(Hb)), a.get(Nb) && b.add("utmvp", a.get(Nb)), b.add("utmsc", a.get(Ib)), b.add("utmul",
            a.get(Lb)), b.add("utmje", a.get(Jb)), b.add("utmfl", a.get(Kb), i))
        },
        ke = function (a, b) {
            a.get(jb) && a.get(Eb) && b.add("utmdt", a.get(Eb), i);
            b.add("utmhid", a.get(Gb));
            b.add("utmr", Pa(a.get(Fb), a.get(P)), i);
            b.add("utmp", G(a.get(Db), i), i)
        },
        le = function (a, b) {
            for (var c = a.get(Ab), d = a.get(Bb), e = a.get(Q) || [], f = 0; f < e[v]; f++) {
                var h = e[f];
                h && (c || (c = new qd), c.f(8, f, h[r]), c.f(9, f, h[na]), 3 != h[ua] && c.f(11, f, "" + h[ua]))
            }!E(a.get(rc)) && !E(a.get(sc), i) && (c || (c = new qd), c.f(5, 1, a.get(rc)), c.f(5, 2, a.get(sc)), e = a.get(tc), e != g && c.f(5,
            3, e), e = a.get(uc), e != g && c.o(5, 1, e));
            c ? b.add("utme", c.Pa(d), i) : d && b.add("utme", d.A(), i)
        },
        me = function (a, b, c) {
            var d = new ee;
            fe(a, c);
            ge(a, d);
            d.add("utmt", "tran");
            d.add("utmtid", b.id_, i);
            d.add("utmtst", b.affiliation_, i);
            d.add("utmtto", b.total_, i);
            d.add("utmttx", b.tax_, i);
            d.add("utmtsp", b.shipping_, i);
            d.add("utmtci", b.city_, i);
            d.add("utmtrg", b.state_, i);
            d.add("utmtco", b.country_, i);
            (b = a.get(Cb)) && d.add("utmcu", b, i);
            c || (ie(a, d), he(a, d));
            return d[u]()
        },
        ne = function (a, b, c) {
            var d = new ee;
            fe(a, c);
            ge(a, d);
            d.add("utmt", "item");
            d.add("utmtid", b.transId_, i);
            d.add("utmipc", b.sku_, i);
            d.add("utmipn", b.name_, i);
            d.add("utmiva", b.category_, i);
            d.add("utmipr", b.price_, i);
            d.add("utmiqt", b.quantity_, i);
            (b = a.get(Cb)) && d.add("utmcu", b, i);
            c || (ie(a, d), he(a, d));
            return d[u]()
        },
        oe = function (a, b) {
            var c = a.get(nc);
            if ("page" == c) c = new ee, fe(a, b), ge(a, c), le(a, c), je(a, c), ke(a, c), b || (ie(a, c), he(a, c)), c = [c[u]()];
            else if ("event" == c) c = new ee, fe(a, b), ge(a, c), c.add("utmt", "event"), le(a, c), je(a, c), ke(a, c), b || (ie(a, c), he(a, c)), c = [c[u]()];
            else if ("var" == c) c = new ee, fe(a, b), ge(a, c), c.add("utmt", "var"), !b && he(a, c), c = [c[u]()];
            else if ("trans" == c) for (var c = [], d = a.get(zb), e = 0; e < d[v]; ++e) {
                c[m](me(a, d[e], b));
                for (var f = d[e].items_, h = 0; h < f[v]; ++h) c[m](ne(a, f[h], b))
            } else "social" == c ? b ? c = [] : (c = new ee, fe(a, b), ge(a, c), c.add("utmt", "social"), c.add("utmsn", a.get(vc), i), c.add("utmsa", a.get(wc), i), c.add("utmsid", a.get(xc), i), le(a, c), je(a, c), ke(a, c), ie(a, c), he(a, c), c = [c[u]()]) : c = [];
            return c
        },
        ce = function (a) {
            var b, c = a.get(ub),
                d = a.get(pc),
                e = d && d.Ta,
                f = 0;
            if (0 == c || 2 == c) {
                var h = a.get(tb) + "?";
                b = oe(a, i);
                for (var n = 0, p = b[v]; n < p; n++) Ta(b[n], e, h, i), f++
            }
            if (1 == c || 2 == c) {
                b = oe(a);
                n = 0;
                for (p = b[v]; n < p; n++) try {
                    Ta(b[n], e), f++
                } catch (s) {
                    s && Ra(s[r], g, s.message)
                }
            }
            d && (d.q = f)
        };
    var pe = "https:" == J[y][z] ? "https://ssl.google-analytics.com" : "http://www.google-analytics.com",
        qe = function (a) {
            ha(this, "len");
            this.message = a + "-8192"
        },
        re = function (a) {
            ha(this, "ff2post");
            this.message = a + "-2036"
        },
        Ta = function (a, b, c, d) {
            b = b || Fa;
            if (d || 2036 >= a[v]) {
                var e = b,
                    f;
                f = c || pe + "/__utm.gif?";
                var h = new Image(1, 1);
                h.src = f + a;
                h.onload = function () {
                    h.onload = j;
                    h.onerror = j;
                    e()
                };
                h.onerror = function () {
                    h.onload = j;
                    h.onerror = j;
                    e()
                }
            } else if (8192 >= a[v]) {
                var n = b;
                if (0 <= W[za].userAgent[q]("Firefox") && ![].reduce) throw new re(a[v]);
                var p, b = pe + "/p/__utm.gif";
                if (c = W.XDomainRequest) p = new c, p.open("POST", b);
                else if (c = W.XMLHttpRequest) c = new c, "withCredentials" in c && (p = c, p.open("POST", b, i), p.setRequestHeader("Content-Type", "text/plain"));
                p && (p.onreadystatechange = function () {
                    4 == p.readyState && (n(), p = j)
                }, p.send(a), f = i);
                f || se(a, n)
            } else throw new qe(a[v]);
        },
        se = function (a, b) {
            if (J.body) {
                a = aa(a);
                try {
                    var c = J[qa]('<iframe name="' + a + '"></iframe>')
                } catch (d) {
                    c = J[qa]("iframe"), ha(c, a)
                }
                c.height = "0";
                c.width = "0";
                c.style.display = "none";
                c.style.visibility = "hidden";
                var e = J[y],
                    e = pe + "/u/post_iframe.html#" + aa(e[z] + "//" + e[t] + "/favicon.ico"),
                    f = function () {
                        c.src = "";
                        c.parentNode && c.parentNode.removeChild(c)
                    };
                Ga(W, "beforeunload", f);
                var h = k,
                    n = 0,
                    p = function () {
                        if (!h) {
                            try {
                                if (9 < n || c.contentWindow[y][t] == J[y][t]) {
                                    h = i;
                                    f();
                                    Ha(W, "beforeunload", f);
                                    b();
                                    return
                                }
                            } catch (a) {}
                            n++;
                            fa(p, 200)
                        }
                    };
                Ga(c, "load", p);
                J.body.appendChild(c);
                c.src = e
            } else fa(function () {
                se(a, b)
            }, 100)
        };
    var $ = function () {
            this.w = k;
            this.D = {};
            this.F = [];
            this.U = 0;
            this.S = [
                ["www.google-analytics.com", "", "/plugins/"]
            ];
            this._gasoCPath = this._gasoDomain = g;
            T($[w], "_createTracker", $[w].r, 55);
            T($[w], "_getTracker", $[w].na, 0);
            T($[w], "_getTrackerByName", $[w].u, 51);
            T($[w], "_getTrackers", $[w].oa, 130);
            T($[w], "_anonymizeIp", $[w].aa, 16);
            T($[w], "_getPlugin", Ic, 120);
            var a = function (a, c, d) {
                    T(U[w], a, c, d)
                };
            Jc("_getName", Ya, 58);
            Jc("_getAccount", N, 64);
            Jc("_visitCode", R, 54);
            Jc("_getClientInfo", gb, 53, 1);
            Jc("_getDetectTitle", jb,
            56, 1);
            Jc("_getDetectFlash", hb, 65, 1);
            Jc("_getLocalGifPath", tb, 57);
            Jc("_getServiceMode", ub, 59);
            V("_setClientInfo", gb, 66, 2);
            V("_setAccount", N, 3);
            V("_setNamespace", Xa, 48);
            V("_setAllowLinker", db, 11, 2);
            V("_setDetectFlash", hb, 61, 2);
            V("_setDetectTitle", jb, 62, 2);
            V("_setLocalGifPath", tb, 46, 0);
            V("_setLocalServerMode", ub, 92, g, 0);
            V("_setRemoteServerMode", ub, 63, g, 1);
            V("_setLocalRemoteServerMode", ub, 47, g, 2);
            V("_setSampleRate", sb, 45, 1);
            V("_setCampaignTrack", ib, 36, 2);
            V("_setAllowAnchor", eb, 7, 2);
            V("_setCampNameKey",
            lb, 41);
            V("_setCampContentKey", qb, 38);
            V("_setCampIdKey", kb, 39);
            V("_setCampMediumKey", ob, 40);
            V("_setCampNOKey", rb, 42);
            V("_setCampSourceKey", nb, 43);
            V("_setCampTermKey", pb, 44);
            V("_setCampCIdKey", mb, 37);
            V("_setCookiePath", P, 9, 0);
            V("_setMaxCustomVariables", vb, 0, 1);
            V("_setVisitorCookieTimeout", ab, 28, 1);
            V("_setSessionCookieTimeout", bb, 26, 1);
            V("_setCampaignCookieTimeout", cb, 29, 1);
            V("_setReferrerOverride", Fb, 49);
            V("_setSiteSpeedSampleRate", yc, 132);
            a("_trackPageview", U[w].Ea, 1);
            a("_trackEvent", U[w].G, 4);
            a("_trackPageLoadTime",
            U[w].Da, 100);
            a("_trackSocial", U[w].Fa, 104);
            a("_trackTrans", U[w].Ha, 18);
            a("_sendXEvent", U[w].t, 78);
            a("_createEventTracker", U[w].ia, 74);
            a("_getVersion", U[w].pa, 60);
            a("_setDomainName", U[w].C, 6);
            a("_setAllowHash", U[w].ua, 8);
            a("_getLinkerUrl", U[w].ma, 52);
            a("_link", U[w].link, 101);
            a("_linkByPost", U[w].ta, 102);
            a("_setTrans", U[w].ya, 20);
            a("_addTrans", U[w].$, 21);
            a("_addItem", U[w].Y, 19);
            a("_clearTrans", U[w].ea, 105);
            a("_setTransactionDelim", U[w].za, 82);
            a("_setCustomVar", U[w].va, 10);
            a("_deleteCustomVar", U[w].ka,
            35);
            a("_getVisitorCustomVar", U[w].qa, 50);
            a("_setXKey", U[w].Ba, 83);
            a("_setXValue", U[w].Ca, 84);
            a("_getXKey", U[w].ra, 76);
            a("_getXValue", U[w].sa, 77);
            a("_clearXKey", U[w].fa, 72);
            a("_clearXValue", U[w].ga, 73);
            a("_createXObj", U[w].ja, 75);
            a("_addIgnoredOrganic", U[w].W, 15);
            a("_clearIgnoredOrganic", U[w].ba, 97);
            a("_addIgnoredRef", U[w].X, 31);
            a("_clearIgnoredRef", U[w].ca, 32);
            a("_addOrganic", U[w].Z, 14);
            a("_clearOrganic", U[w].da, 70);
            a("_cookiePathCopy", U[w].ha, 30);
            a("_get", U[w].la, 106);
            a("_set", U[w].wa, 107);
            a("_addEventListener",
            U[w].addEventListener, 108);
            a("_removeEventListener", U[w].removeEventListener, 109);
            a("_addDevId", U[w].V);
            a("_getPlugin", Ic, 122);
            a("_setPageGroup", U[w].xa, 126);
            a("_trackTiming", U[w].Ga, 124);
            a("_initData", U[w].v, 2);
            a("_setVar", U[w].Aa, 22);
            V("_setSessionTimeout", bb, 27, 3);
            V("_setCookieTimeout", cb, 25, 3);
            V("_setCookiePersistence", ab, 24, 1);
            a("_setAutoTrackOutbound", Fa, 79);
            a("_setTrackOutboundSubdomains", Fa, 81);
            a("_setHrefExamineLimit", Fa, 80)
        };
    D = $[w];
    D.na = function (a, b) {
        return this.r(a, g, b)
    };
    D.r = function (a, b, c) {
        b && H(23);
        c && H(67);
        b == g && (b = "~" + L.U++);
        a = new U(b, a, c);
        L.D[b] = a;
        L.F[m](a);
        return a
    };
    D.u = function (a) {
        a = a || "";
        return L.D[a] || L.r(g, a)
    };
    D.oa = function () {
        return L.F[ja](0)
    };
    D.aa = function () {
        this.w = i
    };
    var te = function (a) {
            if ("prerender" == J.webkitVisibilityState) return k;
            a();
            return i
        };
    var L = new $;
    var ue = W._gat;
    ue && Ba(ue._getTracker) ? L = ue : W._gat = L;
    var Z = new Y;
    var ve = function () {
            var a = W._gaq,
                b = k;
            if (a && Ba(a[m]) && (b = "[object Array]" == Object[w][u].call(Object(a)), !b)) {
                Z = a;
                return
            }
            W._gaq = Z;
            b && Z[m][ya](Z, a)
        };
    if (!te(ve)) {
        H(123);
        var we = k,
            xe = function () {
                !we && te(ve) && (we = i, Ha(J, "webkitvisibilitychange", xe))
            };
        Ga(J, "webkitvisibilitychange", xe)
    };
})();