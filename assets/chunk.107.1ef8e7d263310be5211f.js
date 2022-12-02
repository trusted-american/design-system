/*! For license information please see chunk.107.1ef8e7d263310be5211f.js.LICENSE.txt */
(globalThis.webpackChunk_ember_auto_import_=globalThis.webpackChunk_ember_auto_import_||[]).push([[107],{529:(t,e,i)=>{"use strict"
i.r(e),i.d(e,{Alert:()=>Te,Button:()=>ke,Carousel:()=>$e,Collapse:()=>Qe,Dropdown:()=>di,Modal:()=>Mi,Offcanvas:()=>Vi,Popover:()=>gn,ScrollSpy:()=>wn,Tab:()=>Dn,Toast:()=>zn,Tooltip:()=>fn})
var n={}
i.r(n),i.d(n,{afterMain:()=>E,afterRead:()=>y,afterWrite:()=>x,applyStyles:()=>N,arrow:()=>Z,auto:()=>l,basePlacements:()=>c,beforeMain:()=>w,beforeRead:()=>b,beforeWrite:()=>C,bottom:()=>o,clippingParents:()=>f,computeStyles:()=>nt,createPopper:()=>It,createPopperBase:()=>Dt,createPopperLite:()=>Nt,detectOverflow:()=>bt,end:()=>u,eventListeners:()=>ot,flip:()=>vt,hide:()=>At,left:()=>a,main:()=>A,modifierPhases:()=>k,offset:()=>Et,placements:()=>_,popper:()=>p,popperGenerator:()=>Lt,popperOffsets:()=>Ct,preventOverflow:()=>Tt,read:()=>v,reference:()=>g,right:()=>r,start:()=>h,top:()=>s,variationPlacements:()=>m,viewport:()=>d,write:()=>T})
var s="top",o="bottom",r="right",a="left",l="auto",c=[s,o,r,a],h="start",u="end",f="clippingParents",d="viewport",p="popper",g="reference",m=c.reduce((function(t,e){return t.concat([e+"-"+h,e+"-"+u])}),[]),_=[].concat(c,[l]).reduce((function(t,e){return t.concat([e,e+"-"+h,e+"-"+u])}),[]),b="beforeRead",v="read",y="afterRead",w="beforeMain",A="main",E="afterMain",C="beforeWrite",T="write",x="afterWrite",k=[b,v,y,w,A,E,C,T,x]
function O(t){return t?(t.nodeName||"").toLowerCase():null}function S(t){if(null==t)return window
if("[object Window]"!==t.toString()){var e=t.ownerDocument
return e&&e.defaultView||window}return t}function L(t){return t instanceof S(t).Element||t instanceof Element}function D(t){return t instanceof S(t).HTMLElement||t instanceof HTMLElement}function I(t){return"undefined"!=typeof ShadowRoot&&(t instanceof S(t).ShadowRoot||t instanceof ShadowRoot)}const N={name:"applyStyles",enabled:!0,phase:"write",fn:function(t){var e=t.state
Object.keys(e.elements).forEach((function(t){var i=e.styles[t]||{},n=e.attributes[t]||{},s=e.elements[t]
D(s)&&O(s)&&(Object.assign(s.style,i),Object.keys(n).forEach((function(t){var e=n[t]
!1===e?s.removeAttribute(t):s.setAttribute(t,!0===e?"":e)})))}))},effect:function(t){var e=t.state,i={popper:{position:e.options.strategy,left:"0",top:"0",margin:"0"},arrow:{position:"absolute"},reference:{}}
return Object.assign(e.elements.popper.style,i.popper),e.styles=i,e.elements.arrow&&Object.assign(e.elements.arrow.style,i.arrow),function(){Object.keys(e.elements).forEach((function(t){var n=e.elements[t],s=e.attributes[t]||{},o=Object.keys(e.styles.hasOwnProperty(t)?e.styles[t]:i[t]).reduce((function(t,e){return t[e]="",t}),{})
D(n)&&O(n)&&(Object.assign(n.style,o),Object.keys(s).forEach((function(t){n.removeAttribute(t)})))}))}},requires:["computeStyles"]}
function P(t){return t.split("-")[0]}var j=Math.max,M=Math.min,z=Math.round
function H(){var t=navigator.userAgentData
return null!=t&&t.brands?t.brands.map((function(t){return t.brand+"/"+t.version})).join(" "):navigator.userAgent}function B(){return!/^((?!chrome|android).)*safari/i.test(H())}function R(t,e,i){void 0===e&&(e=!1),void 0===i&&(i=!1)
var n=t.getBoundingClientRect(),s=1,o=1
e&&D(t)&&(s=t.offsetWidth>0&&z(n.width)/t.offsetWidth||1,o=t.offsetHeight>0&&z(n.height)/t.offsetHeight||1)
var r=(L(t)?S(t):window).visualViewport,a=!B()&&i,l=(n.left+(a&&r?r.offsetLeft:0))/s,c=(n.top+(a&&r?r.offsetTop:0))/o,h=n.width/s,u=n.height/o
return{width:h,height:u,top:c,right:l+h,bottom:c+u,left:l,x:l,y:c}}function F(t){var e=R(t),i=t.offsetWidth,n=t.offsetHeight
return Math.abs(e.width-i)<=1&&(i=e.width),Math.abs(e.height-n)<=1&&(n=e.height),{x:t.offsetLeft,y:t.offsetTop,width:i,height:n}}function $(t,e){var i=e.getRootNode&&e.getRootNode()
if(t.contains(e))return!0
if(i&&I(i)){var n=e
do{if(n&&t.isSameNode(n))return!0
n=n.parentNode||n.host}while(n)}return!1}function W(t){return S(t).getComputedStyle(t)}function q(t){return["table","td","th"].indexOf(O(t))>=0}function V(t){return((L(t)?t.ownerDocument:t.document)||window.document).documentElement}function K(t){return"html"===O(t)?t:t.assignedSlot||t.parentNode||(I(t)?t.host:null)||V(t)}function Y(t){return D(t)&&"fixed"!==W(t).position?t.offsetParent:null}function X(t){for(var e=S(t),i=Y(t);i&&q(i)&&"static"===W(i).position;)i=Y(i)
return i&&("html"===O(i)||"body"===O(i)&&"static"===W(i).position)?e:i||function(t){var e=/firefox/i.test(H())
if(/Trident/i.test(H())&&D(t)&&"fixed"===W(t).position)return null
var i=K(t)
for(I(i)&&(i=i.host);D(i)&&["html","body"].indexOf(O(i))<0;){var n=W(i)
if("none"!==n.transform||"none"!==n.perspective||"paint"===n.contain||-1!==["transform","perspective"].indexOf(n.willChange)||e&&"filter"===n.willChange||e&&n.filter&&"none"!==n.filter)return i
i=i.parentNode}return null}(t)||e}function Q(t){return["top","bottom"].indexOf(t)>=0?"x":"y"}function U(t,e,i){return j(t,M(e,i))}function G(t){return Object.assign({},{top:0,right:0,bottom:0,left:0},t)}function J(t,e){return e.reduce((function(e,i){return e[i]=t,e}),{})}const Z={name:"arrow",enabled:!0,phase:"main",fn:function(t){var e,i=t.state,n=t.name,l=t.options,h=i.elements.arrow,u=i.modifiersData.popperOffsets,f=P(i.placement),d=Q(f),p=[a,r].indexOf(f)>=0?"height":"width"
if(h&&u){var g=function(t,e){return G("number"!=typeof(t="function"==typeof t?t(Object.assign({},e.rects,{placement:e.placement})):t)?t:J(t,c))}(l.padding,i),m=F(h),_="y"===d?s:a,b="y"===d?o:r,v=i.rects.reference[p]+i.rects.reference[d]-u[d]-i.rects.popper[p],y=u[d]-i.rects.reference[d],w=X(h),A=w?"y"===d?w.clientHeight||0:w.clientWidth||0:0,E=v/2-y/2,C=g[_],T=A-m[p]-g[b],x=A/2-m[p]/2+E,k=U(C,x,T),O=d
i.modifiersData[n]=((e={})[O]=k,e.centerOffset=k-x,e)}},effect:function(t){var e=t.state,i=t.options.element,n=void 0===i?"[data-popper-arrow]":i
null!=n&&("string"!=typeof n||(n=e.elements.popper.querySelector(n)))&&$(e.elements.popper,n)&&(e.elements.arrow=n)},requires:["popperOffsets"],requiresIfExists:["preventOverflow"]}
function tt(t){return t.split("-")[1]}var et={top:"auto",right:"auto",bottom:"auto",left:"auto"}
function it(t){var e,i=t.popper,n=t.popperRect,l=t.placement,c=t.variation,h=t.offsets,f=t.position,d=t.gpuAcceleration,p=t.adaptive,g=t.roundOffsets,m=t.isFixed,_=h.x,b=void 0===_?0:_,v=h.y,y=void 0===v?0:v,w="function"==typeof g?g({x:b,y:y}):{x:b,y:y}
b=w.x,y=w.y
var A=h.hasOwnProperty("x"),E=h.hasOwnProperty("y"),C=a,T=s,x=window
if(p){var k=X(i),O="clientHeight",L="clientWidth"
k===S(i)&&"static"!==W(k=V(i)).position&&"absolute"===f&&(O="scrollHeight",L="scrollWidth"),(l===s||(l===a||l===r)&&c===u)&&(T=o,y-=(m&&k===x&&x.visualViewport?x.visualViewport.height:k[O])-n.height,y*=d?1:-1),l!==a&&(l!==s&&l!==o||c!==u)||(C=r,b-=(m&&k===x&&x.visualViewport?x.visualViewport.width:k[L])-n.width,b*=d?1:-1)}var D,I=Object.assign({position:f},p&&et),N=!0===g?function(t){var e=t.x,i=t.y,n=window.devicePixelRatio||1
return{x:z(e*n)/n||0,y:z(i*n)/n||0}}({x:b,y:y}):{x:b,y:y}
return b=N.x,y=N.y,d?Object.assign({},I,((D={})[T]=E?"0":"",D[C]=A?"0":"",D.transform=(x.devicePixelRatio||1)<=1?"translate("+b+"px, "+y+"px)":"translate3d("+b+"px, "+y+"px, 0)",D)):Object.assign({},I,((e={})[T]=E?y+"px":"",e[C]=A?b+"px":"",e.transform="",e))}const nt={name:"computeStyles",enabled:!0,phase:"beforeWrite",fn:function(t){var e=t.state,i=t.options,n=i.gpuAcceleration,s=void 0===n||n,o=i.adaptive,r=void 0===o||o,a=i.roundOffsets,l=void 0===a||a,c={placement:P(e.placement),variation:tt(e.placement),popper:e.elements.popper,popperRect:e.rects.popper,gpuAcceleration:s,isFixed:"fixed"===e.options.strategy}
null!=e.modifiersData.popperOffsets&&(e.styles.popper=Object.assign({},e.styles.popper,it(Object.assign({},c,{offsets:e.modifiersData.popperOffsets,position:e.options.strategy,adaptive:r,roundOffsets:l})))),null!=e.modifiersData.arrow&&(e.styles.arrow=Object.assign({},e.styles.arrow,it(Object.assign({},c,{offsets:e.modifiersData.arrow,position:"absolute",adaptive:!1,roundOffsets:l})))),e.attributes.popper=Object.assign({},e.attributes.popper,{"data-popper-placement":e.placement})},data:{}}
var st={passive:!0}
const ot={name:"eventListeners",enabled:!0,phase:"write",fn:function(){},effect:function(t){var e=t.state,i=t.instance,n=t.options,s=n.scroll,o=void 0===s||s,r=n.resize,a=void 0===r||r,l=S(e.elements.popper),c=[].concat(e.scrollParents.reference,e.scrollParents.popper)
return o&&c.forEach((function(t){t.addEventListener("scroll",i.update,st)})),a&&l.addEventListener("resize",i.update,st),function(){o&&c.forEach((function(t){t.removeEventListener("scroll",i.update,st)})),a&&l.removeEventListener("resize",i.update,st)}},data:{}}
var rt={left:"right",right:"left",bottom:"top",top:"bottom"}
function at(t){return t.replace(/left|right|bottom|top/g,(function(t){return rt[t]}))}var lt={start:"end",end:"start"}
function ct(t){return t.replace(/start|end/g,(function(t){return lt[t]}))}function ht(t){var e=S(t)
return{scrollLeft:e.pageXOffset,scrollTop:e.pageYOffset}}function ut(t){return R(V(t)).left+ht(t).scrollLeft}function ft(t){var e=W(t),i=e.overflow,n=e.overflowX,s=e.overflowY
return/auto|scroll|overlay|hidden/.test(i+s+n)}function dt(t){return["html","body","#document"].indexOf(O(t))>=0?t.ownerDocument.body:D(t)&&ft(t)?t:dt(K(t))}function pt(t,e){var i
void 0===e&&(e=[])
var n=dt(t),s=n===(null==(i=t.ownerDocument)?void 0:i.body),o=S(n),r=s?[o].concat(o.visualViewport||[],ft(n)?n:[]):n,a=e.concat(r)
return s?a:a.concat(pt(K(r)))}function gt(t){return Object.assign({},t,{left:t.x,top:t.y,right:t.x+t.width,bottom:t.y+t.height})}function mt(t,e,i){return e===d?gt(function(t,e){var i=S(t),n=V(t),s=i.visualViewport,o=n.clientWidth,r=n.clientHeight,a=0,l=0
if(s){o=s.width,r=s.height
var c=B();(c||!c&&"fixed"===e)&&(a=s.offsetLeft,l=s.offsetTop)}return{width:o,height:r,x:a+ut(t),y:l}}(t,i)):L(e)?function(t,e){var i=R(t,!1,"fixed"===e)
return i.top=i.top+t.clientTop,i.left=i.left+t.clientLeft,i.bottom=i.top+t.clientHeight,i.right=i.left+t.clientWidth,i.width=t.clientWidth,i.height=t.clientHeight,i.x=i.left,i.y=i.top,i}(e,i):gt(function(t){var e,i=V(t),n=ht(t),s=null==(e=t.ownerDocument)?void 0:e.body,o=j(i.scrollWidth,i.clientWidth,s?s.scrollWidth:0,s?s.clientWidth:0),r=j(i.scrollHeight,i.clientHeight,s?s.scrollHeight:0,s?s.clientHeight:0),a=-n.scrollLeft+ut(t),l=-n.scrollTop
return"rtl"===W(s||i).direction&&(a+=j(i.clientWidth,s?s.clientWidth:0)-o),{width:o,height:r,x:a,y:l}}(V(t)))}function _t(t){var e,i=t.reference,n=t.element,l=t.placement,c=l?P(l):null,f=l?tt(l):null,d=i.x+i.width/2-n.width/2,p=i.y+i.height/2-n.height/2
switch(c){case s:e={x:d,y:i.y-n.height}
break
case o:e={x:d,y:i.y+i.height}
break
case r:e={x:i.x+i.width,y:p}
break
case a:e={x:i.x-n.width,y:p}
break
default:e={x:i.x,y:i.y}}var g=c?Q(c):null
if(null!=g){var m="y"===g?"height":"width"
switch(f){case h:e[g]=e[g]-(i[m]/2-n[m]/2)
break
case u:e[g]=e[g]+(i[m]/2-n[m]/2)}}return e}function bt(t,e){void 0===e&&(e={})
var i=e,n=i.placement,a=void 0===n?t.placement:n,l=i.strategy,h=void 0===l?t.strategy:l,u=i.boundary,m=void 0===u?f:u,_=i.rootBoundary,b=void 0===_?d:_,v=i.elementContext,y=void 0===v?p:v,w=i.altBoundary,A=void 0!==w&&w,E=i.padding,C=void 0===E?0:E,T=G("number"!=typeof C?C:J(C,c)),x=y===p?g:p,k=t.rects.popper,S=t.elements[A?x:y],I=function(t,e,i,n){var s="clippingParents"===e?function(t){var e=pt(K(t)),i=["absolute","fixed"].indexOf(W(t).position)>=0&&D(t)?X(t):t
return L(i)?e.filter((function(t){return L(t)&&$(t,i)&&"body"!==O(t)})):[]}(t):[].concat(e),o=[].concat(s,[i]),r=o[0],a=o.reduce((function(e,i){var s=mt(t,i,n)
return e.top=j(s.top,e.top),e.right=M(s.right,e.right),e.bottom=M(s.bottom,e.bottom),e.left=j(s.left,e.left),e}),mt(t,r,n))
return a.width=a.right-a.left,a.height=a.bottom-a.top,a.x=a.left,a.y=a.top,a}(L(S)?S:S.contextElement||V(t.elements.popper),m,b,h),N=R(t.elements.reference),P=_t({reference:N,element:k,strategy:"absolute",placement:a}),z=gt(Object.assign({},k,P)),H=y===p?z:N,B={top:I.top-H.top+T.top,bottom:H.bottom-I.bottom+T.bottom,left:I.left-H.left+T.left,right:H.right-I.right+T.right},F=t.modifiersData.offset
if(y===p&&F){var q=F[a]
Object.keys(B).forEach((function(t){var e=[r,o].indexOf(t)>=0?1:-1,i=[s,o].indexOf(t)>=0?"y":"x"
B[t]+=q[i]*e}))}return B}const vt={name:"flip",enabled:!0,phase:"main",fn:function(t){var e=t.state,i=t.options,n=t.name
if(!e.modifiersData[n]._skip){for(var u=i.mainAxis,f=void 0===u||u,d=i.altAxis,p=void 0===d||d,g=i.fallbackPlacements,b=i.padding,v=i.boundary,y=i.rootBoundary,w=i.altBoundary,A=i.flipVariations,E=void 0===A||A,C=i.allowedAutoPlacements,T=e.options.placement,x=P(T),k=g||(x!==T&&E?function(t){if(P(t)===l)return[]
var e=at(t)
return[ct(t),e,ct(e)]}(T):[at(T)]),O=[T].concat(k).reduce((function(t,i){return t.concat(P(i)===l?function(t,e){void 0===e&&(e={})
var i=e,n=i.placement,s=i.boundary,o=i.rootBoundary,r=i.padding,a=i.flipVariations,l=i.allowedAutoPlacements,h=void 0===l?_:l,u=tt(n),f=u?a?m:m.filter((function(t){return tt(t)===u})):c,d=f.filter((function(t){return h.indexOf(t)>=0}))
0===d.length&&(d=f)
var p=d.reduce((function(e,i){return e[i]=bt(t,{placement:i,boundary:s,rootBoundary:o,padding:r})[P(i)],e}),{})
return Object.keys(p).sort((function(t,e){return p[t]-p[e]}))}(e,{placement:i,boundary:v,rootBoundary:y,padding:b,flipVariations:E,allowedAutoPlacements:C}):i)}),[]),S=e.rects.reference,L=e.rects.popper,D=new Map,I=!0,N=O[0],j=0;j<O.length;j++){var M=O[j],z=P(M),H=tt(M)===h,B=[s,o].indexOf(z)>=0,R=B?"width":"height",F=bt(e,{placement:M,boundary:v,rootBoundary:y,altBoundary:w,padding:b}),$=B?H?r:a:H?o:s
S[R]>L[R]&&($=at($))
var W=at($),q=[]
if(f&&q.push(F[z]<=0),p&&q.push(F[$]<=0,F[W]<=0),q.every((function(t){return t}))){N=M,I=!1
break}D.set(M,q)}if(I)for(var V=function(t){var e=O.find((function(e){var i=D.get(e)
if(i)return i.slice(0,t).every((function(t){return t}))}))
if(e)return N=e,"break"},K=E?3:1;K>0&&"break"!==V(K);K--);e.placement!==N&&(e.modifiersData[n]._skip=!0,e.placement=N,e.reset=!0)}},requiresIfExists:["offset"],data:{_skip:!1}}
function yt(t,e,i){return void 0===i&&(i={x:0,y:0}),{top:t.top-e.height-i.y,right:t.right-e.width+i.x,bottom:t.bottom-e.height+i.y,left:t.left-e.width-i.x}}function wt(t){return[s,r,o,a].some((function(e){return t[e]>=0}))}const At={name:"hide",enabled:!0,phase:"main",requiresIfExists:["preventOverflow"],fn:function(t){var e=t.state,i=t.name,n=e.rects.reference,s=e.rects.popper,o=e.modifiersData.preventOverflow,r=bt(e,{elementContext:"reference"}),a=bt(e,{altBoundary:!0}),l=yt(r,n),c=yt(a,s,o),h=wt(l),u=wt(c)
e.modifiersData[i]={referenceClippingOffsets:l,popperEscapeOffsets:c,isReferenceHidden:h,hasPopperEscaped:u},e.attributes.popper=Object.assign({},e.attributes.popper,{"data-popper-reference-hidden":h,"data-popper-escaped":u})}},Et={name:"offset",enabled:!0,phase:"main",requires:["popperOffsets"],fn:function(t){var e=t.state,i=t.options,n=t.name,o=i.offset,l=void 0===o?[0,0]:o,c=_.reduce((function(t,i){return t[i]=function(t,e,i){var n=P(t),o=[a,s].indexOf(n)>=0?-1:1,l="function"==typeof i?i(Object.assign({},e,{placement:t})):i,c=l[0],h=l[1]
return c=c||0,h=(h||0)*o,[a,r].indexOf(n)>=0?{x:h,y:c}:{x:c,y:h}}(i,e.rects,l),t}),{}),h=c[e.placement],u=h.x,f=h.y
null!=e.modifiersData.popperOffsets&&(e.modifiersData.popperOffsets.x+=u,e.modifiersData.popperOffsets.y+=f),e.modifiersData[n]=c}},Ct={name:"popperOffsets",enabled:!0,phase:"read",fn:function(t){var e=t.state,i=t.name
e.modifiersData[i]=_t({reference:e.rects.reference,element:e.rects.popper,strategy:"absolute",placement:e.placement})},data:{}},Tt={name:"preventOverflow",enabled:!0,phase:"main",fn:function(t){var e=t.state,i=t.options,n=t.name,l=i.mainAxis,c=void 0===l||l,u=i.altAxis,f=void 0!==u&&u,d=i.boundary,p=i.rootBoundary,g=i.altBoundary,m=i.padding,_=i.tether,b=void 0===_||_,v=i.tetherOffset,y=void 0===v?0:v,w=bt(e,{boundary:d,rootBoundary:p,padding:m,altBoundary:g}),A=P(e.placement),E=tt(e.placement),C=!E,T=Q(A),x="x"===T?"y":"x",k=e.modifiersData.popperOffsets,O=e.rects.reference,S=e.rects.popper,L="function"==typeof y?y(Object.assign({},e.rects,{placement:e.placement})):y,D="number"==typeof L?{mainAxis:L,altAxis:L}:Object.assign({mainAxis:0,altAxis:0},L),I=e.modifiersData.offset?e.modifiersData.offset[e.placement]:null,N={x:0,y:0}
if(k){if(c){var z,H="y"===T?s:a,B="y"===T?o:r,R="y"===T?"height":"width",$=k[T],W=$+w[H],q=$-w[B],V=b?-S[R]/2:0,K=E===h?O[R]:S[R],Y=E===h?-S[R]:-O[R],G=e.elements.arrow,J=b&&G?F(G):{width:0,height:0},Z=e.modifiersData["arrow#persistent"]?e.modifiersData["arrow#persistent"].padding:{top:0,right:0,bottom:0,left:0},et=Z[H],it=Z[B],nt=U(0,O[R],J[R]),st=C?O[R]/2-V-nt-et-D.mainAxis:K-nt-et-D.mainAxis,ot=C?-O[R]/2+V+nt+it+D.mainAxis:Y+nt+it+D.mainAxis,rt=e.elements.arrow&&X(e.elements.arrow),at=rt?"y"===T?rt.clientTop||0:rt.clientLeft||0:0,lt=null!=(z=null==I?void 0:I[T])?z:0,ct=$+ot-lt,ht=U(b?M(W,$+st-lt-at):W,$,b?j(q,ct):q)
k[T]=ht,N[T]=ht-$}if(f){var ut,ft="x"===T?s:a,dt="x"===T?o:r,pt=k[x],gt="y"===x?"height":"width",mt=pt+w[ft],_t=pt-w[dt],vt=-1!==[s,a].indexOf(A),yt=null!=(ut=null==I?void 0:I[x])?ut:0,wt=vt?mt:pt-O[gt]-S[gt]-yt+D.altAxis,At=vt?pt+O[gt]+S[gt]-yt-D.altAxis:_t,Et=b&&vt?function(t,e,i){var n=U(t,e,i)
return n>i?i:n}(wt,pt,At):U(b?wt:mt,pt,b?At:_t)
k[x]=Et,N[x]=Et-pt}e.modifiersData[n]=N}},requiresIfExists:["offset"]}
function xt(t,e,i){void 0===i&&(i=!1)
var n,s,o=D(e),r=D(e)&&function(t){var e=t.getBoundingClientRect(),i=z(e.width)/t.offsetWidth||1,n=z(e.height)/t.offsetHeight||1
return 1!==i||1!==n}(e),a=V(e),l=R(t,r,i),c={scrollLeft:0,scrollTop:0},h={x:0,y:0}
return(o||!o&&!i)&&(("body"!==O(e)||ft(a))&&(c=(n=e)!==S(n)&&D(n)?{scrollLeft:(s=n).scrollLeft,scrollTop:s.scrollTop}:ht(n)),D(e)?((h=R(e,!0)).x+=e.clientLeft,h.y+=e.clientTop):a&&(h.x=ut(a))),{x:l.left+c.scrollLeft-h.x,y:l.top+c.scrollTop-h.y,width:l.width,height:l.height}}function kt(t){var e=new Map,i=new Set,n=[]
function s(t){i.add(t.name),[].concat(t.requires||[],t.requiresIfExists||[]).forEach((function(t){if(!i.has(t)){var n=e.get(t)
n&&s(n)}})),n.push(t)}return t.forEach((function(t){e.set(t.name,t)})),t.forEach((function(t){i.has(t.name)||s(t)})),n}var Ot={placement:"bottom",modifiers:[],strategy:"absolute"}
function St(){for(var t=arguments.length,e=new Array(t),i=0;i<t;i++)e[i]=arguments[i]
return!e.some((function(t){return!(t&&"function"==typeof t.getBoundingClientRect)}))}function Lt(t){void 0===t&&(t={})
var e=t,i=e.defaultModifiers,n=void 0===i?[]:i,s=e.defaultOptions,o=void 0===s?Ot:s
return function(t,e,i){void 0===i&&(i=o)
var s,r,a={placement:"bottom",orderedModifiers:[],options:Object.assign({},Ot,o),modifiersData:{},elements:{reference:t,popper:e},attributes:{},styles:{}},l=[],c=!1,h={state:a,setOptions:function(i){var s="function"==typeof i?i(a.options):i
u(),a.options=Object.assign({},o,a.options,s),a.scrollParents={reference:L(t)?pt(t):t.contextElement?pt(t.contextElement):[],popper:pt(e)}
var r,c,f=function(t){var e=kt(t)
return k.reduce((function(t,i){return t.concat(e.filter((function(t){return t.phase===i})))}),[])}((r=[].concat(n,a.options.modifiers),c=r.reduce((function(t,e){var i=t[e.name]
return t[e.name]=i?Object.assign({},i,e,{options:Object.assign({},i.options,e.options),data:Object.assign({},i.data,e.data)}):e,t}),{}),Object.keys(c).map((function(t){return c[t]}))))
return a.orderedModifiers=f.filter((function(t){return t.enabled})),a.orderedModifiers.forEach((function(t){var e=t.name,i=t.options,n=void 0===i?{}:i,s=t.effect
if("function"==typeof s){var o=s({state:a,name:e,instance:h,options:n})
l.push(o||function(){})}})),h.update()},forceUpdate:function(){if(!c){var t=a.elements,e=t.reference,i=t.popper
if(St(e,i)){a.rects={reference:xt(e,X(i),"fixed"===a.options.strategy),popper:F(i)},a.reset=!1,a.placement=a.options.placement,a.orderedModifiers.forEach((function(t){return a.modifiersData[t.name]=Object.assign({},t.data)}))
for(var n=0;n<a.orderedModifiers.length;n++)if(!0!==a.reset){var s=a.orderedModifiers[n],o=s.fn,r=s.options,l=void 0===r?{}:r,u=s.name
"function"==typeof o&&(a=o({state:a,options:l,name:u,instance:h})||a)}else a.reset=!1,n=-1}}},update:(s=function(){return new Promise((function(t){h.forceUpdate(),t(a)}))},function(){return r||(r=new Promise((function(t){Promise.resolve().then((function(){r=void 0,t(s())}))}))),r}),destroy:function(){u(),c=!0}}
if(!St(t,e))return h
function u(){l.forEach((function(t){return t()})),l=[]}return h.setOptions(i).then((function(t){!c&&i.onFirstUpdate&&i.onFirstUpdate(t)})),h}}var Dt=Lt(),It=Lt({defaultModifiers:[ot,Ct,nt,N,Et,vt,Tt,Z,At]}),Nt=Lt({defaultModifiers:[ot,Ct,nt,N]})
const Pt="transitionend",jt=t=>{let e=t.getAttribute("data-bs-target")
if(!e||"#"===e){let i=t.getAttribute("href")
if(!i||!i.includes("#")&&!i.startsWith("."))return null
i.includes("#")&&!i.startsWith("#")&&(i=`#${i.split("#")[1]}`),e=i&&"#"!==i?i.trim():null}return e},Mt=t=>{const e=jt(t)
return e&&document.querySelector(e)?e:null},zt=t=>{const e=jt(t)
return e?document.querySelector(e):null},Ht=t=>{if(!t)return 0
let{transitionDuration:e,transitionDelay:i}=window.getComputedStyle(t)
const n=Number.parseFloat(e),s=Number.parseFloat(i)
return n||s?(e=e.split(",")[0],i=i.split(",")[0],1e3*(Number.parseFloat(e)+Number.parseFloat(i))):0},Bt=t=>{t.dispatchEvent(new Event(Pt))},Rt=t=>!(!t||"object"!=typeof t)&&(void 0!==t.jquery&&(t=t[0]),void 0!==t.nodeType),Ft=t=>Rt(t)?t.jquery?t[0]:t:"string"==typeof t&&t.length>0?document.querySelector(t):null,$t=t=>{if(!Rt(t)||0===t.getClientRects().length)return!1
const e="visible"===getComputedStyle(t).getPropertyValue("visibility"),i=t.closest("details:not([open])")
if(!i)return e
if(i!==t){const e=t.closest("summary")
if(e&&e.parentNode!==i)return!1
if(null===e)return!1}return e},Wt=t=>!t||t.nodeType!==Node.ELEMENT_NODE||!!t.classList.contains("disabled")||(void 0!==t.disabled?t.disabled:t.hasAttribute("disabled")&&"false"!==t.getAttribute("disabled")),qt=t=>{if(!document.documentElement.attachShadow)return null
if("function"==typeof t.getRootNode){const e=t.getRootNode()
return e instanceof ShadowRoot?e:null}return t instanceof ShadowRoot?t:t.parentNode?qt(t.parentNode):null},Vt=()=>{},Kt=t=>{t.offsetHeight},Yt=()=>window.jQuery&&!document.body.hasAttribute("data-bs-no-jquery")?window.jQuery:null,Xt=[],Qt=()=>"rtl"===document.documentElement.dir,Ut=t=>{var e
e=()=>{const e=Yt()
if(e){const i=t.NAME,n=e.fn[i]
e.fn[i]=t.jQueryInterface,e.fn[i].Constructor=t,e.fn[i].noConflict=()=>(e.fn[i]=n,t.jQueryInterface)}},"loading"===document.readyState?(Xt.length||document.addEventListener("DOMContentLoaded",(()=>{for(const t of Xt)t()})),Xt.push(e)):e()},Gt=t=>{"function"==typeof t&&t()},Jt=function(t,e){let i=!(arguments.length>2&&void 0!==arguments[2])||arguments[2]
if(!i)return void Gt(t)
const n=5,s=Ht(e)+n
let o=!1
const r=i=>{let{target:n}=i
n===e&&(o=!0,e.removeEventListener(Pt,r),Gt(t))}
e.addEventListener(Pt,r),setTimeout((()=>{o||Bt(e)}),s)},Zt=(t,e,i,n)=>{const s=t.length
let o=t.indexOf(e)
return-1===o?!i&&n?t[s-1]:t[0]:(o+=i?1:-1,n&&(o=(o+s)%s),t[Math.max(0,Math.min(o,s-1))])},te=/[^.]*(?=\..*)\.|.*/,ee=/\..*/,ie=/::\d+$/,ne={}
let se=1
const oe={mouseenter:"mouseover",mouseleave:"mouseout"},re=new Set(["click","dblclick","mouseup","mousedown","contextmenu","mousewheel","DOMMouseScroll","mouseover","mouseout","mousemove","selectstart","selectend","keydown","keypress","keyup","orientationchange","touchstart","touchmove","touchend","touchcancel","pointerdown","pointermove","pointerup","pointerleave","pointercancel","gesturestart","gesturechange","gestureend","focus","blur","change","reset","select","submit","focusin","focusout","load","unload","beforeunload","resize","move","DOMContentLoaded","readystatechange","error","abort","scroll"])
function ae(t,e){return e&&`${e}::${se++}`||t.uidEvent||se++}function le(t){const e=ae(t)
return t.uidEvent=e,ne[e]=ne[e]||{},ne[e]}function ce(t,e){let i=arguments.length>2&&void 0!==arguments[2]?arguments[2]:null
return Object.values(t).find((t=>t.callable===e&&t.delegationSelector===i))}function he(t,e,i){const n="string"==typeof e,s=n?i:e||i
let o=pe(t)
return re.has(o)||(o=t),[n,s,o]}function ue(t,e,i,n,s){if("string"!=typeof e||!t)return
let[o,r,a]=he(e,i,n)
if(e in oe){const t=t=>function(e){if(!e.relatedTarget||e.relatedTarget!==e.delegateTarget&&!e.delegateTarget.contains(e.relatedTarget))return t.call(this,e)}
r=t(r)}const l=le(t),c=l[a]||(l[a]={}),h=ce(c,r,o?i:null)
if(h)return void(h.oneOff=h.oneOff&&s)
const u=ae(r,e.replace(te,"")),f=o?function(t,e,i){return function n(s){const o=t.querySelectorAll(e)
for(let{target:r}=s;r&&r!==this;r=r.parentNode)for(const a of o)if(a===r)return me(s,{delegateTarget:r}),n.oneOff&&ge.off(t,s.type,e,i),i.apply(r,[s])}}(t,i,r):function(t,e){return function i(n){return me(n,{delegateTarget:t}),i.oneOff&&ge.off(t,n.type,e),e.apply(t,[n])}}(t,r)
f.delegationSelector=o?i:null,f.callable=r,f.oneOff=s,f.uidEvent=u,c[u]=f,t.addEventListener(a,f,o)}function fe(t,e,i,n,s){const o=ce(e[i],n,s)
o&&(t.removeEventListener(i,o,Boolean(s)),delete e[i][o.uidEvent])}function de(t,e,i,n){const s=e[i]||{}
for(const o of Object.keys(s))if(o.includes(n)){const n=s[o]
fe(t,e,i,n.callable,n.delegationSelector)}}function pe(t){return t=t.replace(ee,""),oe[t]||t}const ge={on(t,e,i,n){ue(t,e,i,n,!1)},one(t,e,i,n){ue(t,e,i,n,!0)},off(t,e,i,n){if("string"!=typeof e||!t)return
const[s,o,r]=he(e,i,n),a=r!==e,l=le(t),c=l[r]||{},h=e.startsWith(".")
if(void 0===o){if(h)for(const i of Object.keys(l))de(t,l,i,e.slice(1))
for(const i of Object.keys(c)){const n=i.replace(ie,"")
if(!a||e.includes(n)){const e=c[i]
fe(t,l,r,e.callable,e.delegationSelector)}}}else{if(!Object.keys(c).length)return
fe(t,l,r,o,s?i:null)}},trigger(t,e,i){if("string"!=typeof e||!t)return null
const n=Yt()
let s=null,o=!0,r=!0,a=!1
e!==pe(e)&&n&&(s=n.Event(e,i),n(t).trigger(s),o=!s.isPropagationStopped(),r=!s.isImmediatePropagationStopped(),a=s.isDefaultPrevented())
let l=new Event(e,{bubbles:o,cancelable:!0})
return l=me(l,i),a&&l.preventDefault(),r&&t.dispatchEvent(l),l.defaultPrevented&&s&&s.preventDefault(),l}}
function me(t,e){for(const[i,n]of Object.entries(e||{}))try{t[i]=n}catch(e){Object.defineProperty(t,i,{configurable:!0,get:()=>n})}return t}const _e=new Map,be={set(t,e,i){_e.has(t)||_e.set(t,new Map)
const n=_e.get(t)
n.has(e)||0===n.size?n.set(e,i):console.error(`Bootstrap doesn't allow more than one instance per element. Bound instance: ${Array.from(n.keys())[0]}.`)},get:(t,e)=>_e.has(t)&&_e.get(t).get(e)||null,remove(t,e){if(!_e.has(t))return
const i=_e.get(t)
i.delete(e),0===i.size&&_e.delete(t)}}
function ve(t){if("true"===t)return!0
if("false"===t)return!1
if(t===Number(t).toString())return Number(t)
if(""===t||"null"===t)return null
if("string"!=typeof t)return t
try{return JSON.parse(decodeURIComponent(t))}catch(e){return t}}function ye(t){return t.replace(/[A-Z]/g,(t=>`-${t.toLowerCase()}`))}const we={setDataAttribute(t,e,i){t.setAttribute(`data-bs-${ye(e)}`,i)},removeDataAttribute(t,e){t.removeAttribute(`data-bs-${ye(e)}`)},getDataAttributes(t){if(!t)return{}
const e={},i=Object.keys(t.dataset).filter((t=>t.startsWith("bs")&&!t.startsWith("bsConfig")))
for(const n of i){let i=n.replace(/^bs/,"")
i=i.charAt(0).toLowerCase()+i.slice(1,i.length),e[i]=ve(t.dataset[n])}return e},getDataAttribute:(t,e)=>ve(t.getAttribute(`data-bs-${ye(e)}`))}
class Ae{static get Default(){return{}}static get DefaultType(){return{}}static get NAME(){throw new Error('You have to implement the static method "NAME", for each component!')}_getConfig(t){return t=this._mergeConfigObj(t),t=this._configAfterMerge(t),this._typeCheckConfig(t),t}_configAfterMerge(t){return t}_mergeConfigObj(t,e){const i=Rt(e)?we.getDataAttribute(e,"config"):{}
return{...this.constructor.Default,..."object"==typeof i?i:{},...Rt(e)?we.getDataAttributes(e):{},..."object"==typeof t?t:{}}}_typeCheckConfig(t){let e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:this.constructor.DefaultType
for(const n of Object.keys(e)){const s=e[n],o=t[n],r=Rt(o)?"element":null==(i=o)?`${i}`:Object.prototype.toString.call(i).match(/\s([a-z]+)/i)[1].toLowerCase()
if(!new RegExp(s).test(r))throw new TypeError(`${this.constructor.NAME.toUpperCase()}: Option "${n}" provided type "${r}" but expected type "${s}".`)}var i}}class Ee extends Ae{constructor(t,e){super(),(t=Ft(t))&&(this._element=t,this._config=this._getConfig(e),be.set(this._element,this.constructor.DATA_KEY,this))}dispose(){be.remove(this._element,this.constructor.DATA_KEY),ge.off(this._element,this.constructor.EVENT_KEY)
for(const t of Object.getOwnPropertyNames(this))this[t]=null}_queueCallback(t,e){Jt(t,e,!(arguments.length>2&&void 0!==arguments[2])||arguments[2])}_getConfig(t){return t=this._mergeConfigObj(t,this._element),t=this._configAfterMerge(t),this._typeCheckConfig(t),t}static getInstance(t){return be.get(Ft(t),this.DATA_KEY)}static getOrCreateInstance(t){let e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{}
return this.getInstance(t)||new this(t,"object"==typeof e?e:null)}static get VERSION(){return"5.2.3"}static get DATA_KEY(){return`bs.${this.NAME}`}static get EVENT_KEY(){return`.${this.DATA_KEY}`}static eventName(t){return`${t}${this.EVENT_KEY}`}}const Ce=function(t){let e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:"hide"
const i=`click.dismiss${t.EVENT_KEY}`,n=t.NAME
ge.on(document,i,`[data-bs-dismiss="${n}"]`,(function(i){if(["A","AREA"].includes(this.tagName)&&i.preventDefault(),Wt(this))return
const s=zt(this)||this.closest(`.${n}`)
t.getOrCreateInstance(s)[e]()}))}
class Te extends Ee{static get NAME(){return"alert"}close(){if(ge.trigger(this._element,"close.bs.alert").defaultPrevented)return
this._element.classList.remove("show")
const t=this._element.classList.contains("fade")
this._queueCallback((()=>this._destroyElement()),this._element,t)}_destroyElement(){this._element.remove(),ge.trigger(this._element,"closed.bs.alert"),this.dispose()}static jQueryInterface(t){return this.each((function(){const e=Te.getOrCreateInstance(this)
if("string"==typeof t){if(void 0===e[t]||t.startsWith("_")||"constructor"===t)throw new TypeError(`No method named "${t}"`)
e[t](this)}}))}}Ce(Te,"close"),Ut(Te)
const xe='[data-bs-toggle="button"]'
class ke extends Ee{static get NAME(){return"button"}toggle(){this._element.setAttribute("aria-pressed",this._element.classList.toggle("active"))}static jQueryInterface(t){return this.each((function(){const e=ke.getOrCreateInstance(this)
"toggle"===t&&e[t]()}))}}ge.on(document,"click.bs.button.data-api",xe,(t=>{t.preventDefault()
const e=t.target.closest(xe)
ke.getOrCreateInstance(e).toggle()})),Ut(ke)
const Oe={find(t){let e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:document.documentElement
return[].concat(...Element.prototype.querySelectorAll.call(e,t))},findOne(t){let e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:document.documentElement
return Element.prototype.querySelector.call(e,t)},children:(t,e)=>[].concat(...t.children).filter((t=>t.matches(e))),parents(t,e){const i=[]
let n=t.parentNode.closest(e)
for(;n;)i.push(n),n=n.parentNode.closest(e)
return i},prev(t,e){let i=t.previousElementSibling
for(;i;){if(i.matches(e))return[i]
i=i.previousElementSibling}return[]},next(t,e){let i=t.nextElementSibling
for(;i;){if(i.matches(e))return[i]
i=i.nextElementSibling}return[]},focusableChildren(t){const e=["a","button","input","textarea","select","details","[tabindex]",'[contenteditable="true"]'].map((t=>`${t}:not([tabindex^="-"])`)).join(",")
return this.find(e,t).filter((t=>!Wt(t)&&$t(t)))}},Se={endCallback:null,leftCallback:null,rightCallback:null},Le={endCallback:"(function|null)",leftCallback:"(function|null)",rightCallback:"(function|null)"}
class De extends Ae{constructor(t,e){super(),this._element=t,t&&De.isSupported()&&(this._config=this._getConfig(e),this._deltaX=0,this._supportPointerEvents=Boolean(window.PointerEvent),this._initEvents())}static get Default(){return Se}static get DefaultType(){return Le}static get NAME(){return"swipe"}dispose(){ge.off(this._element,".bs.swipe")}_start(t){this._supportPointerEvents?this._eventIsPointerPenTouch(t)&&(this._deltaX=t.clientX):this._deltaX=t.touches[0].clientX}_end(t){this._eventIsPointerPenTouch(t)&&(this._deltaX=t.clientX-this._deltaX),this._handleSwipe(),Gt(this._config.endCallback)}_move(t){this._deltaX=t.touches&&t.touches.length>1?0:t.touches[0].clientX-this._deltaX}_handleSwipe(){const t=Math.abs(this._deltaX)
if(t<=40)return
const e=t/this._deltaX
this._deltaX=0,e&&Gt(e>0?this._config.rightCallback:this._config.leftCallback)}_initEvents(){this._supportPointerEvents?(ge.on(this._element,"pointerdown.bs.swipe",(t=>this._start(t))),ge.on(this._element,"pointerup.bs.swipe",(t=>this._end(t))),this._element.classList.add("pointer-event")):(ge.on(this._element,"touchstart.bs.swipe",(t=>this._start(t))),ge.on(this._element,"touchmove.bs.swipe",(t=>this._move(t))),ge.on(this._element,"touchend.bs.swipe",(t=>this._end(t))))}_eventIsPointerPenTouch(t){return this._supportPointerEvents&&("pen"===t.pointerType||"touch"===t.pointerType)}static isSupported(){return"ontouchstart"in document.documentElement||navigator.maxTouchPoints>0}}const Ie="next",Ne="prev",Pe="left",je="right",Me="slid.bs.carousel",ze="carousel",He="active",Be={ArrowLeft:je,ArrowRight:Pe},Re={interval:5e3,keyboard:!0,pause:"hover",ride:!1,touch:!0,wrap:!0},Fe={interval:"(number|boolean)",keyboard:"boolean",pause:"(string|boolean)",ride:"(boolean|string)",touch:"boolean",wrap:"boolean"}
class $e extends Ee{constructor(t,e){super(t,e),this._interval=null,this._activeElement=null,this._isSliding=!1,this.touchTimeout=null,this._swipeHelper=null,this._indicatorsElement=Oe.findOne(".carousel-indicators",this._element),this._addEventListeners(),this._config.ride===ze&&this.cycle()}static get Default(){return Re}static get DefaultType(){return Fe}static get NAME(){return"carousel"}next(){this._slide(Ie)}nextWhenVisible(){!document.hidden&&$t(this._element)&&this.next()}prev(){this._slide(Ne)}pause(){this._isSliding&&Bt(this._element),this._clearInterval()}cycle(){this._clearInterval(),this._updateInterval(),this._interval=setInterval((()=>this.nextWhenVisible()),this._config.interval)}_maybeEnableCycle(){this._config.ride&&(this._isSliding?ge.one(this._element,Me,(()=>this.cycle())):this.cycle())}to(t){const e=this._getItems()
if(t>e.length-1||t<0)return
if(this._isSliding)return void ge.one(this._element,Me,(()=>this.to(t)))
const i=this._getItemIndex(this._getActive())
if(i===t)return
const n=t>i?Ie:Ne
this._slide(n,e[t])}dispose(){this._swipeHelper&&this._swipeHelper.dispose(),super.dispose()}_configAfterMerge(t){return t.defaultInterval=t.interval,t}_addEventListeners(){this._config.keyboard&&ge.on(this._element,"keydown.bs.carousel",(t=>this._keydown(t))),"hover"===this._config.pause&&(ge.on(this._element,"mouseenter.bs.carousel",(()=>this.pause())),ge.on(this._element,"mouseleave.bs.carousel",(()=>this._maybeEnableCycle()))),this._config.touch&&De.isSupported()&&this._addTouchEventListeners()}_addTouchEventListeners(){for(const e of Oe.find(".carousel-item img",this._element))ge.on(e,"dragstart.bs.carousel",(t=>t.preventDefault()))
const t={leftCallback:()=>this._slide(this._directionToOrder(Pe)),rightCallback:()=>this._slide(this._directionToOrder(je)),endCallback:()=>{"hover"===this._config.pause&&(this.pause(),this.touchTimeout&&clearTimeout(this.touchTimeout),this.touchTimeout=setTimeout((()=>this._maybeEnableCycle()),500+this._config.interval))}}
this._swipeHelper=new De(this._element,t)}_keydown(t){if(/input|textarea/i.test(t.target.tagName))return
const e=Be[t.key]
e&&(t.preventDefault(),this._slide(this._directionToOrder(e)))}_getItemIndex(t){return this._getItems().indexOf(t)}_setActiveIndicatorElement(t){if(!this._indicatorsElement)return
const e=Oe.findOne(".active",this._indicatorsElement)
e.classList.remove(He),e.removeAttribute("aria-current")
const i=Oe.findOne(`[data-bs-slide-to="${t}"]`,this._indicatorsElement)
i&&(i.classList.add(He),i.setAttribute("aria-current","true"))}_updateInterval(){const t=this._activeElement||this._getActive()
if(!t)return
const e=Number.parseInt(t.getAttribute("data-bs-interval"),10)
this._config.interval=e||this._config.defaultInterval}_slide(t){let e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:null
if(this._isSliding)return
const i=this._getActive(),n=t===Ie,s=e||Zt(this._getItems(),i,n,this._config.wrap)
if(s===i)return
const o=this._getItemIndex(s),r=e=>ge.trigger(this._element,e,{relatedTarget:s,direction:this._orderToDirection(t),from:this._getItemIndex(i),to:o})
if(r("slide.bs.carousel").defaultPrevented)return
if(!i||!s)return
const a=Boolean(this._interval)
this.pause(),this._isSliding=!0,this._setActiveIndicatorElement(o),this._activeElement=s
const l=n?"carousel-item-start":"carousel-item-end",c=n?"carousel-item-next":"carousel-item-prev"
s.classList.add(c),Kt(s),i.classList.add(l),s.classList.add(l),this._queueCallback((()=>{s.classList.remove(l,c),s.classList.add(He),i.classList.remove(He,c,l),this._isSliding=!1,r(Me)}),i,this._isAnimated()),a&&this.cycle()}_isAnimated(){return this._element.classList.contains("slide")}_getActive(){return Oe.findOne(".active.carousel-item",this._element)}_getItems(){return Oe.find(".carousel-item",this._element)}_clearInterval(){this._interval&&(clearInterval(this._interval),this._interval=null)}_directionToOrder(t){return Qt()?t===Pe?Ne:Ie:t===Pe?Ie:Ne}_orderToDirection(t){return Qt()?t===Ne?Pe:je:t===Ne?je:Pe}static jQueryInterface(t){return this.each((function(){const e=$e.getOrCreateInstance(this,t)
if("number"!=typeof t){if("string"==typeof t){if(void 0===e[t]||t.startsWith("_")||"constructor"===t)throw new TypeError(`No method named "${t}"`)
e[t]()}}else e.to(t)}))}}ge.on(document,"click.bs.carousel.data-api","[data-bs-slide], [data-bs-slide-to]",(function(t){const e=zt(this)
if(!e||!e.classList.contains(ze))return
t.preventDefault()
const i=$e.getOrCreateInstance(e),n=this.getAttribute("data-bs-slide-to")
return n?(i.to(n),void i._maybeEnableCycle()):"next"===we.getDataAttribute(this,"slide")?(i.next(),void i._maybeEnableCycle()):(i.prev(),void i._maybeEnableCycle())})),ge.on(window,"load.bs.carousel.data-api",(()=>{const t=Oe.find('[data-bs-ride="carousel"]')
for(const e of t)$e.getOrCreateInstance(e)})),Ut($e)
const We="show",qe="collapse",Ve="collapsing",Ke='[data-bs-toggle="collapse"]',Ye={parent:null,toggle:!0},Xe={parent:"(null|element)",toggle:"boolean"}
class Qe extends Ee{constructor(t,e){super(t,e),this._isTransitioning=!1,this._triggerArray=[]
const i=Oe.find(Ke)
for(const n of i){const t=Mt(n),e=Oe.find(t).filter((t=>t===this._element))
null!==t&&e.length&&this._triggerArray.push(n)}this._initializeChildren(),this._config.parent||this._addAriaAndCollapsedClass(this._triggerArray,this._isShown()),this._config.toggle&&this.toggle()}static get Default(){return Ye}static get DefaultType(){return Xe}static get NAME(){return"collapse"}toggle(){this._isShown()?this.hide():this.show()}show(){if(this._isTransitioning||this._isShown())return
let t=[]
if(this._config.parent&&(t=this._getFirstLevelChildren(".collapse.show, .collapse.collapsing").filter((t=>t!==this._element)).map((t=>Qe.getOrCreateInstance(t,{toggle:!1})))),t.length&&t[0]._isTransitioning)return
if(ge.trigger(this._element,"show.bs.collapse").defaultPrevented)return
for(const n of t)n.hide()
const e=this._getDimension()
this._element.classList.remove(qe),this._element.classList.add(Ve),this._element.style[e]=0,this._addAriaAndCollapsedClass(this._triggerArray,!0),this._isTransitioning=!0
const i=`scroll${e[0].toUpperCase()+e.slice(1)}`
this._queueCallback((()=>{this._isTransitioning=!1,this._element.classList.remove(Ve),this._element.classList.add(qe,We),this._element.style[e]="",ge.trigger(this._element,"shown.bs.collapse")}),this._element,!0),this._element.style[e]=`${this._element[i]}px`}hide(){if(this._isTransitioning||!this._isShown())return
if(ge.trigger(this._element,"hide.bs.collapse").defaultPrevented)return
const t=this._getDimension()
this._element.style[t]=`${this._element.getBoundingClientRect()[t]}px`,Kt(this._element),this._element.classList.add(Ve),this._element.classList.remove(qe,We)
for(const e of this._triggerArray){const t=zt(e)
t&&!this._isShown(t)&&this._addAriaAndCollapsedClass([e],!1)}this._isTransitioning=!0,this._element.style[t]="",this._queueCallback((()=>{this._isTransitioning=!1,this._element.classList.remove(Ve),this._element.classList.add(qe),ge.trigger(this._element,"hidden.bs.collapse")}),this._element,!0)}_isShown(){return(arguments.length>0&&void 0!==arguments[0]?arguments[0]:this._element).classList.contains(We)}_configAfterMerge(t){return t.toggle=Boolean(t.toggle),t.parent=Ft(t.parent),t}_getDimension(){return this._element.classList.contains("collapse-horizontal")?"width":"height"}_initializeChildren(){if(!this._config.parent)return
const t=this._getFirstLevelChildren(Ke)
for(const e of t){const t=zt(e)
t&&this._addAriaAndCollapsedClass([e],this._isShown(t))}}_getFirstLevelChildren(t){const e=Oe.find(":scope .collapse .collapse",this._config.parent)
return Oe.find(t,this._config.parent).filter((t=>!e.includes(t)))}_addAriaAndCollapsedClass(t,e){if(t.length)for(const i of t)i.classList.toggle("collapsed",!e),i.setAttribute("aria-expanded",e)}static jQueryInterface(t){const e={}
return"string"==typeof t&&/show|hide/.test(t)&&(e.toggle=!1),this.each((function(){const i=Qe.getOrCreateInstance(this,e)
if("string"==typeof t){if(void 0===i[t])throw new TypeError(`No method named "${t}"`)
i[t]()}}))}}ge.on(document,"click.bs.collapse.data-api",Ke,(function(t){("A"===t.target.tagName||t.delegateTarget&&"A"===t.delegateTarget.tagName)&&t.preventDefault()
const e=Mt(this),i=Oe.find(e)
for(const n of i)Qe.getOrCreateInstance(n,{toggle:!1}).toggle()})),Ut(Qe)
const Ue="dropdown",Ge="ArrowUp",Je="ArrowDown",Ze="click.bs.dropdown.data-api",ti="keydown.bs.dropdown.data-api",ei="show",ii='[data-bs-toggle="dropdown"]:not(.disabled):not(:disabled)',ni=`${ii}.show`,si=".dropdown-menu",oi=Qt()?"top-end":"top-start",ri=Qt()?"top-start":"top-end",ai=Qt()?"bottom-end":"bottom-start",li=Qt()?"bottom-start":"bottom-end",ci=Qt()?"left-start":"right-start",hi=Qt()?"right-start":"left-start",ui={autoClose:!0,boundary:"clippingParents",display:"dynamic",offset:[0,2],popperConfig:null,reference:"toggle"},fi={autoClose:"(boolean|string)",boundary:"(string|element)",display:"string",offset:"(array|string|function)",popperConfig:"(null|object|function)",reference:"(string|element|object)"}
class di extends Ee{constructor(t,e){super(t,e),this._popper=null,this._parent=this._element.parentNode,this._menu=Oe.next(this._element,si)[0]||Oe.prev(this._element,si)[0]||Oe.findOne(si,this._parent),this._inNavbar=this._detectNavbar()}static get Default(){return ui}static get DefaultType(){return fi}static get NAME(){return Ue}toggle(){return this._isShown()?this.hide():this.show()}show(){if(Wt(this._element)||this._isShown())return
const t={relatedTarget:this._element}
if(!ge.trigger(this._element,"show.bs.dropdown",t).defaultPrevented){if(this._createPopper(),"ontouchstart"in document.documentElement&&!this._parent.closest(".navbar-nav"))for(const t of[].concat(...document.body.children))ge.on(t,"mouseover",Vt)
this._element.focus(),this._element.setAttribute("aria-expanded",!0),this._menu.classList.add(ei),this._element.classList.add(ei),ge.trigger(this._element,"shown.bs.dropdown",t)}}hide(){if(Wt(this._element)||!this._isShown())return
const t={relatedTarget:this._element}
this._completeHide(t)}dispose(){this._popper&&this._popper.destroy(),super.dispose()}update(){this._inNavbar=this._detectNavbar(),this._popper&&this._popper.update()}_completeHide(t){if(!ge.trigger(this._element,"hide.bs.dropdown",t).defaultPrevented){if("ontouchstart"in document.documentElement)for(const t of[].concat(...document.body.children))ge.off(t,"mouseover",Vt)
this._popper&&this._popper.destroy(),this._menu.classList.remove(ei),this._element.classList.remove(ei),this._element.setAttribute("aria-expanded","false"),we.removeDataAttribute(this._menu,"popper"),ge.trigger(this._element,"hidden.bs.dropdown",t)}}_getConfig(t){if("object"==typeof(t=super._getConfig(t)).reference&&!Rt(t.reference)&&"function"!=typeof t.reference.getBoundingClientRect)throw new TypeError(`${Ue.toUpperCase()}: Option "reference" provided type "object" without a required "getBoundingClientRect" method.`)
return t}_createPopper(){if(void 0===n)throw new TypeError("Bootstrap's dropdowns require Popper (https://popper.js.org)")
let t=this._element
"parent"===this._config.reference?t=this._parent:Rt(this._config.reference)?t=Ft(this._config.reference):"object"==typeof this._config.reference&&(t=this._config.reference)
const e=this._getPopperConfig()
this._popper=It(t,this._menu,e)}_isShown(){return this._menu.classList.contains(ei)}_getPlacement(){const t=this._parent
if(t.classList.contains("dropend"))return ci
if(t.classList.contains("dropstart"))return hi
if(t.classList.contains("dropup-center"))return"top"
if(t.classList.contains("dropdown-center"))return"bottom"
const e="end"===getComputedStyle(this._menu).getPropertyValue("--bs-position").trim()
return t.classList.contains("dropup")?e?ri:oi:e?li:ai}_detectNavbar(){return null!==this._element.closest(".navbar")}_getOffset(){const{offset:t}=this._config
return"string"==typeof t?t.split(",").map((t=>Number.parseInt(t,10))):"function"==typeof t?e=>t(e,this._element):t}_getPopperConfig(){const t={placement:this._getPlacement(),modifiers:[{name:"preventOverflow",options:{boundary:this._config.boundary}},{name:"offset",options:{offset:this._getOffset()}}]}
return(this._inNavbar||"static"===this._config.display)&&(we.setDataAttribute(this._menu,"popper","static"),t.modifiers=[{name:"applyStyles",enabled:!1}]),{...t,..."function"==typeof this._config.popperConfig?this._config.popperConfig(t):this._config.popperConfig}}_selectMenuItem(t){let{key:e,target:i}=t
const n=Oe.find(".dropdown-menu .dropdown-item:not(.disabled):not(:disabled)",this._menu).filter((t=>$t(t)))
n.length&&Zt(n,i,e===Je,!n.includes(i)).focus()}static jQueryInterface(t){return this.each((function(){const e=di.getOrCreateInstance(this,t)
if("string"==typeof t){if(void 0===e[t])throw new TypeError(`No method named "${t}"`)
e[t]()}}))}static clearMenus(t){if(2===t.button||"keyup"===t.type&&"Tab"!==t.key)return
const e=Oe.find(ni)
for(const i of e){const e=di.getInstance(i)
if(!e||!1===e._config.autoClose)continue
const n=t.composedPath(),s=n.includes(e._menu)
if(n.includes(e._element)||"inside"===e._config.autoClose&&!s||"outside"===e._config.autoClose&&s)continue
if(e._menu.contains(t.target)&&("keyup"===t.type&&"Tab"===t.key||/input|select|option|textarea|form/i.test(t.target.tagName)))continue
const o={relatedTarget:e._element}
"click"===t.type&&(o.clickEvent=t),e._completeHide(o)}}static dataApiKeydownHandler(t){const e=/input|textarea/i.test(t.target.tagName),i="Escape"===t.key,n=[Ge,Je].includes(t.key)
if(!n&&!i)return
if(e&&!i)return
t.preventDefault()
const s=this.matches(ii)?this:Oe.prev(this,ii)[0]||Oe.next(this,ii)[0]||Oe.findOne(ii,t.delegateTarget.parentNode),o=di.getOrCreateInstance(s)
if(n)return t.stopPropagation(),o.show(),void o._selectMenuItem(t)
o._isShown()&&(t.stopPropagation(),o.hide(),s.focus())}}ge.on(document,ti,ii,di.dataApiKeydownHandler),ge.on(document,ti,si,di.dataApiKeydownHandler),ge.on(document,Ze,di.clearMenus),ge.on(document,"keyup.bs.dropdown.data-api",di.clearMenus),ge.on(document,Ze,ii,(function(t){t.preventDefault(),di.getOrCreateInstance(this).toggle()})),Ut(di)
const pi=".fixed-top, .fixed-bottom, .is-fixed, .sticky-top",gi=".sticky-top",mi="padding-right",_i="margin-right"
class bi{constructor(){this._element=document.body}getWidth(){const t=document.documentElement.clientWidth
return Math.abs(window.innerWidth-t)}hide(){const t=this.getWidth()
this._disableOverFlow(),this._setElementAttributes(this._element,mi,(e=>e+t)),this._setElementAttributes(pi,mi,(e=>e+t)),this._setElementAttributes(gi,_i,(e=>e-t))}reset(){this._resetElementAttributes(this._element,"overflow"),this._resetElementAttributes(this._element,mi),this._resetElementAttributes(pi,mi),this._resetElementAttributes(gi,_i)}isOverflowing(){return this.getWidth()>0}_disableOverFlow(){this._saveInitialAttribute(this._element,"overflow"),this._element.style.overflow="hidden"}_setElementAttributes(t,e,i){const n=this.getWidth()
this._applyManipulationCallback(t,(t=>{if(t!==this._element&&window.innerWidth>t.clientWidth+n)return
this._saveInitialAttribute(t,e)
const s=window.getComputedStyle(t).getPropertyValue(e)
t.style.setProperty(e,`${i(Number.parseFloat(s))}px`)}))}_saveInitialAttribute(t,e){const i=t.style.getPropertyValue(e)
i&&we.setDataAttribute(t,e,i)}_resetElementAttributes(t,e){this._applyManipulationCallback(t,(t=>{const i=we.getDataAttribute(t,e)
null!==i?(we.removeDataAttribute(t,e),t.style.setProperty(e,i)):t.style.removeProperty(e)}))}_applyManipulationCallback(t,e){if(Rt(t))e(t)
else for(const i of Oe.find(t,this._element))e(i)}}const vi="show",yi="mousedown.bs.backdrop",wi={className:"modal-backdrop",clickCallback:null,isAnimated:!1,isVisible:!0,rootElement:"body"},Ai={className:"string",clickCallback:"(function|null)",isAnimated:"boolean",isVisible:"boolean",rootElement:"(element|string)"}
class Ei extends Ae{constructor(t){super(),this._config=this._getConfig(t),this._isAppended=!1,this._element=null}static get Default(){return wi}static get DefaultType(){return Ai}static get NAME(){return"backdrop"}show(t){if(!this._config.isVisible)return void Gt(t)
this._append()
const e=this._getElement()
this._config.isAnimated&&Kt(e),e.classList.add(vi),this._emulateAnimation((()=>{Gt(t)}))}hide(t){this._config.isVisible?(this._getElement().classList.remove(vi),this._emulateAnimation((()=>{this.dispose(),Gt(t)}))):Gt(t)}dispose(){this._isAppended&&(ge.off(this._element,yi),this._element.remove(),this._isAppended=!1)}_getElement(){if(!this._element){const t=document.createElement("div")
t.className=this._config.className,this._config.isAnimated&&t.classList.add("fade"),this._element=t}return this._element}_configAfterMerge(t){return t.rootElement=Ft(t.rootElement),t}_append(){if(this._isAppended)return
const t=this._getElement()
this._config.rootElement.append(t),ge.on(t,yi,(()=>{Gt(this._config.clickCallback)})),this._isAppended=!0}_emulateAnimation(t){Jt(t,this._getElement(),this._config.isAnimated)}}const Ci=".bs.focustrap",Ti="backward",xi={autofocus:!0,trapElement:null},ki={autofocus:"boolean",trapElement:"element"}
class Oi extends Ae{constructor(t){super(),this._config=this._getConfig(t),this._isActive=!1,this._lastTabNavDirection=null}static get Default(){return xi}static get DefaultType(){return ki}static get NAME(){return"focustrap"}activate(){this._isActive||(this._config.autofocus&&this._config.trapElement.focus(),ge.off(document,Ci),ge.on(document,"focusin.bs.focustrap",(t=>this._handleFocusin(t))),ge.on(document,"keydown.tab.bs.focustrap",(t=>this._handleKeydown(t))),this._isActive=!0)}deactivate(){this._isActive&&(this._isActive=!1,ge.off(document,Ci))}_handleFocusin(t){const{trapElement:e}=this._config
if(t.target===document||t.target===e||e.contains(t.target))return
const i=Oe.focusableChildren(e)
0===i.length?e.focus():this._lastTabNavDirection===Ti?i[i.length-1].focus():i[0].focus()}_handleKeydown(t){"Tab"===t.key&&(this._lastTabNavDirection=t.shiftKey?Ti:"forward")}}const Si="hidden.bs.modal",Li="show.bs.modal",Di="modal-open",Ii="show",Ni="modal-static",Pi={backdrop:!0,focus:!0,keyboard:!0},ji={backdrop:"(boolean|string)",focus:"boolean",keyboard:"boolean"}
class Mi extends Ee{constructor(t,e){super(t,e),this._dialog=Oe.findOne(".modal-dialog",this._element),this._backdrop=this._initializeBackDrop(),this._focustrap=this._initializeFocusTrap(),this._isShown=!1,this._isTransitioning=!1,this._scrollBar=new bi,this._addEventListeners()}static get Default(){return Pi}static get DefaultType(){return ji}static get NAME(){return"modal"}toggle(t){return this._isShown?this.hide():this.show(t)}show(t){this._isShown||this._isTransitioning||ge.trigger(this._element,Li,{relatedTarget:t}).defaultPrevented||(this._isShown=!0,this._isTransitioning=!0,this._scrollBar.hide(),document.body.classList.add(Di),this._adjustDialog(),this._backdrop.show((()=>this._showElement(t))))}hide(){this._isShown&&!this._isTransitioning&&(ge.trigger(this._element,"hide.bs.modal").defaultPrevented||(this._isShown=!1,this._isTransitioning=!0,this._focustrap.deactivate(),this._element.classList.remove(Ii),this._queueCallback((()=>this._hideModal()),this._element,this._isAnimated())))}dispose(){for(const t of[window,this._dialog])ge.off(t,".bs.modal")
this._backdrop.dispose(),this._focustrap.deactivate(),super.dispose()}handleUpdate(){this._adjustDialog()}_initializeBackDrop(){return new Ei({isVisible:Boolean(this._config.backdrop),isAnimated:this._isAnimated()})}_initializeFocusTrap(){return new Oi({trapElement:this._element})}_showElement(t){document.body.contains(this._element)||document.body.append(this._element),this._element.style.display="block",this._element.removeAttribute("aria-hidden"),this._element.setAttribute("aria-modal",!0),this._element.setAttribute("role","dialog"),this._element.scrollTop=0
const e=Oe.findOne(".modal-body",this._dialog)
e&&(e.scrollTop=0),Kt(this._element),this._element.classList.add(Ii),this._queueCallback((()=>{this._config.focus&&this._focustrap.activate(),this._isTransitioning=!1,ge.trigger(this._element,"shown.bs.modal",{relatedTarget:t})}),this._dialog,this._isAnimated())}_addEventListeners(){ge.on(this._element,"keydown.dismiss.bs.modal",(t=>{if("Escape"===t.key)return this._config.keyboard?(t.preventDefault(),void this.hide()):void this._triggerBackdropTransition()})),ge.on(window,"resize.bs.modal",(()=>{this._isShown&&!this._isTransitioning&&this._adjustDialog()})),ge.on(this._element,"mousedown.dismiss.bs.modal",(t=>{ge.one(this._element,"click.dismiss.bs.modal",(e=>{this._element===t.target&&this._element===e.target&&("static"!==this._config.backdrop?this._config.backdrop&&this.hide():this._triggerBackdropTransition())}))}))}_hideModal(){this._element.style.display="none",this._element.setAttribute("aria-hidden",!0),this._element.removeAttribute("aria-modal"),this._element.removeAttribute("role"),this._isTransitioning=!1,this._backdrop.hide((()=>{document.body.classList.remove(Di),this._resetAdjustments(),this._scrollBar.reset(),ge.trigger(this._element,Si)}))}_isAnimated(){return this._element.classList.contains("fade")}_triggerBackdropTransition(){if(ge.trigger(this._element,"hidePrevented.bs.modal").defaultPrevented)return
const t=this._element.scrollHeight>document.documentElement.clientHeight,e=this._element.style.overflowY
"hidden"===e||this._element.classList.contains(Ni)||(t||(this._element.style.overflowY="hidden"),this._element.classList.add(Ni),this._queueCallback((()=>{this._element.classList.remove(Ni),this._queueCallback((()=>{this._element.style.overflowY=e}),this._dialog)}),this._dialog),this._element.focus())}_adjustDialog(){const t=this._element.scrollHeight>document.documentElement.clientHeight,e=this._scrollBar.getWidth(),i=e>0
if(i&&!t){const t=Qt()?"paddingLeft":"paddingRight"
this._element.style[t]=`${e}px`}if(!i&&t){const t=Qt()?"paddingRight":"paddingLeft"
this._element.style[t]=`${e}px`}}_resetAdjustments(){this._element.style.paddingLeft="",this._element.style.paddingRight=""}static jQueryInterface(t,e){return this.each((function(){const i=Mi.getOrCreateInstance(this,t)
if("string"==typeof t){if(void 0===i[t])throw new TypeError(`No method named "${t}"`)
i[t](e)}}))}}ge.on(document,"click.bs.modal.data-api",'[data-bs-toggle="modal"]',(function(t){const e=zt(this);["A","AREA"].includes(this.tagName)&&t.preventDefault(),ge.one(e,Li,(t=>{t.defaultPrevented||ge.one(e,Si,(()=>{$t(this)&&this.focus()}))}))
const i=Oe.findOne(".modal.show")
i&&Mi.getInstance(i).hide(),Mi.getOrCreateInstance(e).toggle(this)})),Ce(Mi),Ut(Mi)
const zi="show",Hi="showing",Bi="hiding",Ri=".offcanvas.show",Fi="hidePrevented.bs.offcanvas",$i="hidden.bs.offcanvas",Wi={backdrop:!0,keyboard:!0,scroll:!1},qi={backdrop:"(boolean|string)",keyboard:"boolean",scroll:"boolean"}
class Vi extends Ee{constructor(t,e){super(t,e),this._isShown=!1,this._backdrop=this._initializeBackDrop(),this._focustrap=this._initializeFocusTrap(),this._addEventListeners()}static get Default(){return Wi}static get DefaultType(){return qi}static get NAME(){return"offcanvas"}toggle(t){return this._isShown?this.hide():this.show(t)}show(t){this._isShown||ge.trigger(this._element,"show.bs.offcanvas",{relatedTarget:t}).defaultPrevented||(this._isShown=!0,this._backdrop.show(),this._config.scroll||(new bi).hide(),this._element.setAttribute("aria-modal",!0),this._element.setAttribute("role","dialog"),this._element.classList.add(Hi),this._queueCallback((()=>{this._config.scroll&&!this._config.backdrop||this._focustrap.activate(),this._element.classList.add(zi),this._element.classList.remove(Hi),ge.trigger(this._element,"shown.bs.offcanvas",{relatedTarget:t})}),this._element,!0))}hide(){this._isShown&&(ge.trigger(this._element,"hide.bs.offcanvas").defaultPrevented||(this._focustrap.deactivate(),this._element.blur(),this._isShown=!1,this._element.classList.add(Bi),this._backdrop.hide(),this._queueCallback((()=>{this._element.classList.remove(zi,Bi),this._element.removeAttribute("aria-modal"),this._element.removeAttribute("role"),this._config.scroll||(new bi).reset(),ge.trigger(this._element,$i)}),this._element,!0)))}dispose(){this._backdrop.dispose(),this._focustrap.deactivate(),super.dispose()}_initializeBackDrop(){const t=Boolean(this._config.backdrop)
return new Ei({className:"offcanvas-backdrop",isVisible:t,isAnimated:!0,rootElement:this._element.parentNode,clickCallback:t?()=>{"static"!==this._config.backdrop?this.hide():ge.trigger(this._element,Fi)}:null})}_initializeFocusTrap(){return new Oi({trapElement:this._element})}_addEventListeners(){ge.on(this._element,"keydown.dismiss.bs.offcanvas",(t=>{"Escape"===t.key&&(this._config.keyboard?this.hide():ge.trigger(this._element,Fi))}))}static jQueryInterface(t){return this.each((function(){const e=Vi.getOrCreateInstance(this,t)
if("string"==typeof t){if(void 0===e[t]||t.startsWith("_")||"constructor"===t)throw new TypeError(`No method named "${t}"`)
e[t](this)}}))}}ge.on(document,"click.bs.offcanvas.data-api",'[data-bs-toggle="offcanvas"]',(function(t){const e=zt(this)
if(["A","AREA"].includes(this.tagName)&&t.preventDefault(),Wt(this))return
ge.one(e,$i,(()=>{$t(this)&&this.focus()}))
const i=Oe.findOne(Ri)
i&&i!==e&&Vi.getInstance(i).hide(),Vi.getOrCreateInstance(e).toggle(this)})),ge.on(window,"load.bs.offcanvas.data-api",(()=>{for(const t of Oe.find(Ri))Vi.getOrCreateInstance(t).show()})),ge.on(window,"resize.bs.offcanvas",(()=>{for(const t of Oe.find("[aria-modal][class*=show][class*=offcanvas-]"))"fixed"!==getComputedStyle(t).position&&Vi.getOrCreateInstance(t).hide()})),Ce(Vi),Ut(Vi)
const Ki=new Set(["background","cite","href","itemtype","longdesc","poster","src","xlink:href"]),Yi=/^(?:(?:https?|mailto|ftp|tel|file|sms):|[^#&/:?]*(?:[#/?]|$))/i,Xi=/^data:(?:image\/(?:bmp|gif|jpeg|jpg|png|tiff|webp)|video\/(?:mpeg|mp4|ogg|webm)|audio\/(?:mp3|oga|ogg|opus));base64,[\d+/a-z]+=*$/i,Qi=(t,e)=>{const i=t.nodeName.toLowerCase()
return e.includes(i)?!Ki.has(i)||Boolean(Yi.test(t.nodeValue)||Xi.test(t.nodeValue)):e.filter((t=>t instanceof RegExp)).some((t=>t.test(i)))},Ui={"*":["class","dir","id","lang","role",/^aria-[\w-]*$/i],a:["target","href","title","rel"],area:[],b:[],br:[],col:[],code:[],div:[],em:[],hr:[],h1:[],h2:[],h3:[],h4:[],h5:[],h6:[],i:[],img:["src","srcset","alt","title","width","height"],li:[],ol:[],p:[],pre:[],s:[],small:[],span:[],sub:[],sup:[],strong:[],u:[],ul:[]},Gi={allowList:Ui,content:{},extraClass:"",html:!1,sanitize:!0,sanitizeFn:null,template:"<div></div>"},Ji={allowList:"object",content:"object",extraClass:"(string|function)",html:"boolean",sanitize:"boolean",sanitizeFn:"(null|function)",template:"string"},Zi={entry:"(string|element|function|null)",selector:"(string|element)"}
class tn extends Ae{constructor(t){super(),this._config=this._getConfig(t)}static get Default(){return Gi}static get DefaultType(){return Ji}static get NAME(){return"TemplateFactory"}getContent(){return Object.values(this._config.content).map((t=>this._resolvePossibleFunction(t))).filter(Boolean)}hasContent(){return this.getContent().length>0}changeContent(t){return this._checkContent(t),this._config.content={...this._config.content,...t},this}toHtml(){const t=document.createElement("div")
t.innerHTML=this._maybeSanitize(this._config.template)
for(const[n,s]of Object.entries(this._config.content))this._setContent(t,s,n)
const e=t.children[0],i=this._resolvePossibleFunction(this._config.extraClass)
return i&&e.classList.add(...i.split(" ")),e}_typeCheckConfig(t){super._typeCheckConfig(t),this._checkContent(t.content)}_checkContent(t){for(const[e,i]of Object.entries(t))super._typeCheckConfig({selector:e,entry:i},Zi)}_setContent(t,e,i){const n=Oe.findOne(i,t)
n&&((e=this._resolvePossibleFunction(e))?Rt(e)?this._putElementInTemplate(Ft(e),n):this._config.html?n.innerHTML=this._maybeSanitize(e):n.textContent=e:n.remove())}_maybeSanitize(t){return this._config.sanitize?function(t,e,i){if(!t.length)return t
if(i&&"function"==typeof i)return i(t)
const n=(new window.DOMParser).parseFromString(t,"text/html"),s=[].concat(...n.body.querySelectorAll("*"))
for(const o of s){const t=o.nodeName.toLowerCase()
if(!Object.keys(e).includes(t)){o.remove()
continue}const i=[].concat(...o.attributes),n=[].concat(e["*"]||[],e[t]||[])
for(const e of i)Qi(e,n)||o.removeAttribute(e.nodeName)}return n.body.innerHTML}(t,this._config.allowList,this._config.sanitizeFn):t}_resolvePossibleFunction(t){return"function"==typeof t?t(this):t}_putElementInTemplate(t,e){if(this._config.html)return e.innerHTML="",void e.append(t)
e.textContent=t.textContent}}const en=new Set(["sanitize","allowList","sanitizeFn"]),nn="fade",sn="show",on=".modal",rn="hide.bs.modal",an="hover",ln="focus",cn={AUTO:"auto",TOP:"top",RIGHT:Qt()?"left":"right",BOTTOM:"bottom",LEFT:Qt()?"right":"left"},hn={allowList:Ui,animation:!0,boundary:"clippingParents",container:!1,customClass:"",delay:0,fallbackPlacements:["top","right","bottom","left"],html:!1,offset:[0,0],placement:"top",popperConfig:null,sanitize:!0,sanitizeFn:null,selector:!1,template:'<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',title:"",trigger:"hover focus"},un={allowList:"object",animation:"boolean",boundary:"(string|element)",container:"(string|element|boolean)",customClass:"(string|function)",delay:"(number|object)",fallbackPlacements:"array",html:"boolean",offset:"(array|string|function)",placement:"(string|function)",popperConfig:"(null|object|function)",sanitize:"boolean",sanitizeFn:"(null|function)",selector:"(string|boolean)",template:"string",title:"(string|element|function)",trigger:"string"}
class fn extends Ee{constructor(t,e){if(void 0===n)throw new TypeError("Bootstrap's tooltips require Popper (https://popper.js.org)")
super(t,e),this._isEnabled=!0,this._timeout=0,this._isHovered=null,this._activeTrigger={},this._popper=null,this._templateFactory=null,this._newContent=null,this.tip=null,this._setListeners(),this._config.selector||this._fixTitle()}static get Default(){return hn}static get DefaultType(){return un}static get NAME(){return"tooltip"}enable(){this._isEnabled=!0}disable(){this._isEnabled=!1}toggleEnabled(){this._isEnabled=!this._isEnabled}toggle(){this._isEnabled&&(this._activeTrigger.click=!this._activeTrigger.click,this._isShown()?this._leave():this._enter())}dispose(){clearTimeout(this._timeout),ge.off(this._element.closest(on),rn,this._hideModalHandler),this._element.getAttribute("data-bs-original-title")&&this._element.setAttribute("title",this._element.getAttribute("data-bs-original-title")),this._disposePopper(),super.dispose()}show(){if("none"===this._element.style.display)throw new Error("Please use show on visible elements")
if(!this._isWithContent()||!this._isEnabled)return
const t=ge.trigger(this._element,this.constructor.eventName("show")),e=(qt(this._element)||this._element.ownerDocument.documentElement).contains(this._element)
if(t.defaultPrevented||!e)return
this._disposePopper()
const i=this._getTipElement()
this._element.setAttribute("aria-describedby",i.getAttribute("id"))
const{container:n}=this._config
if(this._element.ownerDocument.documentElement.contains(this.tip)||(n.append(i),ge.trigger(this._element,this.constructor.eventName("inserted"))),this._popper=this._createPopper(i),i.classList.add(sn),"ontouchstart"in document.documentElement)for(const s of[].concat(...document.body.children))ge.on(s,"mouseover",Vt)
this._queueCallback((()=>{ge.trigger(this._element,this.constructor.eventName("shown")),!1===this._isHovered&&this._leave(),this._isHovered=!1}),this.tip,this._isAnimated())}hide(){if(this._isShown()&&!ge.trigger(this._element,this.constructor.eventName("hide")).defaultPrevented){if(this._getTipElement().classList.remove(sn),"ontouchstart"in document.documentElement)for(const t of[].concat(...document.body.children))ge.off(t,"mouseover",Vt)
this._activeTrigger.click=!1,this._activeTrigger.focus=!1,this._activeTrigger.hover=!1,this._isHovered=null,this._queueCallback((()=>{this._isWithActiveTrigger()||(this._isHovered||this._disposePopper(),this._element.removeAttribute("aria-describedby"),ge.trigger(this._element,this.constructor.eventName("hidden")))}),this.tip,this._isAnimated())}}update(){this._popper&&this._popper.update()}_isWithContent(){return Boolean(this._getTitle())}_getTipElement(){return this.tip||(this.tip=this._createTipElement(this._newContent||this._getContentForTemplate())),this.tip}_createTipElement(t){const e=this._getTemplateFactory(t).toHtml()
if(!e)return null
e.classList.remove(nn,sn),e.classList.add(`bs-${this.constructor.NAME}-auto`)
const i=(t=>{do{t+=Math.floor(1e6*Math.random())}while(document.getElementById(t))
return t})(this.constructor.NAME).toString()
return e.setAttribute("id",i),this._isAnimated()&&e.classList.add(nn),e}setContent(t){this._newContent=t,this._isShown()&&(this._disposePopper(),this.show())}_getTemplateFactory(t){return this._templateFactory?this._templateFactory.changeContent(t):this._templateFactory=new tn({...this._config,content:t,extraClass:this._resolvePossibleFunction(this._config.customClass)}),this._templateFactory}_getContentForTemplate(){return{".tooltip-inner":this._getTitle()}}_getTitle(){return this._resolvePossibleFunction(this._config.title)||this._element.getAttribute("data-bs-original-title")}_initializeOnDelegatedTarget(t){return this.constructor.getOrCreateInstance(t.delegateTarget,this._getDelegateConfig())}_isAnimated(){return this._config.animation||this.tip&&this.tip.classList.contains(nn)}_isShown(){return this.tip&&this.tip.classList.contains(sn)}_createPopper(t){const e="function"==typeof this._config.placement?this._config.placement.call(this,t,this._element):this._config.placement,i=cn[e.toUpperCase()]
return It(this._element,t,this._getPopperConfig(i))}_getOffset(){const{offset:t}=this._config
return"string"==typeof t?t.split(",").map((t=>Number.parseInt(t,10))):"function"==typeof t?e=>t(e,this._element):t}_resolvePossibleFunction(t){return"function"==typeof t?t.call(this._element):t}_getPopperConfig(t){const e={placement:t,modifiers:[{name:"flip",options:{fallbackPlacements:this._config.fallbackPlacements}},{name:"offset",options:{offset:this._getOffset()}},{name:"preventOverflow",options:{boundary:this._config.boundary}},{name:"arrow",options:{element:`.${this.constructor.NAME}-arrow`}},{name:"preSetPlacement",enabled:!0,phase:"beforeMain",fn:t=>{this._getTipElement().setAttribute("data-popper-placement",t.state.placement)}}]}
return{...e,..."function"==typeof this._config.popperConfig?this._config.popperConfig(e):this._config.popperConfig}}_setListeners(){const t=this._config.trigger.split(" ")
for(const e of t)if("click"===e)ge.on(this._element,this.constructor.eventName("click"),this._config.selector,(t=>{this._initializeOnDelegatedTarget(t).toggle()}))
else if("manual"!==e){const t=e===an?this.constructor.eventName("mouseenter"):this.constructor.eventName("focusin"),i=e===an?this.constructor.eventName("mouseleave"):this.constructor.eventName("focusout")
ge.on(this._element,t,this._config.selector,(t=>{const e=this._initializeOnDelegatedTarget(t)
e._activeTrigger["focusin"===t.type?ln:an]=!0,e._enter()})),ge.on(this._element,i,this._config.selector,(t=>{const e=this._initializeOnDelegatedTarget(t)
e._activeTrigger["focusout"===t.type?ln:an]=e._element.contains(t.relatedTarget),e._leave()}))}this._hideModalHandler=()=>{this._element&&this.hide()},ge.on(this._element.closest(on),rn,this._hideModalHandler)}_fixTitle(){const t=this._element.getAttribute("title")
t&&(this._element.getAttribute("aria-label")||this._element.textContent.trim()||this._element.setAttribute("aria-label",t),this._element.setAttribute("data-bs-original-title",t),this._element.removeAttribute("title"))}_enter(){this._isShown()||this._isHovered?this._isHovered=!0:(this._isHovered=!0,this._setTimeout((()=>{this._isHovered&&this.show()}),this._config.delay.show))}_leave(){this._isWithActiveTrigger()||(this._isHovered=!1,this._setTimeout((()=>{this._isHovered||this.hide()}),this._config.delay.hide))}_setTimeout(t,e){clearTimeout(this._timeout),this._timeout=setTimeout(t,e)}_isWithActiveTrigger(){return Object.values(this._activeTrigger).includes(!0)}_getConfig(t){const e=we.getDataAttributes(this._element)
for(const i of Object.keys(e))en.has(i)&&delete e[i]
return t={...e,..."object"==typeof t&&t?t:{}},t=this._mergeConfigObj(t),t=this._configAfterMerge(t),this._typeCheckConfig(t),t}_configAfterMerge(t){return t.container=!1===t.container?document.body:Ft(t.container),"number"==typeof t.delay&&(t.delay={show:t.delay,hide:t.delay}),"number"==typeof t.title&&(t.title=t.title.toString()),"number"==typeof t.content&&(t.content=t.content.toString()),t}_getDelegateConfig(){const t={}
for(const e in this._config)this.constructor.Default[e]!==this._config[e]&&(t[e]=this._config[e])
return t.selector=!1,t.trigger="manual",t}_disposePopper(){this._popper&&(this._popper.destroy(),this._popper=null),this.tip&&(this.tip.remove(),this.tip=null)}static jQueryInterface(t){return this.each((function(){const e=fn.getOrCreateInstance(this,t)
if("string"==typeof t){if(void 0===e[t])throw new TypeError(`No method named "${t}"`)
e[t]()}}))}}Ut(fn)
const dn={...fn.Default,content:"",offset:[0,8],placement:"right",template:'<div class="popover" role="tooltip"><div class="popover-arrow"></div><h3 class="popover-header"></h3><div class="popover-body"></div></div>',trigger:"click"},pn={...fn.DefaultType,content:"(null|string|element|function)"}
class gn extends fn{static get Default(){return dn}static get DefaultType(){return pn}static get NAME(){return"popover"}_isWithContent(){return this._getTitle()||this._getContent()}_getContentForTemplate(){return{".popover-header":this._getTitle(),".popover-body":this._getContent()}}_getContent(){return this._resolvePossibleFunction(this._config.content)}static jQueryInterface(t){return this.each((function(){const e=gn.getOrCreateInstance(this,t)
if("string"==typeof t){if(void 0===e[t])throw new TypeError(`No method named "${t}"`)
e[t]()}}))}}Ut(gn)
const mn="click.bs.scrollspy",_n="active",bn="[href]",vn={offset:null,rootMargin:"0px 0px -25%",smoothScroll:!1,target:null,threshold:[.1,.5,1]},yn={offset:"(number|null)",rootMargin:"string",smoothScroll:"boolean",target:"element",threshold:"array"}
class wn extends Ee{constructor(t,e){super(t,e),this._targetLinks=new Map,this._observableSections=new Map,this._rootElement="visible"===getComputedStyle(this._element).overflowY?null:this._element,this._activeTarget=null,this._observer=null,this._previousScrollData={visibleEntryTop:0,parentScrollTop:0},this.refresh()}static get Default(){return vn}static get DefaultType(){return yn}static get NAME(){return"scrollspy"}refresh(){this._initializeTargetsAndObservables(),this._maybeEnableSmoothScroll(),this._observer?this._observer.disconnect():this._observer=this._getNewObserver()
for(const t of this._observableSections.values())this._observer.observe(t)}dispose(){this._observer.disconnect(),super.dispose()}_configAfterMerge(t){return t.target=Ft(t.target)||document.body,t.rootMargin=t.offset?`${t.offset}px 0px -30%`:t.rootMargin,"string"==typeof t.threshold&&(t.threshold=t.threshold.split(",").map((t=>Number.parseFloat(t)))),t}_maybeEnableSmoothScroll(){this._config.smoothScroll&&(ge.off(this._config.target,mn),ge.on(this._config.target,mn,bn,(t=>{const e=this._observableSections.get(t.target.hash)
if(e){t.preventDefault()
const i=this._rootElement||window,n=e.offsetTop-this._element.offsetTop
if(i.scrollTo)return void i.scrollTo({top:n,behavior:"smooth"})
i.scrollTop=n}})))}_getNewObserver(){const t={root:this._rootElement,threshold:this._config.threshold,rootMargin:this._config.rootMargin}
return new IntersectionObserver((t=>this._observerCallback(t)),t)}_observerCallback(t){const e=t=>this._targetLinks.get(`#${t.target.id}`),i=t=>{this._previousScrollData.visibleEntryTop=t.target.offsetTop,this._process(e(t))},n=(this._rootElement||document.documentElement).scrollTop,s=n>=this._previousScrollData.parentScrollTop
this._previousScrollData.parentScrollTop=n
for(const o of t){if(!o.isIntersecting){this._activeTarget=null,this._clearActiveClass(e(o))
continue}const t=o.target.offsetTop>=this._previousScrollData.visibleEntryTop
if(s&&t){if(i(o),!n)return}else s||t||i(o)}}_initializeTargetsAndObservables(){this._targetLinks=new Map,this._observableSections=new Map
const t=Oe.find(bn,this._config.target)
for(const e of t){if(!e.hash||Wt(e))continue
const t=Oe.findOne(e.hash,this._element)
$t(t)&&(this._targetLinks.set(e.hash,e),this._observableSections.set(e.hash,t))}}_process(t){this._activeTarget!==t&&(this._clearActiveClass(this._config.target),this._activeTarget=t,t.classList.add(_n),this._activateParents(t),ge.trigger(this._element,"activate.bs.scrollspy",{relatedTarget:t}))}_activateParents(t){if(t.classList.contains("dropdown-item"))Oe.findOne(".dropdown-toggle",t.closest(".dropdown")).classList.add(_n)
else for(const e of Oe.parents(t,".nav, .list-group"))for(const t of Oe.prev(e,".nav-link, .nav-item > .nav-link, .list-group-item"))t.classList.add(_n)}_clearActiveClass(t){t.classList.remove(_n)
const e=Oe.find("[href].active",t)
for(const i of e)i.classList.remove(_n)}static jQueryInterface(t){return this.each((function(){const e=wn.getOrCreateInstance(this,t)
if("string"==typeof t){if(void 0===e[t]||t.startsWith("_")||"constructor"===t)throw new TypeError(`No method named "${t}"`)
e[t]()}}))}}ge.on(window,"load.bs.scrollspy.data-api",(()=>{for(const t of Oe.find('[data-bs-spy="scroll"]'))wn.getOrCreateInstance(t)})),Ut(wn)
const An="ArrowLeft",En="ArrowRight",Cn="ArrowUp",Tn="ArrowDown",xn="active",kn="fade",On="show",Sn='[data-bs-toggle="tab"], [data-bs-toggle="pill"], [data-bs-toggle="list"]',Ln=`.nav-link:not(.dropdown-toggle), .list-group-item:not(.dropdown-toggle), [role="tab"]:not(.dropdown-toggle), ${Sn}`
class Dn extends Ee{constructor(t){super(t),this._parent=this._element.closest('.list-group, .nav, [role="tablist"]'),this._parent&&(this._setInitialAttributes(this._parent,this._getChildren()),ge.on(this._element,"keydown.bs.tab",(t=>this._keydown(t))))}static get NAME(){return"tab"}show(){const t=this._element
if(this._elemIsActive(t))return
const e=this._getActiveElem(),i=e?ge.trigger(e,"hide.bs.tab",{relatedTarget:t}):null
ge.trigger(t,"show.bs.tab",{relatedTarget:e}).defaultPrevented||i&&i.defaultPrevented||(this._deactivate(e,t),this._activate(t,e))}_activate(t,e){t&&(t.classList.add(xn),this._activate(zt(t)),this._queueCallback((()=>{"tab"===t.getAttribute("role")?(t.removeAttribute("tabindex"),t.setAttribute("aria-selected",!0),this._toggleDropDown(t,!0),ge.trigger(t,"shown.bs.tab",{relatedTarget:e})):t.classList.add(On)}),t,t.classList.contains(kn)))}_deactivate(t,e){t&&(t.classList.remove(xn),t.blur(),this._deactivate(zt(t)),this._queueCallback((()=>{"tab"===t.getAttribute("role")?(t.setAttribute("aria-selected",!1),t.setAttribute("tabindex","-1"),this._toggleDropDown(t,!1),ge.trigger(t,"hidden.bs.tab",{relatedTarget:e})):t.classList.remove(On)}),t,t.classList.contains(kn)))}_keydown(t){if(![An,En,Cn,Tn].includes(t.key))return
t.stopPropagation(),t.preventDefault()
const e=[En,Tn].includes(t.key),i=Zt(this._getChildren().filter((t=>!Wt(t))),t.target,e,!0)
i&&(i.focus({preventScroll:!0}),Dn.getOrCreateInstance(i).show())}_getChildren(){return Oe.find(Ln,this._parent)}_getActiveElem(){return this._getChildren().find((t=>this._elemIsActive(t)))||null}_setInitialAttributes(t,e){this._setAttributeIfNotExists(t,"role","tablist")
for(const i of e)this._setInitialAttributesOnChild(i)}_setInitialAttributesOnChild(t){t=this._getInnerElement(t)
const e=this._elemIsActive(t),i=this._getOuterElement(t)
t.setAttribute("aria-selected",e),i!==t&&this._setAttributeIfNotExists(i,"role","presentation"),e||t.setAttribute("tabindex","-1"),this._setAttributeIfNotExists(t,"role","tab"),this._setInitialAttributesOnTargetPanel(t)}_setInitialAttributesOnTargetPanel(t){const e=zt(t)
e&&(this._setAttributeIfNotExists(e,"role","tabpanel"),t.id&&this._setAttributeIfNotExists(e,"aria-labelledby",`#${t.id}`))}_toggleDropDown(t,e){const i=this._getOuterElement(t)
if(!i.classList.contains("dropdown"))return
const n=(t,n)=>{const s=Oe.findOne(t,i)
s&&s.classList.toggle(n,e)}
n(".dropdown-toggle",xn),n(".dropdown-menu",On),i.setAttribute("aria-expanded",e)}_setAttributeIfNotExists(t,e,i){t.hasAttribute(e)||t.setAttribute(e,i)}_elemIsActive(t){return t.classList.contains(xn)}_getInnerElement(t){return t.matches(Ln)?t:Oe.findOne(Ln,t)}_getOuterElement(t){return t.closest(".nav-item, .list-group-item")||t}static jQueryInterface(t){return this.each((function(){const e=Dn.getOrCreateInstance(this)
if("string"==typeof t){if(void 0===e[t]||t.startsWith("_")||"constructor"===t)throw new TypeError(`No method named "${t}"`)
e[t]()}}))}}ge.on(document,"click.bs.tab",Sn,(function(t){["A","AREA"].includes(this.tagName)&&t.preventDefault(),Wt(this)||Dn.getOrCreateInstance(this).show()})),ge.on(window,"load.bs.tab",(()=>{for(const t of Oe.find('.active[data-bs-toggle="tab"], .active[data-bs-toggle="pill"], .active[data-bs-toggle="list"]'))Dn.getOrCreateInstance(t)})),Ut(Dn)
const In="hide",Nn="show",Pn="showing",jn={animation:"boolean",autohide:"boolean",delay:"number"},Mn={animation:!0,autohide:!0,delay:5e3}
class zn extends Ee{constructor(t,e){super(t,e),this._timeout=null,this._hasMouseInteraction=!1,this._hasKeyboardInteraction=!1,this._setListeners()}static get Default(){return Mn}static get DefaultType(){return jn}static get NAME(){return"toast"}show(){ge.trigger(this._element,"show.bs.toast").defaultPrevented||(this._clearTimeout(),this._config.animation&&this._element.classList.add("fade"),this._element.classList.remove(In),Kt(this._element),this._element.classList.add(Nn,Pn),this._queueCallback((()=>{this._element.classList.remove(Pn),ge.trigger(this._element,"shown.bs.toast"),this._maybeScheduleHide()}),this._element,this._config.animation))}hide(){this.isShown()&&(ge.trigger(this._element,"hide.bs.toast").defaultPrevented||(this._element.classList.add(Pn),this._queueCallback((()=>{this._element.classList.add(In),this._element.classList.remove(Pn,Nn),ge.trigger(this._element,"hidden.bs.toast")}),this._element,this._config.animation)))}dispose(){this._clearTimeout(),this.isShown()&&this._element.classList.remove(Nn),super.dispose()}isShown(){return this._element.classList.contains(Nn)}_maybeScheduleHide(){this._config.autohide&&(this._hasMouseInteraction||this._hasKeyboardInteraction||(this._timeout=setTimeout((()=>{this.hide()}),this._config.delay)))}_onInteraction(t,e){switch(t.type){case"mouseover":case"mouseout":this._hasMouseInteraction=e
break
case"focusin":case"focusout":this._hasKeyboardInteraction=e}if(e)return void this._clearTimeout()
const i=t.relatedTarget
this._element===i||this._element.contains(i)||this._maybeScheduleHide()}_setListeners(){ge.on(this._element,"mouseover.bs.toast",(t=>this._onInteraction(t,!0))),ge.on(this._element,"mouseout.bs.toast",(t=>this._onInteraction(t,!1))),ge.on(this._element,"focusin.bs.toast",(t=>this._onInteraction(t,!0))),ge.on(this._element,"focusout.bs.toast",(t=>this._onInteraction(t,!1)))}_clearTimeout(){clearTimeout(this._timeout),this._timeout=null}static jQueryInterface(t){return this.each((function(){const e=zn.getOrCreateInstance(this,t)
if("string"==typeof t){if(void 0===e[t])throw new TypeError(`No method named "${t}"`)
e[t](this)}}))}}Ce(zn),Ut(zn)},993:function(t){var e
e=function(){return function(){var t={686:function(t,e,i){"use strict"
i.d(e,{default:function(){return w}})
var n=i(279),s=i.n(n),o=i(370),r=i.n(o),a=i(817),l=i.n(a)
function c(t){try{return document.execCommand(t)}catch(t){return!1}}var h=function(t){var e=l()(t)
return c("cut"),e},u=function(t,e){var i=function(t){var e="rtl"===document.documentElement.getAttribute("dir"),i=document.createElement("textarea")
i.style.fontSize="12pt",i.style.border="0",i.style.padding="0",i.style.margin="0",i.style.position="absolute",i.style[e?"right":"left"]="-9999px"
var n=window.pageYOffset||document.documentElement.scrollTop
return i.style.top="".concat(n,"px"),i.setAttribute("readonly",""),i.value=t,i}(t)
e.container.appendChild(i)
var n=l()(i)
return c("copy"),i.remove(),n},f=function(t){var e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{container:document.body},i=""
return"string"==typeof t?i=u(t,e):t instanceof HTMLInputElement&&!["text","search","url","tel","password"].includes(null==t?void 0:t.type)?i=u(t.value,e):(i=l()(t),c("copy")),i}
function d(t){return d="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},d(t)}function p(t){return p="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},p(t)}function g(t,e){for(var i=0;i<e.length;i++){var n=e[i]
n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(t,n.key,n)}}function m(t,e){return m=Object.setPrototypeOf||function(t,e){return t.__proto__=e,t},m(t,e)}function _(t,e){return!e||"object"!==p(e)&&"function"!=typeof e?function(t){if(void 0===t)throw new ReferenceError("this hasn't been initialised - super() hasn't been called")
return t}(t):e}function b(t){return b=Object.setPrototypeOf?Object.getPrototypeOf:function(t){return t.__proto__||Object.getPrototypeOf(t)},b(t)}function v(t,e){var i="data-clipboard-".concat(t)
if(e.hasAttribute(i))return e.getAttribute(i)}var y=function(t){!function(t,e){if("function"!=typeof e&&null!==e)throw new TypeError("Super expression must either be null or a function")
t.prototype=Object.create(e&&e.prototype,{constructor:{value:t,writable:!0,configurable:!0}}),e&&m(t,e)}(l,t)
var e,i,n,s,o,a=(s=l,o=function(){if("undefined"==typeof Reflect||!Reflect.construct)return!1
if(Reflect.construct.sham)return!1
if("function"==typeof Proxy)return!0
try{return Date.prototype.toString.call(Reflect.construct(Date,[],(function(){}))),!0}catch(t){return!1}}(),function(){var t,e=b(s)
if(o){var i=b(this).constructor
t=Reflect.construct(e,arguments,i)}else t=e.apply(this,arguments)
return _(this,t)})
function l(t,e){var i
return function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,l),(i=a.call(this)).resolveOptions(e),i.listenClick(t),i}return e=l,i=[{key:"resolveOptions",value:function(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{}
this.action="function"==typeof t.action?t.action:this.defaultAction,this.target="function"==typeof t.target?t.target:this.defaultTarget,this.text="function"==typeof t.text?t.text:this.defaultText,this.container="object"===p(t.container)?t.container:document.body}},{key:"listenClick",value:function(t){var e=this
this.listener=r()(t,"click",(function(t){return e.onClick(t)}))}},{key:"onClick",value:function(t){var e=t.delegateTarget||t.currentTarget,i=this.action(e)||"copy",n=function(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{},e=t.action,i=void 0===e?"copy":e,n=t.container,s=t.target,o=t.text
if("copy"!==i&&"cut"!==i)throw new Error('Invalid "action" value, use either "copy" or "cut"')
if(void 0!==s){if(!s||"object"!==d(s)||1!==s.nodeType)throw new Error('Invalid "target" value, use a valid Element')
if("copy"===i&&s.hasAttribute("disabled"))throw new Error('Invalid "target" attribute. Please use "readonly" instead of "disabled" attribute')
if("cut"===i&&(s.hasAttribute("readonly")||s.hasAttribute("disabled")))throw new Error('Invalid "target" attribute. You can\'t cut text from elements with "readonly" or "disabled" attributes')}return o?f(o,{container:n}):s?"cut"===i?h(s):f(s,{container:n}):void 0}({action:i,container:this.container,target:this.target(e),text:this.text(e)})
this.emit(n?"success":"error",{action:i,text:n,trigger:e,clearSelection:function(){e&&e.focus(),window.getSelection().removeAllRanges()}})}},{key:"defaultAction",value:function(t){return v("action",t)}},{key:"defaultTarget",value:function(t){var e=v("target",t)
if(e)return document.querySelector(e)}},{key:"defaultText",value:function(t){return v("text",t)}},{key:"destroy",value:function(){this.listener.destroy()}}],n=[{key:"copy",value:function(t){var e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{container:document.body}
return f(t,e)}},{key:"cut",value:function(t){return h(t)}},{key:"isSupported",value:function(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:["copy","cut"],e="string"==typeof t?[t]:t,i=!!document.queryCommandSupported
return e.forEach((function(t){i=i&&!!document.queryCommandSupported(t)})),i}}],i&&g(e.prototype,i),n&&g(e,n),l}(s()),w=y},828:function(t){if("undefined"!=typeof Element&&!Element.prototype.matches){var e=Element.prototype
e.matches=e.matchesSelector||e.mozMatchesSelector||e.msMatchesSelector||e.oMatchesSelector||e.webkitMatchesSelector}t.exports=function(t,e){for(;t&&9!==t.nodeType;){if("function"==typeof t.matches&&t.matches(e))return t
t=t.parentNode}}},438:function(t,e,i){var n=i(828)
function s(t,e,i,n,s){var r=o.apply(this,arguments)
return t.addEventListener(i,r,s),{destroy:function(){t.removeEventListener(i,r,s)}}}function o(t,e,i,s){return function(i){i.delegateTarget=n(i.target,e),i.delegateTarget&&s.call(t,i)}}t.exports=function(t,e,i,n,o){return"function"==typeof t.addEventListener?s.apply(null,arguments):"function"==typeof i?s.bind(null,document).apply(null,arguments):("string"==typeof t&&(t=document.querySelectorAll(t)),Array.prototype.map.call(t,(function(t){return s(t,e,i,n,o)})))}},879:function(t,e){e.node=function(t){return void 0!==t&&t instanceof HTMLElement&&1===t.nodeType},e.nodeList=function(t){var i=Object.prototype.toString.call(t)
return void 0!==t&&("[object NodeList]"===i||"[object HTMLCollection]"===i)&&"length"in t&&(0===t.length||e.node(t[0]))},e.string=function(t){return"string"==typeof t||t instanceof String},e.fn=function(t){return"[object Function]"===Object.prototype.toString.call(t)}},370:function(t,e,i){var n=i(879),s=i(438)
t.exports=function(t,e,i){if(!t&&!e&&!i)throw new Error("Missing required arguments")
if(!n.string(e))throw new TypeError("Second argument must be a String")
if(!n.fn(i))throw new TypeError("Third argument must be a Function")
if(n.node(t))return function(t,e,i){return t.addEventListener(e,i),{destroy:function(){t.removeEventListener(e,i)}}}(t,e,i)
if(n.nodeList(t))return function(t,e,i){return Array.prototype.forEach.call(t,(function(t){t.addEventListener(e,i)})),{destroy:function(){Array.prototype.forEach.call(t,(function(t){t.removeEventListener(e,i)}))}}}(t,e,i)
if(n.string(t))return function(t,e,i){return s(document.body,t,e,i)}(t,e,i)
throw new TypeError("First argument must be a String, HTMLElement, HTMLCollection, or NodeList")}},817:function(t){t.exports=function(t){var e
if("SELECT"===t.nodeName)t.focus(),e=t.value
else if("INPUT"===t.nodeName||"TEXTAREA"===t.nodeName){var i=t.hasAttribute("readonly")
i||t.setAttribute("readonly",""),t.select(),t.setSelectionRange(0,t.value.length),i||t.removeAttribute("readonly"),e=t.value}else{t.hasAttribute("contenteditable")&&t.focus()
var n=window.getSelection(),s=document.createRange()
s.selectNodeContents(t),n.removeAllRanges(),n.addRange(s),e=n.toString()}return e}},279:function(t){function e(){}e.prototype={on:function(t,e,i){var n=this.e||(this.e={})
return(n[t]||(n[t]=[])).push({fn:e,ctx:i}),this},once:function(t,e,i){var n=this
function s(){n.off(t,s),e.apply(i,arguments)}return s._=e,this.on(t,s,i)},emit:function(t){for(var e=[].slice.call(arguments,1),i=((this.e||(this.e={}))[t]||[]).slice(),n=0,s=i.length;n<s;n++)i[n].fn.apply(i[n].ctx,e)
return this},off:function(t,e){var i=this.e||(this.e={}),n=i[t],s=[]
if(n&&e)for(var o=0,r=n.length;o<r;o++)n[o].fn!==e&&n[o].fn._!==e&&s.push(n[o])
return s.length?i[t]=s:delete i[t],this}},t.exports=e,t.exports.TinyEmitter=e}},e={}
function i(n){if(e[n])return e[n].exports
var s=e[n]={exports:{}}
return t[n](s,s.exports,i),s.exports}return i.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t}
return i.d(e,{a:e}),e},i.d=function(t,e){for(var n in e)i.o(e,n)&&!i.o(t,n)&&Object.defineProperty(t,n,{enumerable:!0,get:e[n]})},i.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},i(686)}().default},t.exports=e()},945:(t,e,i)=>{!function(){var e
e=void 0!==t.exports?i(619):window.PNGlib
var n=function(t,e){if("string"!=typeof t||t.length<15)throw"A hash of at least 15 characters is required."
this.defaults={background:[240,240,240,255],margin:.08,size:64,saturation:.7,brightness:.5,format:"png"},this.options="object"==typeof e?e:this.defaults,"number"==typeof arguments[1]&&(this.options.size=arguments[1]),arguments[2]&&(this.options.margin=arguments[2]),this.hash=t,this.background=this.options.background||this.defaults.background,this.size=this.options.size||this.defaults.size,this.format=this.options.format||this.defaults.format,this.margin=void 0!==this.options.margin?this.options.margin:this.defaults.margin
var i=parseInt(this.hash.substr(-7),16)/268435455,n=this.options.saturation||this.defaults.saturation,s=this.options.brightness||this.defaults.brightness
this.foreground=this.options.foreground||this.hsl2rgb(i,n,s)}
n.prototype={background:null,foreground:null,hash:null,margin:null,size:null,format:null,image:function(){return this.isSvg()?new s(this.size,this.foreground,this.background):new e(this.size,this.size,256)},render:function(){var t,e,i=this.image(),n=this.size,s=Math.floor(n*this.margin),o=Math.floor((n-2*s)/5),r=Math.floor((n-5*o)/2),a=i.color.apply(i,this.background),l=i.color.apply(i,this.foreground)
for(t=0;t<15;t++)e=parseInt(this.hash.charAt(t),16)%2?a:l,t<5?this.rectangle(2*o+r,t*o+r,o,o,e,i):t<10?(this.rectangle(1*o+r,(t-5)*o+r,o,o,e,i),this.rectangle(3*o+r,(t-5)*o+r,o,o,e,i)):t<15&&(this.rectangle(0*o+r,(t-10)*o+r,o,o,e,i),this.rectangle(4*o+r,(t-10)*o+r,o,o,e,i))
return i},rectangle:function(t,e,i,n,s,o){var r,a
if(this.isSvg())o.rectangles.push({x:t,y:e,w:i,h:n,color:s})
else for(r=t;r<t+i;r++)for(a=e;a<e+n;a++)o.buffer[o.index(r,a)]=s},hsl2rgb:function(t,e,i){return[255*(e=[i+=e*=i<.5?i:1-i,i-(t*=6)%1*e*2,i-=e*=2,i,i+t%1*e,i+e])[~~t%6],255*e[(16|t)%6],255*e[(8|t)%6]]},toString:function(t){return t?this.render().getDump():this.render().getBase64()},isSvg:function(){return this.format.match(/svg/i)}}
var s=function(t,e,i){this.size=t,this.foreground=this.color.apply(this,e),this.background=this.color.apply(this,i),this.rectangles=[]}
s.prototype={size:null,foreground:null,background:null,rectangles:null,color:function(t,e,i,n){var s=[t,e,i].map(Math.round)
return s.push(n>=0&&n<=255?n/255:1),"rgba("+s.join(",")+")"},getDump:function(){var t,e,i,n=this.foreground,s=this.background,o=.005*this.size
for(e="<svg xmlns='http://www.w3.org/2000/svg' width='"+this.size+"' height='"+this.size+"' style='background-color:"+s+";'><g style='fill:"+n+"; stroke:"+n+"; stroke-width:"+o+";'>",t=0;t<this.rectangles.length;t++)(i=this.rectangles[t]).color!=s&&(e+="<rect  x='"+i.x+"' y='"+i.y+"' width='"+i.w+"' height='"+i.h+"'/>")
return e+"</g></svg>"},getBase64:function(){if("function"==typeof btoa)return btoa(this.getDump())
if(Buffer)return new Buffer(this.getDump(),"binary").toString("base64")
throw"Cannot generate base64 output"}},void 0!==t.exports?t.exports=n:window.Identicon=n}()},619:t=>{!function(){function e(t,e){for(var i=2;i<arguments.length;i++)for(var n=0;n<arguments[i].length;n++)t[e++]=arguments[i].charAt(n)}function i(t){return String.fromCharCode(t>>24&255,t>>16&255,t>>8&255,255&t)}function n(t){return String.fromCharCode(255&t,t>>8&255)}var s=function(t,s,o){this.width=t,this.height=s,this.depth=o,this.pix_size=s*(t+1),this.data_size=2+this.pix_size+5*Math.floor((65534+this.pix_size)/65535)+4,this.ihdr_offs=0,this.ihdr_size=25,this.plte_offs=this.ihdr_offs+this.ihdr_size,this.plte_size=8+3*o+4,this.trns_offs=this.plte_offs+this.plte_size,this.trns_size=8+o+4,this.idat_offs=this.trns_offs+this.trns_size,this.idat_size=8+this.data_size+4,this.iend_offs=this.idat_offs+this.idat_size,this.iend_size=12,this.buffer_size=this.iend_offs+this.iend_size,this.buffer=new Array,this.palette=new Object,this.pindex=0
for(var r=new Array,a=0;a<this.buffer_size;a++)this.buffer[a]="\0"
e(this.buffer,this.ihdr_offs,i(this.ihdr_size-12),"IHDR",i(t),i(s),"\b"),e(this.buffer,this.plte_offs,i(this.plte_size-12),"PLTE"),e(this.buffer,this.trns_offs,i(this.trns_size-12),"tRNS"),e(this.buffer,this.idat_offs,i(this.idat_size-12),"IDAT"),e(this.buffer,this.iend_offs,i(this.iend_size-12),"IEND")
var l,c=30912
for(c+=31-c%31,e(this.buffer,this.idat_offs+8,(l=c,String.fromCharCode(l>>8&255,255&l))),a=0;(a<<16)-1<this.pix_size;a++){var h,u
a+65535<this.pix_size?(h=65535,u="\0"):(h=this.pix_size-(a<<16)-a,u=""),e(this.buffer,this.idat_offs+8+2+(a<<16)+(a<<2),u,n(h),n(~h))}for(a=0;a<256;a++){for(var f=a,d=0;d<8;d++)f=1&f?-306674912^f>>1&2147483647:f>>1&2147483647
r[a]=f}this.index=function(t,e){var i=e*(this.width+1)+t+1
return this.idat_offs+8+2+5*Math.floor(i/65535+1)+i},this.color=function(t,e,i,n){var s=(((n=n>=0?n:255)<<8|t)<<8|e)<<8|i
if(void 0===this.palette[s]){if(this.pindex==this.depth)return"\0"
var o=this.plte_offs+8+3*this.pindex
this.buffer[o+0]=String.fromCharCode(t),this.buffer[o+1]=String.fromCharCode(e),this.buffer[o+2]=String.fromCharCode(i),this.buffer[this.trns_offs+8+this.pindex]=String.fromCharCode(n),this.palette[s]=String.fromCharCode(this.pindex++)}return this.palette[s]},this.getBase64=function(){var t,e,i,n,s,o,r,a=this.getDump(),l="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",c=a.length,h=0,u=""
do{n=(t=a.charCodeAt(h))>>2,s=(3&t)<<4|(e=a.charCodeAt(h+1))>>4,i=a.charCodeAt(h+2),o=c<h+2?64:(15&e)<<2|i>>6,r=c<h+3?64:63&i,u+=l.charAt(n)+l.charAt(s)+l.charAt(o)+l.charAt(r)}while((h+=3)<c)
return u},this.getDump=function(){for(var t=65521,n=1,s=0,o=5552,a=0;a<this.height;a++)for(var l=-1;l<this.width;l++)s+=n+=this.buffer[this.index(l,a)].charCodeAt(0),0==(o-=1)&&(n%=t,s%=t,o=5552)
function c(t,n,s){for(var o=-1,a=4;a<s-4;a+=1)o=r[255&(o^t[n+a].charCodeAt(0))]^o>>8&16777215
e(t,n+s-4,i(-1^o))}return n%=t,s%=t,e(this.buffer,this.idat_offs+this.idat_size-8,i(s<<16|n)),c(this.buffer,this.ihdr_offs,this.ihdr_size),c(this.buffer,this.plte_offs,this.plte_size),c(this.buffer,this.trns_offs,this.trns_size),c(this.buffer,this.idat_offs,this.idat_size),c(this.buffer,this.iend_offs,this.iend_size),"PNG\r\n\n"+this.buffer.join("")}}
void 0!==t.exports?t.exports=s:window.PNGlib=s}()}}])
