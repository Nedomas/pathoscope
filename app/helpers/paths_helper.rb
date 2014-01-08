module PathsHelper
  def bookmark_js
   %Q(javascript:
    (function(){
      s = document.createElement('script');
      s.src = '#{ENV['SERVER']}/assets/pathoscope.js';
      document.body.app***REMOVED***Child(s);
    })();
   ).delete(' ')
***REMOVED***
***REMOVED***
