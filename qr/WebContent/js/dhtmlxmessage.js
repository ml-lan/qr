//v.3.6 build 131108

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
You allowed to use this component or parts of it under GPL terms
To use it on other terms or get Professional edition of the component please contact us at sales@dhtmlx.com
*/
if(!window.dhtmlx)window.dhtmlx={};
(function(){function k(a,d){var b=a.callback;e(!1);a.box.parentNode.removeChild(a.box);g=a.box=null;b&&b(d)}function j(a){if(g){var a=a||event,b=a.which||event.keyCode;dhtmlx.message.keyboard&&((b==13||b==32)&&k(g,!0),b==27&&k(g,!1));a.preventDefault&&a.preventDefault();return!(a.cancelBubble=!0)}}function e(a){if(!e.cover)e.cover=document.createElement("DIV"),e.cover.onkeydown=j,e.cover.className="dhx_modal_cover",document.body.appendChild(e.cover);var b=document.body.scrollHeight;e.cover.style.display=
a?"inline-block":"none"}function l(a,b){return"<div class='dhtmlx_popup_button' result='"+b+"' ><div>"+a+"</div></div>"}function r(a){if(!b.area)b.area=document.createElement("DIV"),b.area.className="dhtmlx_message_area",b.area.style[b.position]="5px",document.body.appendChild(b.area);b.hide(a.id);var d=document.createElement("DIV");d.innerHTML="<div>"+a.text+"</div>";d.className="dhtmlx-info dhtmlx-"+a.type;d.onclick=function(){b.hide(a.id);a=null};b.position=="bottom"&&b.area.firstChild?b.area.insertBefore(d,
b.area.firstChild):b.area.appendChild(d);a.expire>0&&(b.timers[a.id]=window.setTimeout(function(){b.hide(a.id)},a.expire));b.pull[a.id]=d;d=null;return a.id}function s(a,b,i){var c=document.createElement("DIV");c.className=" dhtmlx_modal_box dhtmlx-"+a.type;c.setAttribute("dhxbox",1);var f="";if(a.width)c.style.width=a.width;if(a.height)c.style.height=a.height;a.title&&(f+='<div class="dhtmlx_popup_title">'+a.title+"</div>");f+='<div class="dhtmlx_popup_text"><span>'+(a.content?"":a.text)+'</span></div><div  class="dhtmlx_popup_controls">';
b&&(f+=l(a.ok||"OK",!0));i&&(f+=l(a.cancel||"Cancel",!1));if(a.buttons)for(var e=0;e<a.buttons.length;e++)f+=l(a.buttons[e],e);f+="</div>";c.innerHTML=f;if(a.content){var h=a.content;typeof h=="string"&&(h=document.getElementById(h));if(h.style.display=="none")h.style.display="";c.childNodes[a.title?1:0].appendChild(h)}c.onclick=function(b){var b=b||event,d=b.target||b.srcElement;if(!d.className)d=d.parentNode;if(d.className=="dhtmlx_popup_button"){var c=d.getAttribute("result"),c=c=="true"||(c==
"false"?!1:c);k(a,c)}};a.box=c;if(b||i)g=a;return c}function m(a,b,i){var c=a.tagName?a:s(a,b,i);a.hidden||e(!0);document.body.appendChild(c);var f=a.left||Math.abs(Math.floor(((window.innerWidth||document.documentElement.offsetWidth)-c.offsetWidth)/2)),g=a.top||Math.abs(Math.floor(((window.innerHeight||document.documentElement.offsetHeight)-c.offsetHeight)/2));c.style.top=a.position=="top"?"-3px":g+"px";c.style.left=f+"px";c.onkeydown=j;c.focus();a.hidden&&dhtmlx.modalbox.hide(c);return c}function o(a){return m(a,
!0,!1)}function p(a){return m(a,!0,!0)}function q(a){return m(a)}function n(a,b,e){typeof a!="object"&&(typeof b=="function"&&(e=b,b=""),a={text:a,type:b,callback:e});return a}function t(a,d,e,c){typeof a!="object"&&(a={text:a,type:d,expire:e,id:c});a.id=a.id||b.uid();a.expire=a.expire||b.expire;return a}var g=null;document.attachEvent?document.attachEvent("onkeydown",j):document.addEventListener("keydown",j,!0);dhtmlx.alert=function(){var a=n.apply(this,arguments);a.type=a.type||"confirm";return o(a)};
dhtmlx.confirm=function(){var a=n.apply(this,arguments);a.type=a.type||"alert";return p(a)};dhtmlx.modalbox=function(){var a=n.apply(this,arguments);a.type=a.type||"alert";return q(a)};dhtmlx.modalbox.hide=function(a){for(;a&&a.getAttribute&&!a.getAttribute("dhxbox");)a=a.parentNode;a&&(a.parentNode.removeChild(a),e(!1))};var b=dhtmlx.message=function(a,b,e,c){a=t.apply(this,arguments);a.type=a.type||"info";var f=a.type.split("-")[0];switch(f){case "alert":return o(a);case "confirm":return p(a);case "modalbox":return q(a);
default:return r(a)}};b.seed=(new Date).valueOf();b.uid=function(){return b.seed++};b.expire=4E3;b.keyboard=!0;b.position="top";b.pull={};b.timers={};b.hideAll=function(){for(var a in b.pull)b.hide(a)};b.hide=function(a){var d=b.pull[a];d&&d.parentNode&&(window.setTimeout(function(){d.parentNode.removeChild(d);d=null},2E3),d.className+=" hidden",b.timers[a]&&window.clearTimeout(b.timers[a]),delete b.pull[a])}})();

//v.3.6 build 131108

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
You allowed to use this component or parts of it under GPL terms
To use it on other terms or get Professional edition of the component please contact us at sales@dhtmlx.com
*/