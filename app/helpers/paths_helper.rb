module PathsHelper
***REMOVED*** def bookmark_js
***REMOVED***   %Q(javascript:
***REMOVED***   (function(){
***REMOVED***     s = document.createElement('script');
***REMOVED***     s.src = '#{SERVER}/assets/pathoscope.js';
***REMOVED***     document.body.app***REMOVED***Child(s);
***REMOVED***   })();
***REMOVED***   ).delete(' ')
***REMOVED*** ***REMOVED***
***REMOVED***
