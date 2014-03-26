" vim:fileencoding=utf8:

" Vim keymap file for IPA characters
" Maintainer: Eric Christopherson
" Last Change: 28 Jan 2006

" The IPA characters and descriptions are taken from http://www.phon.ucl.ac.uk/home/wells/ipa-unicode.htm
" Note that vim requires that " and \ be escaped by a preceding \!

" Use this short name in the status line.
let b:keymap_name = "x-sampa"

loadkeymap

"Alphabetic
A       ɑ   "   593   0251   open back unrounded
6       ɐ   "   592   0250   open-mid schwa
Q       ɒ   "   594   0252   open back rounded
{       æ   "   230   00E6   raised open front unrounded
b_<     ɓ   "   595   0253   vd bilabial implosive
B\\     ʙ   "   665   0299   vd bilabial trill
B       β   "   946   03B2   vd bilabial fricative
O       ɔ   "   596   0254   open-mid back rounded
s\\     ɕ   "   597   0255   vl alveolopalatal fricative
C       ç   "   231   00E7   vl palatal fricative
d_<     ɗ   "   599   0257   vd alveolar implosive
d`      ɖ   "   598   0256   vd retroflex plosive
D       ð   "   240   00F0   vd dental fricative
d_z     ʤ   "   676   02A4   vd postalveolar affricate
@       ə   "   601   0259   schwa
@\\     ɘ   "   600   0258   close-mid schwa
@`      ɚ   "   602   025A   rhotacized schwa
E       ɛ   "   603   025B   open-mid front unrounded
3       ɜ   "   604   025C   open-mid central
3`      ɝ   "   605   025D   rhotacized open-mid central
3\\     ɞ   "   606   025E   open-mid central rounded
J\\     ɟ   "   607   025F   vd palatal plosive
J\\_<   ʄ   "   644   0284   vd palatal implosive
g       ɡ   "   609   0261   vd velar plosive
g_<     ɠ   "   608   0260   vd velar implosive
G\\     ɢ   "   610   0262   vd uvular plosive
G\\_<   ʛ   "   667   029B   vd uvular implosive
h\\     ɦ   "   614   0266   vd glottal fricative
x\\     ɧ   "   615   0267   vl multiple-place fricative
X\\     ħ   "   295   0127   vl pharyngeal fricative
H       ɥ   "   613   0265   labial-palatal approximant
H\\     ʜ   "   668   029C   vl epiglottal fricative
1       ɨ   "   616   0268   close central unrounded
I       ɪ   "   618   026A   lax close front unrounded
j\\     ʝ   "   669   029D   vd palatal fricative
l`      ɭ   "   621   026D   vd retroflex lateral
K       ɬ   "   620   026C   vl alveolar lateral fricative
5       ɫ   "   619   026B   velarized vd alveolar lateral
l_e     ɫ   "   619   026B   velarized vd alveolar lateral
K\\     ɮ   "   622   026E   vd alveolar lateral fricative
L\\     ʟ   "   671   029F   vd velar lateral
F       ɱ   "   625   0271   vd labiodental nasal
M       ɯ   "   623   026F   close back unrounded
M\\     ɰ   "   624   0270   velar approximant
N       ŋ   "   331   014B   vd velar nasal
n`      ɳ   "   627   0273   vd retroflex nasal
J       ɲ   "   626   0272   vd palatal nasal
N\\     ɴ   "   628   0274   vd uvular nasal
2       ø   "   248   00F8   front close-mid rounded
8       ɵ   "   629   0275   rounded schwa
p\\     ɸ   "   632   0278   vl bilabial fricative
T       θ   "   952   03B8   vl dental fricative
9       œ   "   339   0153   front open-mid rounded
&       ɶ   "   630   0276   front open rounded
O\\     ʘ   "   664   0298   bilabial click
r\\     ɹ   "   633   0279   vd (post)alveolar approximant
l\\     ɺ   "   634   027A   vd alveolar lateral flap
4       ɾ   "   638   027E   vd alveolar tap
r\\`    ɻ   "   635   027B   vd retroflex approximant
R\\     ʀ   "   640   0280   vd uvular trill
R       ʁ   "   641   0281   vd uvular fricative
r`      ɽ   "   637   027D   vd retroflex flap
s`      ʂ   "   642   0282   vl retroflex fricative
S       ʃ   "   643   0283   vl postalveolar fricative
t`      ʈ   "   648   0288   vl retroflex plosive
t_S     ʧ   "   679   02A7   vl postalveolar affricate
}       ʉ   "   649   0289   close central rounded
P       ʋ   "   651   028B   vd labiodental approximant
v\\     ʋ   "   651   028B   vd labiodental approximant
U       ʊ   "   650   028A   lax close back rounded
V       ʌ   "   652   028C   open-mid back unrounded
G       ɣ   "   611   0263   vd velar fricative
7       ɤ   "   612   0264   close-mid back unrounded
W       ʍ   "   653   028D   vl labial-velar fricative
X       χ   "   967   03C7   vl uvular fricative
L       ʎ   "   654   028E   vd palatal lateral
Y       ʏ   "   655   028F   lax close front rounded
z\\     ʑ   "   657   0291   vd alveolopalatal fricative
z`      ʐ   "   656   0290   vd retroflex fricative
Z       ʒ   "   658   0292   vd postalveolar fricative
?       ʔ   "   660   0294   glottal plosive
>\\     ʡ   "   673   02A1   vd epiglottal plosive
?\\     ʕ   "   661   0295   vd pharyngeal fricative
<\\     ʢ   "   674   02A2   vd epiglottal fricative
|\\     ǀ   "   448   01C0   dental click
|\\|\\  ǁ   "   449   01C1   alveolar lateral click
=\\     ǂ   "   450   01C2   alveolar click
!\\     ǃ   "   451   01C3   retroflex click

" Spacing diacritics and suprasegmentals
" Note the \ escape here - not part of sequence
\"      ˈ   "   712   02C8   (primary) stress mark
%       ˌ   "   716   02CC   secondary stress
:       ː   "   720   02D0   length mark NB: there is a bug in some versions of MS IExplorer that causes this character not to display. It is probably best to use a simple colon instead.
:\\     ˑ   "   721   02D1   half-length
_>      ʼ   "   700   02BC   ejective
"
" Giving this an ad-hoc sequence because of 734, below
_`      ʴ   "   692   02B4   rhotacized - superscript turned r
_h      ʰ   "   688   02B0   aspirated
" There doesn't seem to be an official X-SAMPA sequence for the following:
_h\\    ʱ   "   689   02B1   breathy-voice-aspirated
_j      ʲ   "   690   02B2   palatalized
'       ʲ   "   690   02B2   palatalized
_w      ʷ   "   695   02B7   labialized
_e      ˠ   "   736   02E0   velarized
_?\\    ˤ   "   740   02E4   pharyngealized
" How is 734 different from 692?
`       ˞   "   734   02DE   rhotacized - cursive r hook

" Non-spacing diacritics and suprasegmentals
_0      <char-0x0325>   " n̥ d̥   805   0325   voiceless
" The following is ad hoc:
_.      <char-0x030a>   " ŋ̊     778   030A   voiceless (use if character has descender)
_t      <char-0x0324>   " b̤ a̤   804   0324   breathy voiced
_d      <char-0x032a>   " t̪ d̪   810   032A   dental
_v      <char-0x032c>   " s̬ t̬   812   032C   voiced
_k      <char-0x0330>   " b̰ a̰   816   0330   creaky voiced
_a      <char-0x033a>   " t̺ d̺   826   033A   apical
_N      <char-0x033c>   " t̼ d̼   828   033C   linguolabial
_m      <char-0x033b>   " t̻ d̻   827   033B   laminal
_}      <char-0x031a>   " t̚     794   031A   not audibly released
_O      <char-0x0339>   " ɔ̹     825   0339   more rounded
~       <char-0x0303>   " ẽ     771   0303   nasalized
_~      <char-0x0303>   " ẽ     771   0303   nasalized
_c      <char-0x031c>   " ɔ̜     796   031C   less rounded
_+      <char-0x031f>   " u̟     799   031F   advanced
_-      <char-0x0320>   " e̠     800   0320   retracted
" Note the \ escape here - not part of sequence
_\"     <char-0x0308>   " ë     776   0308   centralized
_e      <char-0x0334>   " l̴ n̴   820   0334   velarized or pharyngealized
_x      <char-0x033d>   " e̽     829   033D   mid-centralized
_r      <char-0x031d>   " e̝ ɹ̝   797   031D   raised
=       <char-0x0329>   " m̩ n̩ l̩ 809   0329   syllabic
_=      <char-0x0329>   " m̩ n̩ l̩ 809   0329   syllabic
_o      <char-0x031e>   " e̞ β̞   798   031E   lowered
_^      <char-0x032f>   " e̯     815   032F   non-syllabic
_A      <char-0x0318>   " e̘     792   0318   advanced tongue root
_q      <char-0x0319>   " e̙     793   0319   retracted tongue root
_X      <char-0x0306>   " ĕ     774   0306   extra-short
_T      <char-0x030b>   " e̋     779   030B   extra high tone
_H      <char-0x0301>   " é     769   0301   high tone
_M      <char-0x0304>   " ē     772   0304   mid tone
_L      <char-0x0300>   " è     768   0300   low tone
_B      <char-0x030f>   " ȅ     783   030F   extra low tone

" Arrows
!       ↓   "   8595   2193   downstep
^       ↑   "   8593   2191   upstep
<R>     ↗   "   8599   2197   global rise
<F>     ↘   "   8600   2198   global fall
" The following is ad-hoc; as noted, it's not part of IPA anyway.
->      →   "   8594   2192   (becomes, is realized as — not recognized by the IPA)
