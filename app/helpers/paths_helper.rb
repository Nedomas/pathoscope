module PathsHelper
  def bookmark_js(path)
   %Q(javascript:
    (function(){
      s = document.createElement('script');
      s.src = '#{ENV['SERVER']}/assets/pathoscope.js?path_id=#{path.id}';
      document.body.app***REMOVED***Child(s);
    })();
   ).delete(' ')
***REMOVED***
***REMOVED***
