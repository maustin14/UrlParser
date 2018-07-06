
    
class UrlParser

  attr_reader :scheme, :domain, :path, :fragment_id, :port

    def initialize(url)
        @url = url
        @fragment_id = url.split("#").last
         @path = @url.split('/')[3].split('?')[0]
         @querystring = {}
        if @url.split('/')[2].include? ':' 
            @port = @url.split('/')[2].split(':')[1]
        else 
            @port = nil 
        end
    end
    
    def scheme 
        scheme_arr = @url.split(":")
        return scheme_arr[0]
    end
    
    def domain 
       domain_arr = @url.split("//").last.split(":").first
       return domain_arr
    end
end
