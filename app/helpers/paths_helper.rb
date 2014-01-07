module PathsHelper
  def bookmark_js(path)
   %Q(javascript:
    (function(){
      s = document.createElement('script');
      s.src = '#{root_url}pathoscope.js?path_id=#{path.id}';
      document.body.app***REMOVED***Child(s);
    })();
   ).delete(' ')
***REMOVED***
***REMOVED***
