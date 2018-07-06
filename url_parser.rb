
    
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
        
#     def path 
#         if @path == "" 
#             @path = nil
#         end 
#         @path
#     end

#     def port 
#         if (@port == "" || @port == nil) && scheme == "https"
#             @port = 443.to_s
#         elsif (@port == "" || @port == nil) && scheme == "http"
#             @port = 80.to_s
#         end 
#         @port
#     end

#     def query_string
#         query_string = @url.split('/')[3].split('?')[1].split('#')[0].split('&')
#         query_string.each do |item|
#             param = item.split('=')
#             @querystring[param[0]] = param[1]
#         end 
        
#         @querystring
#     end
# end
  