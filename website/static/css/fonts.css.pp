#lang pollen

◊(define (define-font #:directory [dir "/static/fonts/"] #:format [fmt "truetype"] name)
	(define font-path (string-trim name "A"))
	(for/splice ([w (list 2 3 4 5 6 7 8)])
		(for/splice ([s (list "regular" "italic")])
			(format "@font-face {\n  font-family: '~a';\n  font-weight: ~a00;\n  font-style: ~a;\n  src: url('~a~a.ttf') format('~a');\n}\n\n" name w s dir font-path fmt)
		)))

◊; ◊(define-font "Alegreya")

@font-face {
	font-family: 'Crimson';
	font-weight: 200;
	font-style: regular;
	src: url('/static/fonts/CrimsonPro-ExtraLight.ttf') format('truetype');
}

@font-face {
	font-family: 'Crimson';
	font-weight: 200;
	font-style: italic;
	src: url('/static/fonts/CrimsonPro-ExtraLightItalic.ttf') format('truetype');
}

@font-face {
	font-family: 'Crimson';
	font-weight: 300;
	font-style: regular;
	src: url('/static/fonts/CrimsonPro-Light.ttf') format('truetype');
}

@font-face {
	font-family: 'Crimson';
	font-weight: 300;
	font-style: italic;
	src: url('/static/fonts/CrimsonPro-LightItalic.ttf') format('truetype');
}

@font-face {
	font-family: 'Crimson';
	font-weight: 400;
	font-style: regular;
	src: url('/static/fonts/CrimsonPro-Regular.ttf') format('truetype');
}

@font-face {
	font-family: 'Crimson';
	font-weight: 400;
	font-style: italic;
	src: url('/static/fonts/CrimsonPro-Italic.ttf') format('truetype');
}

@font-face {
	font-family: 'Crimson';
	font-weight: 500;
	font-style: regular;
	src: url('/static/fonts/CrimsonPro-Medium.ttf') format('truetype');
}

@font-face {
	font-family: 'Crimson';
	font-weight: 500;
	font-style: italic;
	src: url('/static/fonts/CrimsonPro-MediumItalic.ttf') format('truetype');
}

@font-face {
	font-family: 'Crimson';
	font-weight: 600;
	font-style: regular;
	src: url('/static/fonts/CrimsonPro-SemiBold.ttf') format('truetype');
}

@font-face {
	font-family: 'Crimson';
	font-weight: 600;
	font-style: italic;
	src: url('/static/fonts/CrimsonPro-SemiBoldItalic.ttf') format('truetype');
}

@font-face {
	font-family: 'Crimson';
	font-weight: 700;
	font-style: regular;
	src: url('/static/fonts/CrimsonPro-Bold.ttf') format('truetype');
}

@font-face {
	font-family: 'Crimson';
	font-weight: 700;
	font-style: italic;
	src: url('/static/fonts/CrimsonPro-BoldItalic.ttf') format('truetype');
}

@font-face {
	font-family: 'Crimson';
	font-weight: 800;
	font-style: regular;
	src: url('/static/fonts/CrimsonPro-Black.ttf') format('truetype');
}

@font-face {
	font-family: 'Crimson';
	font-weight: 800;
	font-style: italic;
	src: url('/static/fonts/CrimsonPro-BlackItalic.ttf') format('truetype');
}

◊; SANS

@font-face {
	font-family: 'Alegreya Sans';
	font-weight: 200;
	src: url('/static/fonts/AlegreyaSans-Thin.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans';
	font-weight: 300;
	src: url('/static/fonts/AlegreyaSans-Light.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans';
	font-weight: 400;
	src: url('/static/fonts/AlegreyaSans-Regular.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans';
	font-weight: 500;
	src: url('/static/fonts/AlegreyaSans-Medium.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans';
	font-weight: 600;
	src: url('/static/fonts/AlegreyaSans-Bold.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans';
	font-weight: 700;
	src: url('/static/fonts/AlegreyaSans-ExtraBold.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans';
	font-weight: 800;
	src: url('/static/fonts/AlegreyaSans-Black.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans';
	font-weight: 200;
	font-style: italic;
	src: url('/static/fonts/AlegreyaSans-ThinItalic.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans';
	font-weight: 300;
	font-style: italic;
	src: url('/static/fonts/AlegreyaSans-LightItalic.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans';
	font-weight: 400;
	font-style: italic;
	src: url('/static/fonts/AlegreyaSans-Italic.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans';
	font-weight: 500;
	font-style: italic;
	src: url('/static/fonts/AlegreyaSans-MediumItalic.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans';
	font-weight: 600;
	font-style: italic;
	src: url('/static/fonts/AlegreyaSans-BoldItalic.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans';
	font-weight: 700;
	font-style: italic;
	src: url('/static/fonts/AlegreyaSans-ExtraBoldItalic.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans';
	font-weight: 800;
	font-style: italic;
	src: url('/static/fonts/AlegreyaSans-BlackItalic.ttf') format('truetype');
}

◊; SMALL CAP SANS

@font-face {
	font-family: 'Alegreya Sans SC';
	font-weight: 200;
	src: url('/static/fonts/AlegreyaSansSC-Thin.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans SC';
	font-weight: 300;
	src: url('/static/fonts/AlegreyaSansSC-Light.ttf') format('truetype');
}
@font-face {
	font-family: 'Alegreya Sans SC';
	font-weight: 400;
	src: url('/static/fonts/AlegreyaSansSC-Regular.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans SC';
	font-weight: 500;
	src: url('/static/fonts/AlegreyaSansSC-Medium.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans SC';
	font-weight: 600;
	src: url('/static/fonts/AlegreyaSansSC-Bold.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans SC';
	font-weight: 700;
	src: url('/static/fonts/AlegreyaSansSC-ExtraBold.ttf') format('truetype');
}

@font-face {
	font-family: 'Alegreya Sans SC';
	font-weight: 800;
	src: url('/static/fonts/AlegreyaSansSC-Black.ttf') format('truetype');
}
