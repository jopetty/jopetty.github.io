#lang pollen

◊(define max-width "710px")

:root {
	--bg: rgb(255, 255, 255);
	--bg-night: rgb(33, 36, 46); /* #21242e; */

	--text: rgb(0, 0, 0);
	--text-night: rgb(221, 221, 221); /* #ddd; */

	--alt-text: rgb(85, 85, 85); /* #555; */
	--alt-text-night: rgb(187, 187, 187); /* #bbb; */

	--accent: rgb(124, 150, 168);
	--accent-t: rgb(124, 150, 168, 0.2);

	--serif-font: 'Crimson', serif;
	--sans-font: 'Alegreya Sans', sans-serif;
  --mono-font: Menlo, monospace;
  
  --line-height: 1.4;
	--font-size: 1.3em;
	
	--max-width: ◊|max-width|;

	--light: 300;
	--regular: 400;
	--medium: 500;
	--semibold: 600;
	--bold: 700;
}

@media (prefers-color-scheme: dark) {
	:root {
		--bg: var(--bg-night);
		--text: var(--text-night);
		--alt-text: var(--alt-text-night);

		◊; --light: 200;
		◊; --regular: 300;
		◊; --medium: 400;
		◊; --semibold: 500;
		◊; --bold: 600;
	}
}

* {
	margin: 0;
	padding: 0;
}

body {
	font-size: min(var(--font-size), 4.5vw);
  line-height: var(--line-height);
	background-color: var(--bg);
	-webkit-text-size-adjust: 100%;
}

p {
  font-family: var(--serif-font);
  color: var(--text);
}

h1, h2, h3, h4, h5, h6 {
	font-family: var(--sans-font);
	color: var(--text);
	font-weight: var(--semibold);
}

h1 {
	font-family: var(--serif-font);
	font-weight: 600;
	font-size: 150%;
}

h1.index-name {
  font-family: var(--serif-font);
}

h2 {
	margin-top: 2ex;
	font-size: 120%;
}

h3 {
	font-size: 100%;
	margin-top: 1ex;
	margin-bottom: -1.2ex;
}

a {
	color: inherit;
  text-decoration: none;
	transition: background-color 0.4s, text-decoration-color 0.2s;
  border-radius: 3px;
}

a.out-link, a.x-link {
	text-decoration: underline;
	text-decoration-color: var(--accent);
	text-underline-offset: 0.3ex;
}

a.out-link:hover, a.x-link:hover {
	text-decoration-color: transparent;
  background-color: var(--accent-t);
}

a.out-link:hover {
	cursor: alias;
}

a.out-link:after {
  position: relative;
	content: "\FEFF°";
  font-size: 90%;
  color: var(--accent);
	font-weight: bold;
	font-family: var(--mono-font);
	text-decoration: none;
	text-decoration-color: transparent;
}

a.subheading-link:hover:after {
	content: "§";
	margin-left: 0.5em;
	color: #aaa;
	font-size: 85%;
	position: relative;
	top: -1pt;
}

div#content {
	margin-bottom: 100px;
	display: grid;
	grid-template-columns: min(var(--max-width), 100vw);
	justify-content: center;
	overflow-x: hidden;
}

article {
	margin-left: 30px;
	margin-right: 30px;
	display: grid;
	grid-template-columns: 100%;
	grid-row-gap: 24px;
	counter-reset: foobar;
	counter-reset: reflist;
	margin-top: 3ex;
}

article aside {
	font-size: 90%;
	display: grid;
	grid-template-columns: 100%;
	grid-row-gap: 20px;
}

article aside p {
	font-family: var(--sans-font);
	font-weight: var(--regular);
	color: var(--alt-text);
}

article aside > p {
	font-weight: var(--medium);
}

article p {
	display: block;
	-webkit-hyphens: auto;
	hyphens: auto;
	font-weight: var(--regular);
}

article li:before {
	font-family: var(--serif-font);
}

article ol.ex {
	list-style-type: none;
}

article ol li, article ul li {
	margin-bottom: 0.5em;
	margin-left: 2.5em;
	color: var(--text);
	font-family: var(--serif-font);
}

li:last-child {
	margin-bottom: 0em !important; 
}

article ol.ex li:before {
	counter-increment: foobar;
	content: '('counter(foobar)')';
	color: var(--text);
}

article ol#references li:before {
	counter-increment: reflist;
	content: '['counter(reflist)']';
}

article ol.ex ol.ex li:before {
	counter-increment: foobar-2;
	content: counter(foobar-2, lower-alpha)'';
}

article ol.ex li:before, article ul li:before  {
	font-family: var(--serif-font);
	margin-left: -2.5em;
	position: absolute;
	color: var(--text);
}

code {
	font-family: var(--mono-font);
	font-size: 80%;
	color: var(--text);
	-moz-hyphens: none;
  -ms-hyphens: none;
  -webkit-hyphens: none;
  hyphens: none;
}

span.new-thought {
	font-feature-settings: 'pcap'; 
	letter-spacing: 1pt;
	margin-top: 30px;
	display: inline-block;
}

div.project-item {
	display: flex;
	align-items: center;
	justify-content: center;
	border: dotted 1px #ccc;
	width: 300px; height: 150px;
}

div.project-item:hover {
	border: solid 1px #ccc;
	background-color: var(--accent-t);
	cursor: pointer;
}

span.project-name {
	font-family: var(--sans-font);
	font-weight: var(--medium);
}

header {
	height: 50px;
	display: grid;
	grid-template-columns: min(var(--max-width), 100vw);
	justify-content: center;
	width: 100vw;
	z-index: 100;
}

header nav {
	border-bottom: solid 1px var(--accent-t);
	display: flex;
	align-items: center;
	background-color: var(--bg);
	z-index: 100;
	padding-left: 30px;
	padding-right: 30px;
}

@media all and (max-width: ◊|max-width|) {
	header {
		position: fixed;
		top: 0;
	}

	div#content{
		margin-top: 100px;
	}
}

@media all and (min-width: ◊|max-width|) {

	header {
		margin-top: 12ex;
		/* position: absolute; */
	}

	ul.link-list {
		margin-top: 30px;
	}

	div#content{
		margin-top: 30px;
	}

	article > *:first-child{
		margin-top: 0;
	}
}

a.syn-link {
	display: inline-flex;
	border-radius: 3px;
	border: solid 1px var(--accent);
	justify-content: center;
	align-items: center;
	font-family: var(--sans-font);
	font-weight: var(--regular);
	font-size: 80%;
}

a.syn-link span {
	padding-left: 5px;
	padding-right: 5px;
	padding-top: 2px;
	padding-bottom: 2px;
}

span.syn-type {
	background-color: var(--accent);
	color: var(--bg);
}

span.syn-label:hover {
	background-color: var(--accent-t);
}

li a.section-link {
	display: inline;
}

li h2 {
	display: inline;
}

ul.link-list {
	list-style-type: none;
}

ul.link-list li {
	display: inline;
	margin-left: 0;
	margin-right: 1em;
}

a.section-link::after {
	content: "→";
	margin-left: 0.5em;
}

ul.link-list a.section-link::after {
	content: "›";
	margin-left: 0.5em;
}

a.section-link:hover, a.breadcrumb-link:hover {
	background-color: var(--accent-t);
}

a.breadcrumb-link {
	font-family: var(--sans-font);
	text-transform: lowercase;
	font-variant: small-caps;
	letter-spacing: 0.5pt;
	font-weight: var(--medium);
	color: var(--text);
}

pre {
	border-top: solid 1px var(--accent);
	border-bottom: solid 1px var(--accent);
	background-color: var(--accent-t);
	max-width: 650px;
	padding: 10px;
}

code, pre {
	overflow: scroll;
}

code.inline {
	background-color: var(--accent-t);
}

div.valediction {
	display: block;
	text-align: right;
	margin-top: 2.5ex;
	font-size: 85%;

	text-transform: uppercase;
	◊; letter-spacing: 0.1pt;
}

div.valediction p {
	font-weight: 600;
}

strong {
	font-weight: var(--bold);
	line-height: inherit;
}

div[class="abstract"] p {
	◊; font-size: 80%;
	◊; font-family: var(--sans-font);
}

ul.feed {
	list-style-type: square;
	font-size: 90%;
}

ul.feed li {
	margin-left: 1em;
	margin-bottom: 2.5ex;
}

span.feed-header {
	font-family: 'Alegreya Sans SC'; 
	font-weight: var(--semibold); 
	display: block; 
	text-transform: lowercase; 
	letter-spacing: 0.5pt;
	margin-bottom: 0.5ex;
}

span.breadcrumb-spacer {
	font-weight: bold;
	color: var(--accent);
	margin-left: 0.5em;
	margin-right: 0.5em;
	position: relative;
	top: 0.2ex;
}

dl {
	color: var(--text);
	font-family: var(--serif-font);
}

dt {
	font-family: 'Alegreya Sans SC';
	font-weight: var(--semibold);
	text-transform: lowercase;
	letter-spacing: 0.5pt;
	margin-top: 3ex;
}

dt:nth-child(1) {
	margin-top: 0;
}

dd {
	margin-left: 1em;
	margin-top: 2pt;
}

sup {
	line-height: 0;
	font-size: 70%;
}

table:not(.ex) td, table:not(.ex) th {
	text-align: right;
	padding: 3px 5px;
}

td:nth-child(1), th:nth-child(1) {
	text-align: left !important;
}

table:not(.ex) td p {
	font-weight: var(--medium) !important;
}

table:not(.ex) td strong {
	font-weight: var(--bold) !important;
}

td p, th p {
	color: var(--text) !important;
}

th p {
	font-weight: var(--semibold) !important;
}

span.small-cap {
	text-transform: uppercase;
	font-size: 70%;
	font-weight: 500;
	letter-spacing: 0.7pt;
	◊; font-variant: small-caps;
}

ul.pub-list {
	list-style-type: none;
}

ul.pub-list li {
	margin: 0px;
}

hr.pub-list-div {
	border: none;
	width: 100%;
	text-align: center;
	margin: 2ex 0;
}

hr.pub-list-div::after {
	content: "* * *";
	color: var(--alt-text);

}

footer {
	display: grid;
	grid-template-columns: min(var(--max-width), 100vw);
	justify-content: center;
	width: 100vw;
	z-index: 100;
	padding-bottom: 100px;
	background-color: var(--accent-t);
	border-top: solid 1px var(--accent-t);
}

footer nav{
	padding-top: 30px;
	display: flex;
	justify-content: space-between;
	z-index: 100;
	padding-left: 30px;
	padding-right: 30px;
}

footer div#sitemap ul, footer div#elsewhere ul {
	list-style-type: none;
}

footer div#sitemap ul li, footer div#elsewhere ul li {
	margin: 0;
	font-family: var(--sans-font);
	text-transform: lowercase;
	font-variant: small-caps;
}

footer div#elsewhere {
	text-align: right;
}

footer nav a.breadcrumb-link {
	color: var(--alt-text);
}