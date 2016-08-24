class Install
  def self.bookmark_js
    %Q(javascript:
    (function(){
      s = document.createElement('script');
      s.src = '#{SERVER}/assets/app/loader.js';
      document.body.appendChild(s);
    })();
    ).delete(' ').delete("\n")
  end
end
