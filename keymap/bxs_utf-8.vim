" BXS to Unicode IPA keymap.
" BXS is a modification of CXS which in turn is a
" modification of X-SAMPA! 
" See <http://www.theiling.de/ipa/> for CXS.
"
" Maintainer: Benct Philip Jonsson <bpj@melroch.se>
"
" Last changed: 6 aug 2009
"	Changed BXS notation for superscript letters
"	from $<letter> to _$<letter>, which latter
"	thus becomes a consistent notantion for
"	superscript letters, though old notations like
"	_h _j _l also remain available, while
"	$_<letter> becomes the notation for spacing
"	modifier letters as alternatives to combining
"	diacritics like $_c .  Now one can also type a
"	literal $ whithout hitting Esc!  This change
"	also makes the notation here consistent with
"	that in my Perl BXS converter.
"
"	I also added `\ to allow typing an actual backtick 
"	without changing keymaps or hitting Esc.

let b:keymap_name = "BXS"

loadkeymap
`\\         `           U+0060 GRAVE ACCENT   " Convenience mapping
!           ↓           U+2193 DOWNWARDS ARROW
!\\         ǃ           U+01C3 LATIN LETTER RETROFLEX CLICK
" BXS addition, quasi ɾ with retroflex hook.
4`          ʗ           U+0297 LATIN LETTER STRETCHED C
\"          ˌ           U+02CC MODIFIER LETTER LOW VERTICAL LINE
%           ˌ           U+02CC MODIFIER LETTER LOW VERTICAL LINE
&           æ           U+00E6 LATIN SMALL LETTER AE
&\\         ɶ           U+0276 LATIN LETTER SMALL CAPITAL OE
" BXS addition
9\\         ʚ           U+029A LATIN SMALL LETTER CLOSED OPEN E
'           ˈ           U+02C8 MODIFIER LETTER VERTICAL LINE
(           ̆           U+0306 COMBINING BREVE
" BXS addition
(\\         (           U+0028 LEFT PARENTHESIS
" BXS addition
)\\         )           U+0029 RIGHT PARENTHESIS
,           ˌ           U+02CC MODIFIER LETTER LOW VERTICAL LINE
,\\         ,           U+002C COMMA
-\\         ‿           U+203F UNDERTIE
._d_d       ʭ           U+02AD LATIN LETTER BIDENTAL PERCUSSIVE
._w_w       ʬ           U+02AC LATIN LETTER BILABIAL PERCUSSIVE
1           ɨ           U+0268 LATIN SMALL LETTER I WITH STROKE
2           ø           U+00F8 LATIN SMALL LETTER O WITH STROKE
3           ɜ           U+025C LATIN SMALL LETTER REVERSED OPEN E
3\\         ɞ           U+025E LATIN SMALL LETTER CLOSED REVERSED OPEN E
3`          ɝ           U+025D LATIN SMALL LETTER REVERSED OPEN E WITH HOOK
4           ɾ           U+027E LATIN SMALL LETTER R WITH FISHHOOK
" BXS change/addition
4\\         ɺ           U+027A LATIN SMALL LETTER TURNED R WITH LONG LEG
" BXS addition
4\\`        ⱹ           U+2C79 LATIN SMALL LETTER TURNED R WITH TAIL
5           ɫ           U+026B LATIN SMALL LETTER L WITH MIDDLE TILDE
6           ɐ           U+0250 LATIN SMALL LETTER TURNED A
7           ɤ           U+0264 LATIN SMALL LETTER RAMS HORN
8           ɵ           U+0275 LATIN SMALL LETTER BARRED O
8\\         ɵ̟
9           œ           U+0153 LATIN SMALL LIGATURE OE
:           ː           U+02D0 MODIFIER LETTER TRIANGULAR COLON
:\\         ˑ           U+02D1 MODIFIER LETTER HALF TRIANGULAR COLON
;           ʲ           U+02B2 MODIFIER LETTER SMALL J
<\\         ʢ           U+02A2 LATIN LETTER REVERSED GLOTTAL STOP WITH STROKE
<F>         ↘           U+2198 SOUTH EAST ARROW
<R>         ↗           U+2197 NORTH EAST ARROW
" BXS change/addition
_=          ̍           U+030D COMBINING VERTICAL LINE ABOVE
=           ̩           U+0329 COMBINING VERTICAL LINE BELOW
=\\         ǂ           U+01C2 LATIN LETTER ALVEOLAR CLICK
>\\         ʡ           U+02A1 LATIN LETTER GLOTTAL STOP WITH STROKE
?           ʔ           U+0294 LATIN LETTER GLOTTAL STOP
?\\         ʕ           U+0295 LATIN LETTER PHARYNGEAL VOICED FRICATIVE
@           ə           U+0259 LATIN SMALL LETTER SCHWA
@\\         ɘ           U+0258 LATIN SMALL LETTER REVERSED E
@`          ɚ           U+025A LATIN SMALL LETTER SCHWA WITH HOOK
^           ↑           U+2191 UPWARDS ARROW
_}          ̚           U+031A COMBINING LEFT ANGLE ABOVE
)           ͡           U+0361 COMBINING DOUBLE INVERTED BREVE
_\"         ̈           U+0308 COMBINING DIAERESIS
" The whole notation with _$ before a symbol to
" indicate a superscript is a BXS addition
_$&         ᵆ           U+1D46 MODIFIER LETTER SMALL TURNED AE
_$3         ᵌ           U+1D4C MODIFIER LETTER SMALL TURNED OPEN E
_$6         ᵄ           U+1D44 MODIFIER LETTER SMALL TURNED A
_$8         ᶱ           U+1DB1 MODIFIER LETTER SMALL BARRED O
_$?\\       ˤ           U+02E4 MODIFIER LETTER SMALL REVERSED GLOTTAL STOP
_$@         ᵊ           U+1D4A MODIFIER LETTER SMALL SCHWA
_$a         ᵃ           U+1D43 MODIFIER LETTER SMALL A
_$A         ᵅ           U+1D45 MODIFIER LETTER SMALL ALPHA
_$b         ᵇ           U+1D47 MODIFIER LETTER SMALL B
_$B         ᵝ           U+1D5D MODIFIER LETTER SMALL BETA
_$c         ᶜ           U+1D9C MODIFIER LETTER SMALL C
_$d         ᵈ           U+1D48 MODIFIER LETTER SMALL D
_$D         ᶞ           U+1D9E MODIFIER LETTER SMALL ETH
_$e         ᵉ           U+1D49 MODIFIER LETTER SMALL E
_$E         ᵋ           U+1D4B MODIFIER LETTER SMALL OPEN E
_$f         ᶠ           U+1DA0 MODIFIER LETTER SMALL F
_$G         ˠ           U+02E0 MODIFIER LETTER SMALL GAMMA
_$g         ᵍ           U+1D4D MODIFIER LETTER SMALL G
_$g\\       ᶢ           U+1DA2 MODIFIER LETTER SMALL SCRIPT G
_$h         ʰ           U+02B0 MODIFIER LETTER SMALL H
_$H         ᶣ           U+1DA3 MODIFIER LETTER SMALL TURNED H
_$h\\       ʱ           U+02B1 MODIFIER LETTER SMALL H WITH HOOK
_$I         ᶦ           U+1DA6 MODIFIER LETTER SMALL CAPITAL I
_$i         ⁱ           U+2071 SUPERSCRIPT LATIN SMALL LETTER I
_$i\\       ᶤ           U+1DA4 MODIFIER LETTER SMALL I WITH STROKE
_$I\\       ᶧ           U+1DA7 MODIFIER LETTER SMALL CAPITAL I WITH STROKE
_$j         ʲ           U+02B2 MODIFIER LETTER SMALL J
_$J         ᶮ           U+1DAE MODIFIER LETTER SMALL N WITH LEFT HOOK
_$J\\       ᶡ           U+1DA1 MODIFIER LETTER SMALL DOTLESS J WITH STROKE
_$j\\       ᶨ           U+1DA8 MODIFIER LETTER SMALL J WITH CROSSED-TAIL
_$k         ᵏ           U+1D4F MODIFIER LETTER SMALL K
_$l         ˡ           U+02E1 MODIFIER LETTER SMALL L
_$L         ᶫ           U+1DAB MODIFIER LETTER SMALL CAPITAL L
_$l`        ᶩ           U+1DA9 MODIFIER LETTER SMALL L WITH RETROFLEX HOOK
_$m         ᵐ           U+1D50 MODIFIER LETTER SMALL M
_$M         ᵚ           U+1D5A MODIFIER LETTER SMALL TURNED M
_$m\\       ᶭ           U+1DAD MODIFIER LETTER SMALL TURNED M WITH LONG LEG
_$N         ᵑ           U+1D51 MODIFIER LETTER SMALL ENG
_$n         ⁿ           U+207F SUPERSCRIPT LATIN SMALL LETTER N
_$N\\       ᶰ           U+1DB0 MODIFIER LETTER SMALL CAPITAL N
_$n`        ᶯ           U+1DAF MODIFIER LETTER SMALL N WITH RETROFLEX HOOK
_$o         ᵒ           U+1D52 MODIFIER LETTER SMALL O
_$O         ᵓ           U+1D53 MODIFIER LETTER SMALL OPEN O
_$p         ᵖ           U+1D56 MODIFIER LETTER SMALL P
_$P         ᶲ           U+1DB2 MODIFIER LETTER SMALL PHI
_$Q         ᶛ           U+1D9B MODIFIER LETTER SMALL TURNED ALPHA
_$r         ʳ           U+02B3 MODIFIER LETTER SMALL R
_$R         ʶ           U+02B6 MODIFIER LETTER SMALL CAPITAL INVERTED R
_$r\\       ʴ           U+02B4 MODIFIER LETTER SMALL TURNED R
_$r\\`      ʵ           U+02B5 MODIFIER LETTER SMALL TURNED R WITH HOOK
_$s         ˢ           U+02E2 MODIFIER LETTER SMALL S
_$S         ᶴ           U+1DB4 MODIFIER LETTER SMALL ESH
_$s\\       ᶝ           U+1D9D MODIFIER LETTER SMALL C WITH CURL
_$s`        ᶳ           U+1DB3 MODIFIER LETTER SMALL S WITH HOOK
_$t         ᵗ           U+1D57 MODIFIER LETTER SMALL T
_$T         ᶿ           U+1DBF MODIFIER LETTER SMALL THETA
_$u         ᵘ           U+1D58 MODIFIER LETTER SMALL U
_$U         ᶷ           U+1DB7 MODIFIER LETTER SMALL UPSILON
_$u\\       ᶶ           U+1DB6 MODIFIER LETTER SMALL U BAR
_$v         ᵛ           U+1D5B MODIFIER LETTER SMALL V
_$V         ᶺ           U+1DBA MODIFIER LETTER SMALL TURNED V
_$v\\       ᶹ           U+1DB9 MODIFIER LETTER SMALL V WITH HOOK
_$w         ʷ           U+02B7 MODIFIER LETTER SMALL W
_$x         ˣ           U+02E3 MODIFIER LETTER SMALL X
_$X         ᵡ           U+1D61 MODIFIER LETTER SMALL CHI
_$y         ʸ           U+02B8 MODIFIER LETTER SMALL Y
_$z         ᶻ           U+1DBB MODIFIER LETTER SMALL Z
_$Z         ᶾ           U+1DBE MODIFIER LETTER SMALL EZH
_$z\\       ᶽ           U+1DBD MODIFIER LETTER SMALL Z WITH CURL
_$z`        ᶼ           U+1DBC MODIFIER LETTER SMALL Z WITH RETROFLEX HOOK
+           ˖           U+02D6 MODIFIER LETTER PLUS SIGN
_+          ̟           U+031F COMBINING PLUS SIGN BELOW
-           ˗           U+02D7 MODIFIER LETTER MINUS SIGN
_-          ̠           U+0320 COMBINING MINUS SIGN BELOW
_0          ̊           U+030A COMBINING RING ABOVE
0           ̥           U+0325 COMBINING RING BELOW
_>          ʼ           U+02BC MODIFIER LETTER APOSTROPHE
_?          ˀ           U+02C0 MODIFIER LETTER GLOTTAL STOP
_$?         ˀ           U+02C0 MODIFIER LETTER GLOTTAL STOP
_?\\        ˤ           U+02E4 MODIFIER LETTER SMALL REVERSED GLOTTAL STOP
_\\         _           U+005F LOW LINE
_^          ̯           U+032F COMBINING INVERTED BREVE BELOW
" BXS addition
_(          ̯           U+032F COMBINING INVERTED BREVE BELOW
_A          ̘           U+0318 COMBINING LEFT TACK BELOW
_a          ̺           U+033A COMBINING INVERTED BRIDGE BELOW
_B          ̏           U+030F COMBINING DOUBLE GRAVE ACCENT
_B_L        ˏ           U+02CF MODIFIER LETTER LOW ACUTE ACCENT
" BXS addition
$_c         ˓           U+02D3 MODIFIER LETTER CENTRED LEFT HALF RING
_c          ̜           U+031C COMBINING LEFT HALF RING BELOW
_d          ̪           U+032A COMBINING BRIDGE BELOW
_e          ̴           U+0334 COMBINING TILDE OVERLAY
_F          ̂           U+0302 COMBINING CIRCUMFLEX ACCENT
_F_R        ˇ           U+02C7 CARON
_G          ˠ           U+02E0 MODIFIER LETTER SMALL GAMMA
_h          ʰ           U+02B0 MODIFIER LETTER SMALL H
_H          ́           U+0301 COMBINING ACUTE ACCENT
_j          ʲ           U+02B2 MODIFIER LETTER SMALL J
_y          ʸ           U+02B8 MODIFIER LETTER SMALL Y
_;          ̡           U+0321 COMBINING PALATALIZED HOOK BELOW
_k          ̰           U+0330 COMBINING TILDE BELOW
_l          ˡ           U+02E1 MODIFIER LETTER SMALL L
_L          ̀           U+0300 COMBINING GRAVE ACCENT
_L_B        ˎ           U+02CE MODIFIER LETTER LOW GRAVE ACCENT
_M          ̄           U+0304 COMBINING MACRON
_m          ̻           U+033B COMBINING SQUARE BELOW
_N          ̼           U+033C COMBINING SEAGULL BELOW
_n          ⁿ           U+207F SUPERSCRIPT LATIN SMALL LETTER N
$_O         ˒           U+02D2 MODIFIER LETTER CENTRED RIGHT HALF RING
" BXS addition
$_o         ˕           U+02D5 MODIFIER LETTER DOWN TACK
_o          ̞           U+031E COMBINING DOWN TACK BELOW
_O          ̹           U+0339 COMBINING RIGHT HALF RING BELOW
_q          ̙           U+0319 COMBINING RIGHT TACK BELOW
" BXS addition
$_r         ˔           U+02D4 MODIFIER LETTER UP TACK
_R          ̌           U+030C COMBINING CARON
_r          ̝           U+031D COMBINING UP TACK BELOW
" BXS addition
_h\\        ʱ           U+02B1 MODIFIER LETTER SMALL H WITH HOOK
_T          ̋           U+030B COMBINING DOUBLE ACUTE ACCENT
_t          ̤           U+0324 COMBINING DIAERESIS BELOW
_v          ̬           U+032C COMBINING CARON BELOW
_w          ʷ           U+02B7 MODIFIER LETTER SMALL W
" BXS addition
_W          ̫           U+032B COMBINING INVERTED DOUBLE ARCH BELOW
_X          ̆           U+0306 COMBINING BREVE
_x          ̽           U+033D COMBINING X ABOVE
$`          ˞           U+02DE MODIFIER LETTER RHOTIC HOOK
`           ̢           U+0322 COMBINING RETROFLEX HOOK BELOW
_`          ̢           U+0322 COMBINING RETROFLEX HOOK BELOW
A           ɑ           U+0251 LATIN SMALL LETTER ALPHA
" BXS addition
b\\         ƀ           U+0180 LATIN SMALL LETTER B WITH STROKE
B           β           U+03B2 GREEK SMALL LETTER BETA
B\\         ʙ           U+0299 LATIN LETTER SMALL CAPITAL B
b_<         ɓ           U+0253 LATIN SMALL LETTER B WITH HOOK
C           ç           U+00E7 LATIN SMALL LETTER C WITH CEDILLA
C\\         C           U+0043 LATIN CAPITAL LETTER C
" BXS addition
c\\         ɕ           U+0255 LATIN SMALL LETTER C WITH CURL
D           ð           U+00F0 LATIN SMALL LETTER ETH
" BXS addition
d\\         ȡ           U+0221 LATIN SMALL LETTER D WITH CURL
" BXS addition
D\\         ᴆ           U+1D06 LATIN LETTER SMALL CAPITAL ETH
d_<         ɗ           U+0257 LATIN SMALL LETTER D WITH HOOK
d_b         ȸ           U+0238 LATIN SMALL LETTER DB DIGRAPH
d_z         ʣ           U+02A3 LATIN SMALL LETTER DZ DIGRAPH
d_Z         ʤ           U+02A4 LATIN SMALL LETTER DEZH DIGRAPH
d_z\\       ʥ           U+02A5 LATIN SMALL LETTER DZ DIGRAPH WITH CURL
d`          ɖ           U+0256 LATIN SMALL LETTER D WITH TAIL
E           ɛ           U+025B LATIN SMALL LETTER OPEN E
F           ɱ           U+0271 LATIN SMALL LETTER M WITH HOOK
" BXS addition
m\\         ɱ           U+0271 LATIN SMALL LETTER M WITH HOOK
" BXS addition
F\\         ⱱ           U+2C71 LATIN SMALL LETTER V WITH RIGHT HOOK
f_N         ʩ           U+02A9 LATIN SMALL LETTER FENG DIGRAPH
G           ɣ           U+0263 LATIN SMALL LETTER GAMMA
g\\         ǥ           U+01E5 LATIN SMALL LETTER G WITH STROKE
g\\\\       ɡ           U+0261 LATIN SMALL LETTER SCRIPT G
G\\         ɢ           U+0262 LATIN LETTER SMALL CAPITAL G
G\\_<       ʛ           U+029B LATIN LETTER SMALL CAPITAL G WITH HOOK
g_<         ɠ           U+0260 LATIN SMALL LETTER G WITH HOOK
H           ɥ           U+0265 LATIN SMALL LETTER TURNED H
h\\         ɦ           U+0266 LATIN SMALL LETTER H WITH HOOK
H\\         ʜ           U+029C LATIN LETTER SMALL CAPITAL H
I           ɪ           U+026A LATIN LETTER SMALL CAPITAL I
I\\         ᵻ           U+1D7B LATIN SMALL CAPITAL LETTER I WITH STROKE
J           ɲ           U+0272 LATIN SMALL LETTER N WITH LEFT HOOK
J\\         ɟ           U+025F LATIN SMALL LETTER DOTLESS J WITH STROKE
j\\         ʝ           U+029D LATIN SMALL LETTER J WITH CROSSED-TAIL
J\\_<       ʄ           U+0284 LATIN SMALL LETTER DOTLESS J WITH STROKE AND HOOK
K           ɬ           U+026C LATIN SMALL LETTER L WITH BELT
K\\         ɮ           U+026E LATIN SMALL LETTER LEZH
L           ʎ           U+028E LATIN SMALL LETTER TURNED Y
" BXS change
l\\         ȴ           U+0234 LATIN SMALL LETTER L WITH CURL
"l\\        ɺ           U+027A LATIN SMALL LETTER TURNED R WITH LONG LEG
L\\         ʟ           U+029F LATIN LETTER SMALL CAPITAL L
l_e         ɫ           U+026B LATIN SMALL LETTER L WITH MIDDLE TILDE
l_s         ʪ           U+02AA LATIN SMALL LETTER LS DIGRAPH
l_z         ʫ           U+02AB LATIN SMALL LETTER LZ DIGRAPH
l`          ɭ           U+026D LATIN SMALL LETTER L WITH RETROFLEX HOOK
M           ɯ           U+026F LATIN SMALL LETTER TURNED M
M\\         ɰ           U+0270 LATIN SMALL LETTER TURNED M WITH LONG LEG
N           ŋ           U+014B LATIN SMALL LETTER ENG
" BXS‑addition
n\\         ȵ           U+0235 LATIN SMALL LETTER N WITH CURL
N\\         ɴ           U+0274 LATIN LETTER SMALL CAPITAL N
n`          ɳ           U+0273 LATIN SMALL LETTER N WITH RETROFLEX HOOK
n_n         ƞ           U+019E LATIN SMALL LETTER N WITH LONG RIGHT LEG
O           ɔ           U+0254 LATIN SMALL LETTER OPEN O
O\\         ʘ           U+0298 LATIN LETTER BILABIAL CLICK
" BXS addition
P\\         ʘ           U+0298 LATIN LETTER BILABIAL CLICK
" BXS change/CXS alternate
P           ɸ           U+0278 LATIN SMALL LETTER PHI
p\\         ɸ           U+0278 LATIN SMALL LETTER PHI
p_<         ƥ           U+01A5 LATIN SMALL LETTER P WITH HOOK
Q           ɒ           U+0252 LATIN SMALL LETTER TURNED ALPHA
" BXS addition
q\\         ƣ           U+01A3 LATIN SMALL LETTER OI
q_<         ʠ           U+02A0 LATIN SMALL LETTER Q WITH HOOK
q_p         ȹ           U+0239 LATIN SMALL LETTER QP DIGRAPH
R           ʁ           U+0281 LATIN LETTER SMALL CAPITAL INVERTED R
r\\         ɹ           U+0279 LATIN SMALL LETTER TURNED R
R\\         ʀ           U+0280 LATIN LETTER SMALL CAPITAL R
r\\_r       ɼ           U+027C LATIN SMALL LETTER R WITH LONG LEG
r\\`        ɻ           U+027B LATIN SMALL LETTER TURNED R WITH HOOK
r`          ɽ           U+027D LATIN SMALL LETTER R WITH TAIL
S           ʃ           U+0283 LATIN SMALL LETTER ESH
s\\         ɕ           U+0255 LATIN SMALL LETTER C WITH CURL
S_j;        ʆ           U+0286 LATIN SMALL LETTER ESH WITH CURL
s`          ʂ           U+0282 LATIN SMALL LETTER S WITH HOOK
T           θ           U+03B8 GREEK SMALL LETTER THETA
t\\         ȶ           U+0236 LATIN SMALL LETTER T WITH CURL
t_<         ƭ           U+01AD LATIN SMALL LETTER T WITH HOOK
t_;         ƫ           U+01AB LATIN SMALL LETTER T WITH PALATAL HOOK
t_s         ʦ           U+02A6 LATIN SMALL LETTER TS DIGRAPH
t_S         ʧ           U+02A7 LATIN SMALL LETTER TESH DIGRAPH
t_s\\       ʨ           U+02A8 LATIN SMALL LETTER TC DIGRAPH WITH CURL
t`          ʈ           U+0288 LATIN SMALL LETTER T WITH RETROFLEX HOOK
" BXS addition
U_w         ɷ           U+0277 LATIN SMALL LETTER CLOSED OMEGA
" BXS addition
u\_w        ω           U+03C9 GREEK SMALL LETTER OMEGA
U           ʊ           U+028A LATIN SMALL LETTER UPSILON
u\\         ʉ           U+0289 LATIN SMALL LETTER U BAR
U\\         ᵿ           U+1D7F LATIN SMALL LETTER UPSILON WITH STROKE
V           ʌ           U+028C LATIN SMALL LETTER TURNED V
V\\         V           U+0056 LATIN CAPITAL LETTER V
v\\         ʋ           U+028B LATIN SMALL LETTER V WITH HOOK
W           ʍ           U+028D LATIN SMALL LETTER TURNED W
w\\         ψ           U+03C8 GREEK SMALL LETTER PSI " BXS addition = [B_o]
X           χ           U+03C7 GREEK SMALL LETTER CHI
X\\         ħ           U+0127 LATIN SMALL LETTER H WITH STROKE
x\\         ɧ           U+0267 LATIN SMALL LETTER HENG WITH HOOK
Y           ʏ           U+028F LATIN LETTER SMALL CAPITAL Y
Z           ʒ           U+0292 LATIN SMALL LETTER EZH
" BXS addition
i_z         ɿ           U+027F LATIN SMALL LETTER REVERSED R WITH FISHHOOK
z\\         ʑ           U+0291 LATIN SMALL LETTER Z WITH CURL
Z_j         ʓ           U+0293 LATIN SMALL LETTER EZH WITH CURL
z`          ʐ           U+0290 LATIN SMALL LETTER Z WITH RETROFLEX HOOK
" BXS addition
i`          ʅ           U+0285 LATIN SMALL LETTER SQUAT REVERSED ESH
|\\         ǀ           U+01C0 LATIN LETTER DENTAL CLICK
|\\|\\      ǁ           U+01C1 LATIN LETTER LATERAL CLICK
||          ‖           U+2016 DOUBLE VERTICAL LINE
~           ̃           U+0303 COMBINING TILDE
_~          ̨           U+0328 COMBINING OGONEK
~\\         ~           U+007E TILDE
__          ͏           U+034F COMBINING GRAPHEME JOINER (which is zero-width and invisible!)
